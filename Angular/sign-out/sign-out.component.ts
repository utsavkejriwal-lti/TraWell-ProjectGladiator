import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserStatusService } from '../services/user.service';

@Component({
  selector: 'app-sign-out',
  templateUrl: './sign-out.component.html',
  styleUrls: ['./sign-out.component.css']
})
export class SignOutComponent implements OnInit {

  constructor(private userStatusService: UserStatusService, private router: Router) {
   
  }

  ngOnInit(): void {
    this.userStatusService.userStatusUpdate(false);
    this.router.navigateByUrl('');
    
    
  }

}
