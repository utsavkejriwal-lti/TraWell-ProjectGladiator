import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AdminAuthenticationService } from '../services/authentication.service';

@Component({
  selector: 'app-navigation-bar',
  templateUrl: './navigation-bar.component.html',
  styleUrls: ['./navigation-bar.component.css']
})
export class NavigationBarComponent implements OnInit {

  IsLoggedIn = false;
  admin;
  constructor(private adminAuth: AdminAuthenticationService, private router: Router) { }

  ngOnInit(): void {
    this.IsLoggedIn = this.adminAuth.isLoggedIn;
    this.admin = this.adminAuth.admin;
    this.adminAuth.adminStatussObs.subscribe((data) => {
      
      this.IsLoggedIn = data;
      this.admin = this.adminAuth.admin;
    })
  }

  signout(){
    this.adminAuth.userStatusUpdate(false);
  }

}
