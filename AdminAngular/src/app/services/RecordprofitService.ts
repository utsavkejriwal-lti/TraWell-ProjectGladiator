import { Injectable } from '@angular/core';  
import {HttpClient} from '@angular/common/http';  
import {HttpHeaders} from '@angular/common/http';  
import { from, Observable } from 'rxjs'; 
import {RecordProfit} from '../models/recordProfit'

@Injectable() 
export class RecordprofitService{

    constructor(private http:HttpClient){}

   getAllDetailsFromAPI(){
       return this.http.get("http://localhost:56355/api/LastMonthProfit");
   }
}