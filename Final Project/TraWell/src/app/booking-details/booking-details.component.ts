import { AfterContentInit, Component, DoCheck, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import {formatDate} from '@angular/common';
import { TripSelect } from '../model/TripSelect';
import { TripSelectService} from '../services/tripSelect.service';
import { UserStatusService } from '../services/user.service';
import { GuestUserService } from '../services/guestUser.service';
import {PassengerDetail} from '../model/passenger';
import {  BusSeatBooking} from "../model/BusSeatBooking";
import { FinalDetails } from "../model/FinalDetails";
import { BookingDetails } from "../model/BookingDetails";
import { PaymentService } from '../services/payment.service';
import { GuestUser } from '../model/GuesUser';

@Component({
  selector: 'app-booking-details',
  templateUrl: './booking-details.component.html',
  styleUrls: ['./booking-details.component.css']
})
export class BookingDetailsComponent implements OnInit {

  onwardDetails: TripSelect;
  returnDetails: TripSelect;
  IsReturn: boolean;
  UserSignedIn: boolean;
  UserType;
  IsGuestUser: boolean = false;
  GuestAlreadyUser: boolean = false;
  GuestForm: FormGroup;
  user;
  Passengers: PassengerDetail[] = [];
  maxPassenger:number = 0;
  onwardBusDetails: BusSeatBooking;
  returnBusDetails: BusSeatBooking;
  proceedToPayErrorMessage: string;
  finalDetails: FinalDetails;

  constructor(private paymentService: PaymentService ,private router:Router, private tripSelectService: TripSelectService, private userService: UserStatusService, private guestUserService: GuestUserService) {
    
    this.onwardDetails = new TripSelect();
    this.returnDetails = new TripSelect();
    this.onwardBusDetails = new BusSeatBooking();
    this.returnBusDetails = new BusSeatBooking();


    this.onwardDetails = JSON.parse(sessionStorage.getItem('onwardJourney'));
    this.returnDetails = JSON.parse(sessionStorage.getItem('retJourney'));
    this.IsReturn = Boolean(sessionStorage.getItem('IsReturn'));
    if(this.onwardDetails != undefined && this.onwardDetails != null){
      this.tripSelectService.OnwardTrip = new TripSelect();
      this.tripSelectService.OnwardTrip = this.onwardDetails;
      this.onwardBusDetails.SeatAvailable = this.onwardDetails.Details.SeatAvailable;
      this.onwardBusDetails.SeatsBooked = this.onwardDetails.Details.SeatsBooked;
      this.onwardBusDetails.SeatMap = this.onwardDetails.BusDetails.SeatMap;
      this.onwardBusDetails.TotalSeats = this.onwardDetails.Details.SeatAvailable + this.onwardDetails.Details.SeatsBooked.length;

    }else{
      this.router.navigateByUrl('searchresults');
    }

    if(this.IsReturn != undefined && this.IsReturn && this.returnDetails != undefined){
      this.tripSelectService.ReturnTrip = new TripSelect();
      this.tripSelectService.ReturnTrip = this.returnDetails;
      this.tripSelectService.IsReturn = this.IsReturn;
      
      this.returnBusDetails.SeatAvailable = this.returnDetails.Details.SeatAvailable;
      this.returnBusDetails.SeatsBooked = this.returnDetails.Details.SeatsBooked;
      this.returnBusDetails.SeatMap = this.returnDetails.BusDetails.SeatMap;
      this.returnBusDetails.TotalSeats = this.returnDetails.Details.SeatAvailable + this.returnDetails.Details.SeatsBooked.length;
    }else{
      this.tripSelectService.IsReturn = false;
    }
    this.GuestForm = new FormGroup({
      GuestUserEmail: new FormControl(null, [Validators.required, Validators.pattern("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$")]),
      GuestUserContact: new FormControl(null, [Validators.required, Validators.pattern("^[0-9]{10}$")])
    })
    
    
    sessionStorage.removeItem("finalDetails");
  }

  ngOnInit(): void {
    
    this.GuestForm.valueChanges.subscribe((data) => {
      this.GuestAlreadyUser = false;
    })
    
      this.UserSignedIn = this.userService.isLoggedIn;
      if(this.UserSignedIn){
        this.user = this.userService.user;
      }
    
    this.userService.userStatussObs.subscribe((data) => {
      this.UserSignedIn = data;
      if(data){
        this.user = this.userService.user;
      }
    })
    
  }

  guestButtonClick(){
    if(this.GuestForm.valid){
      this.guestUserService.CheckandAddUser(this.GuestUserEmail.value, this.GuestUserContact.value).subscribe((data) => {
        if(data == "Exists"){
          this.GuestAlreadyUser = true;
        }else if(data == "Not"){
          this.GuestAlreadyUser = false;
          this.IsGuestUser = true;
        }
      },(error) =>{
        this.router.navigateByUrl('/errorpage');
      }
      )
    }
  }

  get GuestUserEmail(){
    return this.GuestForm.get("GuestUserEmail");
  }
  get GuestUserContact(){
    return this.GuestForm.get("GuestUserContact");
  }

  AddPassenger(){
    
    if(this.maxPassenger == 0){
      var numbers: number[] = [];
      numbers.push(this.onwardDetails.Details.SeatAvailable);
      numbers.push(5);
      if(this.IsReturn){
        numbers.push(this.returnDetails.Details.SeatAvailable);
      }
      numbers = numbers.sort((a, b) => a - b);
      
      this.maxPassenger = numbers[0];
    }
    for(let x = 0; x < this.Passengers.length; x++){
      this.Passengers[x].Id = x;
    }
    if(this.Passengers.length < this.maxPassenger){
      var passenger = new PassengerDetail();
      passenger.Id = this.Passengers.length;
      this.Passengers.push(passenger);
    } 
  }

 

  deletePassenger(id){
    this.Passengers.splice(id,1);
    for(let x = 0; x < this.Passengers.length; x++){
      this.Passengers[x].Id = x;
    }
  }

  ProceedToPay(){
    var error = false;
    for(let n =0; n<this.Passengers.length; n++){
      var currentPassenger = this.Passengers[n];
      if(currentPassenger.Name == undefined || currentPassenger.Name == null || currentPassenger.Name == ""){
        error = true;
        break;
      }
      if(currentPassenger.Seat == undefined || currentPassenger.Seat == null){
        error = true;
        break;
      }

      if(this.IsReturn && (currentPassenger.Seat2 == undefined || currentPassenger.Seat2 == null)){
        error = true;
        break;
      }

      if(currentPassenger.Age == undefined || currentPassenger.Age == null || currentPassenger.Age < 3 || currentPassenger.Age > 110){
        error = true;
        break;
      }

      if(currentPassenger.Gender != "Male" && currentPassenger.Gender != "Female" && currentPassenger.Gender != "Others"){
        error = true;
        break;
      }
    }
    if(error){
      this.proceedToPayErrorMessage = "Please fill all details";
    }else{
      //Proceed for payment;
      this.finalDetails = new FinalDetails();
      this.finalDetails.Passengers = this.Passengers;
      this.finalDetails.Bookings = [];
      var onwardBooking = new BookingDetails();
      onwardBooking.Amount = this.Passengers.length * this.onwardDetails.Details.CostperSeat;
      onwardBooking.Arrival = this.onwardDetails.Details.ToStop.Stop;
      onwardBooking.Boarding = this.onwardDetails.Details.FromStop.Stop;
      onwardBooking.Status = "booked";
      if(!this.IsGuestUser){
        onwardBooking.UserRegistered = 1;
        onwardBooking.UserId = this.userService.user.Id;
      }else{
        onwardBooking.UserRegistered = 0;
        this.finalDetails.GuestUser = new GuestUser();
        this.finalDetails.GuestUser.Contact = this.GuestUserContact.value;
        this.finalDetails.GuestUser.Email = this.GuestUserEmail.value;
      }

      onwardBooking.TripId = this.onwardDetails.Trip.Id;
      this.finalDetails.Bookings.push(onwardBooking);



      if(this.IsReturn){
        var returnBooking = new BookingDetails();
        returnBooking.Amount = this.Passengers.length * this.returnDetails.Details.CostperSeat;
        returnBooking.Arrival = this.returnDetails.Details.ToStop.Stop;
        returnBooking.Boarding = this.returnDetails.Details.FromStop.Stop;
        returnBooking.Status = "booked";
        if(!this.IsGuestUser){
          returnBooking.UserRegistered = 1;
          returnBooking.UserId = this.userService.user.Id;
        }else{
          returnBooking.UserRegistered = 0;
          this.finalDetails.GuestUser = new GuestUser();
          this.finalDetails.GuestUser.Contact = this.GuestUserContact.value;
          this.finalDetails.GuestUser.Email = this.GuestUserEmail.value;

        }

        returnBooking.TripId = this.returnDetails.Trip.Id;
        this.finalDetails.Bookings.push(returnBooking);
      }
      this.finalDetails.Transactions = [];

     
      this.paymentService.finalDetails = this.finalDetails;
      
      this.router.navigateByUrl('/payment');
    }

  }
}
