import { Component, OnInit } from '@angular/core';
import { Managebuses } from '../models/managebuses';
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

  constructor(private managebusesService:ManagebusesService) {
    this.bus = new Managebuses();
   }



  EditBus(rid){
    this.bus = this.buses[Number(rid)];
    console.log(rid);
    this.managebusesService.updateBusinAPI(this.bus).subscribe((data)=>{
      this.message="Done"
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
    })
  }

  InsertBus(){
    
    this.managebusesService.insertBusThroughAPI(this.bus).subscribe((data)=>{
      this.message=data;
    })

  }
  

  ngOnInit(): void {
    this.managebusesService.getAllBusesFromAPI().subscribe((data)=>{
      this.buses = data;
    })
  }

}
