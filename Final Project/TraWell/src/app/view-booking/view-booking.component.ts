import { Component, OnInit } from '@angular/core';
import { ViewBookingService } from '../services/viewBooking.service';
import {formatDate} from '@angular/common';
import jspdf from 'jspdf';
import html2canvas from 'html2canvas';
import { UserStatusService } from '../services/user.service';


@Component({
  selector: 'app-view-booking',
  templateUrl: './view-booking.component.html',
  styleUrls: ['./view-booking.component.css']
})
export class ViewBookingComponent implements OnInit {

  BookingIds;
  Bookings = [];
  

  constructor(private viewBookingService: ViewBookingService, private userService: UserStatusService) { 
    sessionStorage.removeItem("searchquery");
    sessionStorage.removeItem("finalDetails");
    sessionStorage.removeItem("onwardJourney");
    sessionStorage.removeItem("IsReturn");
    sessionStorage.removeItem("retJourney");
  }

  ngOnInit(): void {
    console.log(this.viewBookingService.BookingIds);
    this.BookingIds = this.viewBookingService.BookingIds;
    if(this.BookingIds != undefined){
      this.updateBookings();
    }else{
      this.userService.userStatussObs.subscribe((data) => {
        if(data){
          this.viewBookingService.getBookingIds(this.userService.user.Id).subscribe((data2)=>{
            this.BookingIds = data2;
            this.updateBookings();
          })
        }else{
          this.BookingIds = [];
        }
      });
      
    }

    
  }


  ShowCancelButton(checkDate: Date):boolean{
    var today = formatDate(new Date(), 'yyyy-MM-dd','en');
    var check = formatDate(checkDate, 'yyyy-MM-dd','en');
    if(today < check){
      
     
      return true;
    }else{
      
      return false;
    }
  }

  CancelBooking(booking){
    this.viewBookingService.CancelBooking(booking.BookingID).subscribe((data2) => {
      if(this.BookingIds != undefined){
        this.updateBookings();
        this.userService.GetUserFromApi();
      }
    });
  }

  updateBookings(){
    this.Bookings = [];
    var bookingsToInsert;    
        
          this.viewBookingService.GetBookingDetailsFromApi(this.BookingIds).subscribe((data) => {
            if(data != undefined || data != null || data != {}){
              bookingsToInsert = data;
              
              this.Bookings = bookingsToInsert;
            }
           
          });
        

        
       
  }

  updateFeedback(i){
    console.log(this.Bookings[i]);
    var feedback = {
      BookingID: this.Bookings[i].booking.BookingID,
      BusID: this.Bookings[i].bus.Id,
      BookingFeedback: this.Bookings[i].feedback.BusFeedback,
      BusFeedback: this.Bookings[i].feedback.BusFeedback
    }
    this.viewBookingService.insertFeedback(feedback).subscribe((data) => {
      this.updateBookings();
    })
  }

  PrintTicket(e){
   
    let data = document.getElementById('print'+e);  
    html2canvas(data).then(canvas => {
      const contentDataURL = canvas.toDataURL('image/png')  
      
      let pdf = new jspdf('p', 'cm', 'a4'); 
      pdf.addImage(contentDataURL, 'PNG', 0, 0, 20.5, 21.0);  
      pdf.save('Filename.pdf');   
    }); 
  }
}
