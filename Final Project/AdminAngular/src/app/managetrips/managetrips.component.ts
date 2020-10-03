import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AdminAuthenticationService } from '../services/authentication.service';

import { ManagetripsService } from '../services/ManagetripsService';

import {Managetrips} from '../models/managetrips';
import { ManageroutesService } from '../services/ManageroutesService';
import { ManagebusesService } from '../services/ManagebusesService';
import { Managetripstops } from '../models/managetripstops';
import { formatDate } from '@angular/common';


@Component({
  selector: 'app-managetrips',
  templateUrl: './managetrips.component.html',
  styleUrls: ['./managetrips.component.css']
})
export class ManagetripsComponent implements OnInit {
  trips
  NewTrip: Managetrips;
  Routes = null;
  Buses = null;
  DateToday;
  AddNewError = "";
  // trip: Managetrips;
  

  constructor(private managetripsService:ManagetripsService,private adminAuth: AdminAuthenticationService, private router: Router, private managerouteservice: ManageroutesService, private managebusService: ManagebusesService) { 
    // this.trip= new Managetrips();
    this.NewTrip = new Managetrips();
    this.NewTrip.TripStops = [];
    this.NewTrip.CostPerKm = 2.5;
    this.DateToday = formatDate(new Date(), "yyyy-MM-dd'T'HH:mm", "en")
   
  }

 

  ngOnInit(): void {
   

    if(!this.adminAuth.isLoggedIn){
      this.router.navigate(['/']); 
     
    }else{
      this.NewTrip.Admin = this.adminAuth.admin.Id;
    }
    this.adminAuth.adminStatussObs.subscribe((data) => {
      
      if(!data){
        this.router.navigate(['/']); 
      }
    })

    this.managetripsService.getAllTrips().subscribe((data)=>{
      
      this.trips = data;
      console.log(data);
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    })

    this.managerouteservice.getAllRoutes().subscribe((data) => {
      
      this.Routes = data;
     
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    })

    this.managebusService.getAllBusesFromAPI().subscribe((data) => {
    
      this.Buses = data;
      this.NewTrip.BusID = data[0].Id;
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    })
  }


  NewTripRouteChange(id){
    this.DeleteErrorMessage();
    var RouteId = Number(id);
    if(!isNaN(RouteId)){
      this.NewTrip.RouteID = RouteId;
      var index = -1;
      for(let i =0; i < this.Routes.length; i++){
        if(this.Routes[i].route.Id == RouteId){
          index = i;
          break;
        }
      }
      this.NewTrip.TripStops = [];
      for(let j = 0; j < this.Routes[index].stops.length; j++){
        var TripStop = new Managetripstops();
        TripStop.Stop = this.Routes[index].stops[j].Stop1;
        TripStop.Description = this.Routes[index].stops[j].Place.Name + ", " + this.Routes[index].stops[j].Place.City;
        TripStop.ArrivalTime = null;
        TripStop.DepartureTime = null;
        this.NewTrip.TripStops.push(TripStop);
      }
     
    }else{
      this.NewTrip.RouteID = undefined;
      this.NewTrip.TripStops = []; 
    }
    
  }

  DeleteErrorMessage(){
    this.AddNewError = "";
  }

  AddTripButton(){
    var Error: boolean = false;
    if(this.NewTrip.BusID == undefined || this.NewTrip.BusID == null){
      Error = true;
    }

    if(isNaN(this.NewTrip.CostPerKm) || this.NewTrip.CostPerKm < 0){
      Error = true;
    }

    if(this.NewTrip.RouteID == undefined){
      Error = true;
    }else{
      let count = 0;
      for( let i = 0; i < this.NewTrip.TripStops.length; i++){
        let arrTime = this.NewTrip.TripStops[i].ArrivalTime;
        let depTime = this.NewTrip.TripStops[i].DepartureTime;
        
        
        if((!arrTime && depTime) || (arrTime && !depTime) || (arrTime > depTime) || (arrTime && depTime && (i > 0 && arrTime <= this.NewTrip.TripStops[i-1].DepartureTime) || arrTime < this.DateToday)){
          Error = true;
          console.log(arrTime + " " + depTime)
          break;
        }else if(arrTime && depTime){
          count++;
        }

      }
      if(count < 2){
        Error = true;
      }

    }
    
    


    if(!Error){
      let i = 0;
      while(i < this.NewTrip.TripStops.length){
        let arrTime = this.NewTrip.TripStops[i].ArrivalTime;
        let depTime = this.NewTrip.TripStops[i].DepartureTime;

        if(!arrTime && !depTime){
          this.NewTrip.TripStops.splice(i,1);
        }else{
          i++;
        }
      }
      var TripToInsert = {
        trip: {
          Admin:this.NewTrip.Admin,
          BusID:this.NewTrip.BusID,
          RouteID:this.NewTrip.RouteID, 
          CostPerKm:this.NewTrip.CostPerKm
        },
        tripStops: this.NewTrip.TripStops
      }

      this.managetripsService.InsertNewTrip(TripToInsert).subscribe((data)=>{
          if(data == "Added"){
            this.AddNewError = "<span class='text-success'>Trip was added</span>";
            this.managetripsService.getAllTrips().subscribe((data)=>{
      
              this.trips = data;
            },(error) =>{
              this.router.navigateByUrl('/errorpage');
            })

          }else{
            this.AddNewError = "<span class='text-danger'>Error Processing</span>";
          }
      },(error) =>{
        this.router.navigateByUrl('/errorpage');
      });
    }else{
      this.AddNewError = "<span class='text-danger'>Invalid Details</span>";
    }

    
  }

}
