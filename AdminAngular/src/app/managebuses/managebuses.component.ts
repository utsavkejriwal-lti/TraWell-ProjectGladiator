import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Managebuses } from '../models/managebuses';
import { AdminAuthenticationService } from '../services/authentication.service';
import { ManagebusesService } from '../services/ManagebusesService';


@Component({
  selector: 'app-managebuses',
  templateUrl: './managebuses.component.html',
  styleUrls: ['./managebuses.component.css']
})
export class ManagebusesComponent implements OnInit {
  
  buses
  message: any;
  bus: Managebuses;
  busId: any;

  constructor(private managebusesService:ManagebusesService,private adminAuth: AdminAuthenticationService, private router: Router) {
    this.bus = new Managebuses();
   }



  EditBus(rid){
    this.bus = this.buses[Number(rid)];
    console.log(rid);
    this.managebusesService.updateBusinAPI(this.bus).subscribe((data)=>{
      this.message="Done"
      this.managebusesService.getAllBusesFromAPI().subscribe((data2)=>{
        this.buses = data2;
      })
    })
  }
  changeID(rid){
    this.busId = rid.value;
  }
  DeleteBus(rid){
    this.bus = this.buses[Number(rid)];
    console.log();
    this.managebusesService.deleteBusinAPI(this.bus.Id).subscribe((data)=>{
      this.message=data
      this.managebusesService.getAllBusesFromAPI().subscribe((data2)=>{
        this.buses = data2;
      })
    })

  }

  InsertBus(){
    
    this.managebusesService.insertBusThroughAPI(this.bus).subscribe((data)=>{
      this.message=data;
      this.managebusesService.getAllBusesFromAPI().subscribe((data2)=>{
        this.buses = data2;
      })
    })

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

    this.managebusesService.getAllBusesFromAPI().subscribe((data)=>{
      this.buses = data;
    })

    
  }

}
