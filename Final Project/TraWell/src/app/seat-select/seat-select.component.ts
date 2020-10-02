import { Component, Input, OnChanges, OnInit,  SimpleChanges } from '@angular/core';
import { BusSeatBooking } from '../model/BusSeatBooking';
import { PassengerDetail } from '../model/passenger';

@Component({
  selector: 'app-seat-select',
  templateUrl: './seat-select.component.html',
  styleUrls: ['./seat-select.component.css']
})
export class SeatSelectComponent implements OnInit, OnChanges {

  @Input() BusDetails : BusSeatBooking;
  @Input() passenger: PassengerDetail;
  @Input() journeyIsOnward: boolean = false;
  IsPassengerAvail: boolean = false;
  IsJourneyDetAvail: boolean = false;
  selectedSeat: number;
  SeatsOtherPassengers: number[] = [];

  BookedSeats: number[] = [];
  SeatMapRight: number = 1;
  SeatMapLeft: number = 1;
  SeatRows: number = 1;
  SeatInRows: number = 1;
  @Input() passengers;

  
  constructor() { 
    
  }

  ngOnInit(): void {
  }

  ngOnChanges(changes: SimpleChanges){
    

    if(changes['passenger'].firstChange){
      this.IsPassengerAvail = true;
    }

    if(changes['journeyIsOnward'].firstChange){
      this.IsJourneyDetAvail = true;
    }
    if(changes['passenger'].firstChange && changes['journeyIsOnward'].firstChange){
      
      if(this.journeyIsOnward){
        this.selectedSeat = this.passenger.Seat  != undefined ? this.passenger.Seat : this.selectedSeat;
      }else{
        this.selectedSeat = this.passenger.Seat2 != undefined ? this.passenger.Seat2 : this.selectedSeat;
      }
    }

    if(changes['BusDetails'].firstChange){
      for(let j = 0; j < this.BusDetails.SeatsBooked.length; j++){
        this.BookedSeats.push(this.BusDetails.SeatsBooked[j]);
      }
      let seatMap = this.BusDetails.SeatMap.split("-",2);
      this.SeatMapLeft = Number(seatMap[0]);
      this.SeatMapRight = Number(seatMap[1]);
      this.SeatInRows = this.SeatMapLeft + this.SeatMapRight;
      this.SeatRows = Math.floor(this.BusDetails.TotalSeats/this.SeatInRows);
    }
  }


  SeatChange(){
    if(this.journeyIsOnward){
      this.passenger.Seat = Number(this.selectedSeat);
    }else{
      this.passenger.Seat2 = Number(this.selectedSeat);
    }

    
  }

  

  isDisabled(seatNo):boolean{
    //this.x++;
      

      seatNo = Number(seatNo);
      
      if(this.BookedSeats.indexOf(seatNo) != -1){
        return true;
      }
      
      this.SeatsOtherPassengers = this.journeyIsOnward ? this.passengers.map(x => x.Seat) : this.passengers.map(x => x.Seat2);
      this.SeatsOtherPassengers.splice(this.passenger.Id,1);
        
      if(this.SeatsOtherPassengers.indexOf(seatNo) != -1){
        return true;
      }

      return false; 
  }
}
