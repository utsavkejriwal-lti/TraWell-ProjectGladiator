import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FrequentRoutes } from '../models/frequentRoutes';
import { AdminAuthenticationService } from '../services/authentication.service';
import { FrequentRoutesService } from '../services/FrequentroutesService';


@Component({
  selector: 'app-frequent-routes',
  templateUrl: './frequent-routes.component.html',
  styleUrls: ['./frequent-routes.component.css']
})
export class FrequentRoutesComponent implements OnInit {
  detail: FrequentRoutes;
  details

  constructor(private frequentRoutesService:FrequentRoutesService ,private adminAuth: AdminAuthenticationService, private router: Router) {
    this.detail = new FrequentRoutes();
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
    this.frequentRoutesService.getAllDetailsFromAPI().subscribe((data)=>{
      this.details = data;
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    })
  }
}
