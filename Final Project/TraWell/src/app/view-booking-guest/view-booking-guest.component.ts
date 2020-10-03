import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserStatusService } from '../services/user.service';
import { ViewBookingService } from '../services/viewBooking.service';

@Component({
  selector: 'app-view-booking-guest',
  templateUrl: './view-booking-guest.component.html',
  styleUrls: ['./view-booking-guest.component.css']
})
export class ViewBookingGuestComponent implements OnInit {

  guestForm: FormGroup;
  constructor(private userStatusService: UserStatusService, private router: Router, private http: HttpClient, private viewBookingService: ViewBookingService) { }

  ngOnInit(): void {
    if(this.userStatusService.isLoggedIn){
      this.router.navigateByUrl('');
    }
    this.userStatusService.userStatussObs.subscribe((data) => {
      if(data){
        this.router.navigateByUrl('');
      }
    })


    this.guestForm = new FormGroup({
      Email: new FormControl(null, Validators.required),
      Contact: new FormControl(null,[Validators.required,Validators.pattern("^[0-9]{10}$")])
    })
  }

  GuestFormSubmit(){
    var Details = {
      Email: this.Email.value,
      Contact: this.Contact.value
    }

    this.http.post("http://localhost:54873/api/booking/getGuestBooking",Details).subscribe((data) => {
      this.viewBookingService.BookingIds = data;

      this.router.navigateByUrl('viewbooking');
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    })
  }

  get Email(){
    return this.guestForm.get('Email');
  }
  get Contact(){
    return this.guestForm.get('Contact');
  }
}
