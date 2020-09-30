import { Component, OnInit } from '@angular/core';
import { RecordProfit } from '../models/recordProfit';
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


  constructor(private recordprofitService:RecordprofitService) {
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
  }

}
