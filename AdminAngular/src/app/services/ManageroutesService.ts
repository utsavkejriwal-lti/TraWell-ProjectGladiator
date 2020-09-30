import { Injectable } from '@angular/core';  
import {HttpClient} from '@angular/common/http';  
 


@Injectable() 
export class ManageroutesService{

    constructor(private http:HttpClient){}

    getAllRoutes(){
       return this.http.get("http://localhost:56355/api/manageroutes");
    }
}