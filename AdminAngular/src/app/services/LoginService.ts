
import { Injectable } from '@angular/core';  
 
import {HttpHeaders,HttpClient} from '@angular/common/http';  
import { from, Observable } from 'rxjs';  
import {Admin} from'../models/admin';

@Injectable({  
  providedIn: 'root'  
})  
export class LoginService {  
  Url :string;  
  token : string;  
  header : any;  
  constructor(private http : HttpClient) {   
    this.Url = 'http://localhost:56355/api/Login/';  

  }  
  Login(model : any){  
  
   return this.http.post(this.Url+'AdminLogin',model);  
  } 
}