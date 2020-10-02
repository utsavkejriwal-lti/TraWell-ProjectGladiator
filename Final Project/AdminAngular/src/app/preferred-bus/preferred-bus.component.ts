import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {PreferredBus} from '../models/preferredBus'
import { AdminAuthenticationService } from '../services/authentication.service';
import { PreferredbusService } from '../services/PreferredbusService';

@Component({
  selector: 'app-preferred-bus',
  templateUrl: './preferred-bus.component.html',
  styleUrls: ['./preferred-bus.component.css']
})
export class PreferredBusComponent implements OnInit {
  detail: PreferredBus;
  details

  constructor(private prefferdbusService:PreferredbusService,private adminAuth: AdminAuthenticationService, private router: Router) {
    this.detail = new PreferredBus();
   }

  

  ngOnInit(): void {
    

    if(!this.adminAuth.isLoggedIn){
      this.router.navigate(['/']); 
    }
    this.adminAuth.adminStatussObs.subscribe((data) => {
      
      if(!data){
        this.router.navigate(['/']); 
      }
    })
    this.UpdateDetails();
  }

  UpdateDetails(){
    this.prefferdbusService.getAllDetailsFromAPI().subscribe((data)=>{
      this.details = data;
    })
  }

}
