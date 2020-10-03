import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router , NavigationEnd} from '@angular/router';
import { UserStatusService } from '../services/user.service';
import { UserLoginService } from '../services/userlogin.service';


@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  signInForm: FormGroup;
  response;
  alertMessage;
  constructor(private router:Router, private userloginservice: UserLoginService, private userStatusService: UserStatusService, private http: HttpClient) { 
    
    
    

    this.signInForm = new FormGroup({
      Email:new FormControl(null,[Validators.required,Validators.pattern("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$")]),
      Password: new FormControl(null,[Validators.required]),
    });

    
  }

  ngOnInit(): void {
    if(this.userStatusService.isLoggedIn){
      this.router.navigateByUrl('bookingdetails');
    }
    this.userStatusService.userStatussObs.subscribe((data) => {
      if(data){
        this.router.navigateByUrl('bookingdetails');
      }
    })
    

    this.EmailId.valueChanges.subscribe((data) => {
      this.alertMessage = '';
    })
    this.EmailId.valueChanges.subscribe((data) => {
      this.alertMessage = '';
    })
  }

  get EmailId(){
    return this.signInForm.get("Email");
  }
  get Password(){
    return this.signInForm.get("Password");
  }

  LoginButtonClick(){
    if(this.signInForm.valid){
      this.userloginservice.loginApi( this.EmailId.value ,this.Password.value).subscribe((data) => {
        this.Password.setValue('');
        this.response = data;
        if(this.response.Message == "Not Exists"){
          this.alertMessage = '<div class="alert alert-warning" role="alert">User is not registered</div>';
        }else if(this.response.Message == "Invalid Password"){
          this.alertMessage = '<div class="alert alert-danger" role="alert">Invalid Email or Password</div>';
        }else if(this.response.Message == "success" && this.response.hash != null){
          this.alertMessage = '<div class="alert alert-success" role="alert">Login Successful</div>';
          sessionStorage.setItem("user",this.response.hash);
          this.userStatusService.userStatusUpdate(true);
        }
      },(error) =>{
        this.router.navigateByUrl('/errorpage');
      })
      
    }
  }



 
}
