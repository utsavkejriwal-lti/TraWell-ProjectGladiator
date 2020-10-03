import { Component, OnInit } from '@angular/core';
import { UserStatusService } from '../services/user.service';

@Component({
  selector: 'app-error-page',
  templateUrl: './error-page.component.html',
  styleUrls: ['./error-page.component.css']
})
export class ErrorPageComponent implements OnInit {

  constructor(private userService: UserStatusService) { }

  ngOnInit(): void {
    this.userService.userStatusUpdate(false);
    
  }

}
