import { Injectable } from '@angular/core';  
import {HttpClient} from '@angular/common/http';  
import { Managetrips } from '../models/managetrips';



@Injectable() 
export class ManagetripsService{

    constructor(private http:HttpClient, private http2: HttpClient){}

    getAllTrips(){
       return this.http.get("http://localhost:54873/api/managetrips");
    }

    InsertNewTrip(trip){
       return this.http2.post("http://localhost:54873/api/AddTrip",trip);
    }
}