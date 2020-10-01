import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AdminAuthenticationService } from '../services/authentication.service';

import { ManagetripsService } from '../services/ManagetripsService';


@Component({
  selector: 'app-managetrips',
  templateUrl: './managetrips.component.html',
  styleUrls: ['./managetrips.component.css']
})
export class ManagetripsComponent implements OnInit {
  trips
 
  // trip: Managetrips;
  

  constructor(private managetripsService:ManagetripsService,private adminAuth: AdminAuthenticationService, private router: Router) { 
    // this.trip= new Managetrips();

  }

 

  ngOnInit(): void {
    this.managetripsService.getAllTrips().subscribe((data)=>{
      console.log(data);
      this.trips = data;
      
    })

    if(!this.adminAuth.isLoggedIn){
      this.router.navigate(['/']); 
    }
    this.adminAuth.adminStatussObs.subscribe((data) => {
      
      if(!data){
        this.router.navigate(['/']); 
      }
    })
  }

}
