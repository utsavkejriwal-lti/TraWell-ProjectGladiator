import { Component, OnInit } from '@angular/core';
import { ReservationDetails } from '../models/reservationDetails';
import { ReservationdetailsService } from '../services/ReservationdetailsService';


@Component({
  selector: 'app-reservation-details',
  templateUrl: './reservation-details.component.html',
  styleUrls: ['./reservation-details.component.css']
})
export class ReservationDetailsComponent implements OnInit {
  bus: ReservationDetails;
  buses

  constructor(private reservationdetailsService:ReservationdetailsService) {
    this.bus = new ReservationDetails();
   }

  

  ngOnInit(): void {
    this.reservationdetailsService.getAllDetailsFromAPI().subscribe((data)=>{
      this.buses = data;
    })
  }

}
