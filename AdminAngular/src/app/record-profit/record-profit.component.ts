import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { RecordProfit } from '../models/recordProfit';
import { AdminAuthenticationService } from '../services/authentication.service';
import { RecordprofitService } from '../services/RecordprofitService';


@Component({
  selector: 'app-record-profit',
  templateUrl: './record-profit.component.html',
  styleUrls: ['./record-profit.component.css']
})
export class RecordProfitComponent implements OnInit {
  detail: RecordProfit;
  details
  totalAmount: number = 0;


  constructor(private recordprofitService:RecordprofitService,private adminAuth: AdminAuthenticationService, private router: Router) {
    this.detail = new RecordProfit();
   }

 

  ngOnInit(): void {
    this.recordprofitService.getAllDetailsFromAPI().subscribe((data)=>{
      this.details = data;
        this.totalAmount=0;
      for(var i=0; i< this.details.length; i++){
        this.totalAmount += this.details[i].Amount;
      }
    })

    if(!this.adminAuth.isLoggedIn){
      this.router.navigate(['/']); 
    }
    this.adminAuth.adminStatussObs.subscribe((data) => {
      
      if(!data){
        this.router.navigate(['/']); 
      }
    })
  }

}
