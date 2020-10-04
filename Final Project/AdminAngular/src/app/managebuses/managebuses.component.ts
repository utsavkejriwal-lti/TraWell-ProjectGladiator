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
  NewBus: Managebuses;
  NewBusMessage;
  constructor(private managebusesService:ManagebusesService,private adminAuth: AdminAuthenticationService, private router: Router) {
    this.bus = new Managebuses();
    this.NewBus = new Managebuses();
   }



  EditBus(rid){
    this.bus = this.buses[Number(rid)];
    this.bus.Admin = this.adminAuth.admin.Id;
    this.managebusesService.updateBusinAPI(this.bus).subscribe((data)=>{
      this.message="Done"
      this.managebusesService.getAllBusesFromAPI().subscribe((data2)=>{
        this.buses = data2;
      },(error) =>{
        this.router.navigateByUrl('/errorpage');
      })
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    })
  }
  changeID(rid){
    this.busId = rid.value;
  }
  

  InsertBus(){
    if(this.NewBus.Admin && this.NewBus.Name && this.NewBus.Number && this.NewBus.Seats && this.NewBus.hasAc && this.NewBus.hasWifi && this.NewBus.isRecliner && this.NewBus.SeatMap){
      var SeatMap = this.NewBus.SeatMap.split('-');
      if(SeatMap.length == 2){
        var seatPerRow = Number(SeatMap[0])+ Number(SeatMap[1]);
        if(this.NewBus.Seats%seatPerRow == 0){
          this.managebusesService.insertBusThroughAPI(this.NewBus).subscribe((data)=>{
            this.message=data;
            this.NewBus = new Managebuses();
            this.NewBusMessage = "Data Inserted";
            this.managebusesService.getAllBusesFromAPI().subscribe((data2)=>{
              this.buses = data2;
            },(error) =>{
              this.router.navigateByUrl('/errorpage');
            })
          },(error) =>{
            this.router.navigateByUrl('/errorpage');
          })
        }else{
          this.NewBusMessage = "Invalid Seat Map";
        }
      }else{
        this.NewBusMessage = "Invalid Seat Map"
      }
    }else{
      this.NewBusMessage = "Details Missing";
    }
  }
  

  ngOnInit(): void {
    if(!this.adminAuth.isLoggedIn){
      this.router.navigate(['/']); 
    }else{
      this.NewBus.Admin = this.adminAuth.admin.Id;
    }
    this.adminAuth.adminStatussObs.subscribe((data) => {
      
      if(!data){
        this.router.navigate(['/']); 
      }else{
        this.NewBus.Admin = this.adminAuth.admin.Id;
      }
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    })

    this.managebusesService.getAllBusesFromAPI().subscribe((data)=>{
      this.buses = data;
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    })

    
  }

}
