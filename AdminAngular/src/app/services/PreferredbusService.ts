import { Injectable } from '@angular/core';  
import {HttpClient} from '@angular/common/http';  
import {HttpHeaders} from '@angular/common/http';  
import { from, Observable } from 'rxjs'; 
import {PreferredBus} from '../models/preferredBus'

@Injectable() 
export class PreferredbusService{

    constructor(private http:HttpClient){}

   getAllDetailsFromAPI(){
       return this.http.get("http://localhost:56355/api/MostPreferedBus");
   }
}