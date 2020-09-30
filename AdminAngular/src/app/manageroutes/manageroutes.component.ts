import { Component, OnInit } from '@angular/core';
import {ManageroutesService} from '../services/ManageroutesService'

@Component({
  selector: 'app-manageroutes',
  templateUrl: './manageroutes.component.html',
  styleUrls: ['./manageroutes.component.css']
})
export class ManageroutesComponent implements OnInit {
 
  routes

  constructor(private manageroutesService:ManageroutesService) { }

  ngOnInit(): void {
    this.manageroutesService.getAllRoutes().subscribe((data)=>{
      console.log(data);
      this.routes = data;
      
    })
  }

}
