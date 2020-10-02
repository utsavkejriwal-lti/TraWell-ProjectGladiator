import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AdminAuthenticationService } from '../services/authentication.service';
import {ManageroutesService} from '../services/ManageroutesService'
import {RouteStop} from '../models/RouteStop';

@Component({
  selector: 'app-manageroutes',
  templateUrl: './manageroutes.component.html',
  styleUrls: ['./manageroutes.component.css']
})
export class ManageroutesComponent implements OnInit {
 
  routes
  InsertRoutesStops: RouteStop[] = [];
  placeList;
  routeMessage = "";
  message
  constructor(private manageroutesService:ManageroutesService,private adminAuth: AdminAuthenticationService, private router: Router) { }

  ngOnInit(): void {
    if(!this.adminAuth.isLoggedIn){
      this.router.navigate(['/']); 
    }
    this.adminAuth.adminStatussObs.subscribe((data) => {
      
      if(!data){
        this.router.navigate(['/']); 
      }
    })

    this.manageroutesService.getAllRoutes().subscribe((data)=>{
     
      this.routes = data;
    })

    this.manageroutesService.getAllPlaces().subscribe((data)=>{
      this.placeList = data;
    })
  }

  AddRoute(){
    var ValidZero = false;
    var ValidNonzero = false;
    var ValidStop = true;
    var AllDistance = true;
    for(let x =0 ; x < this.InsertRoutesStops.length; x++){
      if(this.InsertRoutesStops[x].DistanceFromOrigin == 0 && this.InsertRoutesStops[0].DistanceFromOrigin == 0){
        ValidZero = true;
      }else{
        ValidNonzero = true;
      }
      if(!this.ValidateCity(this.InsertRoutesStops[x].Stop1)){
        ValidStop =false;
      }
      if(this.InsertRoutesStops[x].DistanceFromOrigin == undefined || this.InsertRoutesStops[x].DistanceFromOrigin == null || this.InsertRoutesStops[x].DistanceFromOrigin < 0){
        AllDistance = false;
      }
      if(x>0 && this.InsertRoutesStops[x].DistanceFromOrigin <  this.InsertRoutesStops[x].DistanceFromOrigin){
        AllDistance = false;
      }

    }

    if(!ValidStop || !ValidZero || !ValidNonzero || !AllDistance){
     
      this.routeMessage = '<span class="text-danger">Invalid Details</span>';
    }else{
      this.manageroutesService.addNewRoute(this.InsertRoutesStops).subscribe((data) => {
        this.manageroutesService.getAllRoutes().subscribe((data)=>{
          this.routeMessage = '<span class="text-success">Route Added</span>';
          this.routes = data;
          this.InsertRoutesStops = [];
        })
      })
    }
  }


  AddStop(){
   
    var StopNew = new RouteStop();
    this.InsertRoutesStops.push(StopNew);
  }


  removeStop(id){
    this.InsertRoutesStops.splice(id,1);
  }

  ValidateCity(city:string):boolean{
   
    let found = false;
    for (let index = 0; index < this.placeList.length; index++) {
      if(this.placeList[index].Code == city){
       
        found = true;
      }
    }
    return found;
  }

}
