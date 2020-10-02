import { Component, OnInit } from '@angular/core';    
import { Router } from '@angular/router';    
import { LoginService } from '../services/LoginService';  
 import { FormsModule } from '@angular/forms';    
import { AdminAuthenticationService } from '../services/authentication.service';
@Component({    
  selector: 'app-login',    
  templateUrl: './login.component.html',    
  styleUrls: ['./login.component.css']    
})    
export class LoginComponent {    
  model : any={};    
  errorMessage:string;    
  constructor(private router:Router,private LoginService:LoginService, private adminAuth: AdminAuthenticationService) {
    
  }    
  ngOnInit() {    
      
    this.adminAuth.adminStatussObs.subscribe((data) => {
      
      if(data){
        this.router.navigate(['/dashboard']); 
      }
    });
   
  }    
  login(){    
       
    this.LoginService.Login(this.model).subscribe((data) => {    
          
        if(data != null)    
        {       
          this.adminAuth.admin = data;
          this.adminAuth.userStatusUpdate(true);
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
