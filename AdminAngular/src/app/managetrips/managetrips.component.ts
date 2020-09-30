import { Component, OnInit } from '@angular/core';

import { ManagetripsService } from '../services/ManagetripsService';


@Component({
  selector: 'app-managetrips',
  templateUrl: './managetrips.component.html',
  styleUrls: ['./managetrips.component.css']
})
export class ManagetripsComponent implements OnInit {
  trips
 
  // trip: Managetrips;
  

  constructor(private managetripsService:ManagetripsService) { 
    // this.trip= new Managetrips();

  }

 

  ngOnInit(): void {
    this.managetripsService.getAllTrips().subscribe((data)=>{
      console.log(data);
      this.trips = data;
      
    })
  }

}
