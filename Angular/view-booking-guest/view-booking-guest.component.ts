import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserStatusService } from '../services/user.service';

@Component({
  selector: 'app-view-booking-guest',
  templateUrl: './view-booking-guest.component.html',
  styleUrls: ['./view-booking-guest.component.css']
})
export class ViewBookingGuestComponent implements OnInit {

  constructor(private userStatusService: UserStatusService, private router: Router) { }

  ngOnInit(): void {
    if(this.userStatusService.isLoggedIn){
      this.router.navigateByUrl('');
    }
    this.userStatusService.userStatussObs.subscribe((data) => {
      if(data){
        this.router.navigateByUrl('');
      }
    })
  }

}
