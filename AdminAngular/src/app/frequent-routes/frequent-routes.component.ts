import { Component, OnInit } from '@angular/core';
import { FrequentRoutes } from '../models/frequentRoutes';
import { FrequentRoutesService } from '../services/FrequentroutesService';


@Component({
  selector: 'app-frequent-routes',
  templateUrl: './frequent-routes.component.html',
  styleUrls: ['./frequent-routes.component.css']
})
export class FrequentRoutesComponent implements OnInit {
  detail: FrequentRoutes;
  details

  constructor(private frequentRoutesService:FrequentRoutesService) {
    this.detail = new FrequentRoutes();
   }

 

  ngOnInit(): void {
    this.frequentRoutesService.getAllDetailsFromAPI().subscribe((data)=>{
      this.details = data;
    })
  }

}
