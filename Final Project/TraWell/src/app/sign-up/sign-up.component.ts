import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserStatusService } from '../services/user.service';
import { UserLoginService } from '../services/userlogin.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {

  signUpForm: FormGroup;
  PasswordMatch: boolean = false;
  alertMessage: string; 
  constructor(private userStatusService: UserStatusService, private router:Router, private userDataService: UserLoginService) { }

  ngOnInit(): void {
    if(this.userStatusService.isLoggedIn){
      this.router.navigateByUrl('');
    }
    this.userStatusService.userStatussObs.subscribe((data) => {
      if(data){
        this.router.navigateByUrl('');
      }
    })

    this.signUpForm = new FormGroup({
      FirstName: new FormControl(null, [Validators.required, Validators.minLength(3)]),
      LastName: new FormControl(null, [Validators.required, Validators.minLength(3)]),
      Password: new FormControl(null, [Validators.required, Validators.pattern('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&].{8,}')]),
      ConfirmPassword: new FormControl(null, [Validators.required]),
      Contact: new FormControl(null, [Validators.required, Validators.pattern("^[0-9]{10}$")]),
      Email: new FormControl(null, [Validators.required, Validators.pattern("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$")]),
    })
    
    this.signUpForm.valueChanges.subscribe((data) => {
      this.PasswordMatch = this.CheckPassword();
      this.alertMessage = '';
    })
  }


  get FirstName(){
    return this.signUpForm.get('FirstName')
  }
  get LastName(){
    return this.signUpForm.get('LastName')
  }
  get Password(){
    return this.signUpForm.get('Password')
  }
  get ConfirmPassword(){
    return this.signUpForm.get('ConfirmPassword')
  }
  get Contact(){
    return this.signUpForm.get('Contact')
  }
  get Email(){
    return this.signUpForm.get('Email')
  }

  CheckPassword():boolean{
    if(this.Password.value != this.ConfirmPassword.value){
      return false;
    }else{
      return true;
    }
  }

  SignUpButtonClicked(){
    this.userDataService.SignUpApi(this.FirstName.value, this.LastName.value, this.Password.value, this.Contact.value, this.Email.value).subscribe((data) => {
      if(data != "Added"){
        this.alertMessage = '<div class="alert alert-danger" role="alert"><strong>Error:</strong> ' + data +'</div>';
      }else{
        this.alertMessage = '<div class="alert alert-success" role="alert"><strong>Success</strong> You are registered. Sign in to proceed</div>';
      }
    })
    this.Password.reset();
    this.ConfirmPassword.reset();
  }
}
