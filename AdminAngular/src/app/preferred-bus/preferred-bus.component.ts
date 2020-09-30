import { Component, OnInit } from '@angular/core';
import {PreferredBus} from '../models/preferredBus'
import { PreferredbusService } from '../services/PreferredbusService';

@Component({
  selector: 'app-preferred-bus',
  templateUrl: './preferred-bus.component.html',
  styleUrls: ['./preferred-bus.component.css']
})
export class PreferredBusComponent implements OnInit {
  detail: PreferredBus;
  details

  constructor(private prefferdbusService:PreferredbusService) {
    this.detail = new PreferredBus();
   }

  

  ngOnInit(): void {
    this.prefferdbusService.getAllDetailsFromAPI().subscribe((data)=>{
      this.details = data;
    })
  }

}
