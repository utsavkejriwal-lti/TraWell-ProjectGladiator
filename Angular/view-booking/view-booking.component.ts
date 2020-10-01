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
      //this.userService.UpdateService();
    }

    
  }


  ShowCancelButton(checkDate: Date):boolean{
    var today = formatDate(new Date(), 'yyyy-MM-dd','en');
    var check = formatDate(checkDate, 'yyyy-MM-dd','en');
    if(today <= check){
      
      console.log(today + "dd" +  check);
      return true;
    }else{
      
      return false;
    }
  }

  CancelBooking(booking){
    this.viewBookingService.CancelBooking(booking.BookingID).subscribe((data2) => {
      if(this.BookingIds != undefined){
        this.updateBookings();
        this.userService.UpdateUser();
      }
    });
  }

  updateBookings(){
    this.Bookings = [];
        
        for(let x = 0; x < this.BookingIds.length; x++){
          this.viewBookingService.GetBookingDetailsFromApi(this.BookingIds[x]).subscribe((data) => {
            if(data != undefined || data != null || data != {}){
              this.Bookings.push(data);
            }
            this.Bookings.sort((a, b) => (a.booking.BookingID < b.booking.BookingID) ? 1 : -1)
          });
        }
       
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
