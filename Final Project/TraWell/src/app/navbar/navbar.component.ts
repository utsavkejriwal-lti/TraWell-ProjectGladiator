import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserStatusService } from '../services/user.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  signedIn: boolean;
  user;
  constructor(private userStatus: UserStatusService, private router:Router) {

  }

  ngOnInit(): void {
    this.signedIn = this.userStatus.isLoggedIn;
    this.user = this.userStatus.user;
    this.userStatus.userStatussObs.subscribe((data) => {
      this.signedIn = data;
      this.user = this.userStatus.user;
    })
    
  }

  SignInButtonClick(){
    sessionStorage.removeItem("finalDetails");
    sessionStorage.removeItem("onwardJourney");
    sessionStorage.removeItem("searchquery");
    this.router.navigateByUrl('/signin');
  }
}
