import { Component, OnInit } from '@angular/core';    
import { Router } from '@angular/router';    
import { LoginService } from '../services/LoginService';  
 import { FormsModule } from '@angular/forms';    
@Component({    
  selector: 'app-login',    
  templateUrl: './login.component.html',    
  styleUrls: ['./login.component.css']    
})    
export class LoginComponent {    
  model : any={};    
  errorMessage:string;    
  constructor(private router:Router,private LoginService:LoginService) { }    
  ngOnInit() {    
    sessionStorage.removeItem('UserName');    
    sessionStorage.clear();    
  }    
  login(){    
        
    this.LoginService.Login(this.model).subscribe(    
      data => {    
       
        console.log(data);    
        if(data !="Invalid Details")    
        {       
          this.router.navigate(['/dashboard']);    
             
        }    
        else{    
          this.errorMessage ="Invalid details";    
        }    
      },    
      error => {    
        this.errorMessage = error.message;    
      });    
  };    
 }
