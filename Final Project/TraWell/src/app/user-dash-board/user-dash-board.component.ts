import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserStatusService } from '../services/user.service';
import { UserLoginService } from '../services/userlogin.service';
import { ViewBookingService } from '../services/viewBooking.service';

@Component({
  selector: 'app-user-dash-board',
  templateUrl: './user-dash-board.component.html',
  styleUrls: ['./user-dash-board.component.css']
})
export class UserDashBoardComponent implements OnInit {

  user;
  constructor(private userStatusService: UserStatusService, private router:Router, private userDataService: UserLoginService, private viewBookingService: ViewBookingService) { }

  ngOnInit(): void {
    
    
   

    if(!this.userStatusService.isLoggedIn){
      this.router.navigateByUrl('');
    }else{
      this.user = this.userStatusService.user;
      
    }
    this.userStatusService.userStatussObs.subscribe((data) => {
      if(!data){
        this.router.navigateByUrl('');
      }else{
        this.user = this.userStatusService.user;
      }
    })
    
  }

  manageBookingsClick(){
    this.viewBookingService.getBookingIds(this.userStatusService.user.Id).subscribe((data) => {
      this.viewBookingService.BookingIds = data;
      this.router.navigateByUrl('viewbooking');
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    })
  }

}
