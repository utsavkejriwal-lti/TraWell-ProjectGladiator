import { Component, OnInit } from '@angular/core';
import { AdminAuthenticationService } from '../services/authentication.service';

@Component({
  selector: 'app-error-page',
  templateUrl: './error-page.component.html',
  styleUrls: ['./error-page.component.css']
})
export class ErrorPageComponent implements OnInit {

  constructor(private admin: AdminAuthenticationService) { }

  ngOnInit(): void {
    //this.admin.userStatusUpdate(false);
  }

}
