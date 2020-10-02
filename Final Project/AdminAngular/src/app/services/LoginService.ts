
import { Injectable } from '@angular/core';  
 
import {HttpHeaders,HttpClient} from '@angular/common/http';  
import { from, Observable } from 'rxjs';  
import {Admin} from'../models/admin';

@Injectable({  
  providedIn: 'root'  
})  
export class LoginService {  
 
  constructor(private http : HttpClient) {   
   
  }  
  Login(model){  
   return this.http.post('http://localhost:54873/api/Login/AdminLogin',model);  
  } 
}