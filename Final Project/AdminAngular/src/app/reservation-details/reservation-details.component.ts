import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ReservationDetails } from '../models/reservationDetails';
import { AdminAuthenticationService } from '../services/authentication.service';
import { ReservationdetailsService } from '../services/ReservationdetailsService';


@Component({
  selector: 'app-reservation-details',
  templateUrl: './reservation-details.component.html',
  styleUrls: ['./reservation-details.component.css']
})
export class ReservationDetailsComponent implements OnInit {
  bus: ReservationDetails;
  buses
  Bookings = [];
  constructor(private reservationdetailsService:ReservationdetailsService,private adminAuth: AdminAuthenticationService, private router: Router) {
    this.bus = new ReservationDetails();
   }

  

  ngOnInit(): void {
    

    if(!this.adminAuth.isLoggedIn){
      this.router.navigate(['/']); 
    }
    this.adminAuth.adminStatussObs.subscribe((data) => {
      
      if(!data){
        this.router.navigate(['/']); 
      }
    })
    this.UpdateDetails();
    
  }

  UpdateDetails(){
    var bookings;
    this.reservationdetailsService.GetBookingDetailsFromApi().subscribe((data)=>{
      
     bookings = data;
     this.Bookings = bookings;
    })
  }

}
