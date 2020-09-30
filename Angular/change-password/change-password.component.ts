import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { UserStatusService } from '../services/user.service';
import { UserLoginService } from '../services/userlogin.service';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.css']
})
export class ChangePasswordComponent implements OnInit {

  changePasswordForm: FormGroup;
  formInvalid: boolean = true;
  formMessage = "";
  constructor(private userService: UserStatusService, private userFormService: UserLoginService) { 
    this.changePasswordForm = new FormGroup({
      OldPassword: new FormControl(null,Validators.required),
      NewPassword: new FormControl(null,[Validators.required, Validators.pattern('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$#@$!%*?&])[A-Za-z\d$@#$!%*?&].{8,}')]),
      NewConfirmPassword: new FormControl(null,Validators.required)
    })
  }

  ngOnInit(): void {
    this.changePasswordForm.valueChanges.subscribe((data) => {
      if(this.NewPassword.value != this.NewConfirmPassword.value){
        this.formInvalid = true;
      }else{
        this.formInvalid = false;
      }
      this.formMessage = "";
    })
  }

  get OldPassword(){
   return this.changePasswordForm.get('OldPassword');
  }
  get NewPassword(){
    return this.changePasswordForm.get('NewPassword');
  }
  get NewConfirmPassword(){
    return this.changePasswordForm.get('NewConfirmPassword');
  }


  SubmitFormButton(){
      if(this.userService.isLoggedIn){
        this.userFormService.ChangePasswordApi(this.userService.user.Email, this.OldPassword.value, this.NewPassword.value).subscribe((data) => {
          if(data == "success"){
            this.formMessage = '<div class="alert alert-success" role="alert">Password Updated</div>';
            this.changePasswordForm.reset();
            this.userService.UpdateUser();
          }else{
            this.formMessage = '<div class="alert alert-danger" role="alert">Invalid Details</div>';
          }
        })
      }
      else{
        this.formMessage = '<div class="alert alert-warning" role="alert">Error Try again Later</div>';
      }
  }
}
