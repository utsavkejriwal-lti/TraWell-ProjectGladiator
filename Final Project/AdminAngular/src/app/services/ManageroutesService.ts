import { Injectable } from '@angular/core';  
import {HttpClient} from '@angular/common/http';  
import { RouteStop } from '../models/RouteStop';
 


@Injectable() 
export class ManageroutesService{

    constructor(private http:HttpClient, private http2: HttpClient, private http3: HttpClient){}

    getAllRoutes(){
       return this.http.get("http://localhost:54873/api/manageroutes");
    }

    getAllPlaces(){
        return this.http2.get("http://localhost:54873/api/GetPlaces");
    }

    addNewRoute(stops: RouteStop[]){
        return this.http3.post("http://localhost:54873/api/AddRoute",stops);
    }


}