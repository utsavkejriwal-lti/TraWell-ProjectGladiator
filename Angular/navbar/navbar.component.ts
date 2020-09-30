import { Component, OnInit } from '@angular/core';
import { UserStatusService } from '../services/user.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  signedIn: boolean;
  user;
  constructor(private userStatus: UserStatusService) {

  }

  ngOnInit(): void {
    this.userStatus.userStatussObs.subscribe((data) => {
      this.signedIn = data;
      this.user = this.userStatus.user;
    })
    this.userStatus.UpdateService();
  }

}
