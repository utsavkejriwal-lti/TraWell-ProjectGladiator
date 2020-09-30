import { Injectable } from '@angular/core';  
import {HttpClient} from '@angular/common/http';  



@Injectable() 
export class ManagetripsService{

    constructor(private http:HttpClient){}

    getAllTrips(){
       return this.http.get("http://localhost:56355/api/managetrips");
    }
}