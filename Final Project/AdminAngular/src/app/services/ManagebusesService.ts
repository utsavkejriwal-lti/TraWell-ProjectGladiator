import { Injectable } from '@angular/core';  
import {HttpClient} from '@angular/common/http';  
import {HttpHeaders} from '@angular/common/http';  
import { from, Observable } from 'rxjs';  
import { Managebuses } from '../models/managebuses';

@Injectable() 
export class ManagebusesService{

    constructor(private http:HttpClient){}

   getAllBusesFromAPI(){
       return this.http.get("http://localhost:54873/api/managebuses");
   }

   updateBusinAPI(bus:Managebuses){
    return this.http.put("http://localhost:54873/api/managebuses/?id="+bus.Id,bus);
   }

   deleteBusinAPI(Id:number){
    return this.http.delete("http://localhost:54873/api/managebuses?id="+Id);
   }

   insertBusThroughAPI(bus:Managebuses){
   return this.http.post("http://localhost:54873/api/managebuses/",bus);
   }

}