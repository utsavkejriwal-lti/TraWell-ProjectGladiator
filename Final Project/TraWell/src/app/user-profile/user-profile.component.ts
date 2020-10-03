import { formatDate } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserStatusService } from '../services/user.service';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent implements OnInit {

  profileForm: FormGroup;
  user;
  UpdateMessage = "";
  constructor(private userService: UserStatusService, private http: HttpClient, private router: Router) {
    
    
    
   }

  ngOnInit(): void {
    this.user = this.userService.user;
    
    if(this.user != undefined){
      var Dob;
      if(this.user.DOB == null){
        Dob = null;
      }else{
        Dob = formatDate(this.user.DOB, 'yyyy-MM-dd', 'en');
      }
      this.profileForm = new FormGroup({
        Contact: new FormControl(this.user.Contact, [Validators.required,Validators.pattern("^[0-9]{10}$")]),
        Address: new FormControl(this.user.Address),
        Gender: new FormControl(this.user.Gender),
        DOB: new FormControl(Dob)
      })
    }else{
      this.profileForm = new FormGroup({
        Contact: new FormControl(null, [Validators.required,Validators.pattern("^[0-9]{10}$")]),
        Address: new FormControl(null),
        Gender: new FormControl(null),
        DOB: new FormControl(null)
      })
    }

    this.profileForm.valueChanges.subscribe((data) => {
      this.UpdateMessage = "";
    })
  }

  get Contact(){
    return this.profileForm.get('Contact');
  }

  get Address(){
    return this.profileForm.get('Address');
  }

  get Gender(){
    return this.profileForm.get('Gender');
  }

  get DOB(){
    return this.profileForm.get('DOB');
  }

  SubmitProfileForm(){

    var updated = false;
    var details = {
      Id: null,
      Contact: null,
      Gender: null,
      DOB: null,
      Address: null     
    }
    if(this.user.Contact != this.Contact.value && this.Contact.value != undefined && this.Contact.value != null && this.Contact.value != ""){
      details.Contact = this.Contact.value;
      updated = true;
    }
    if(this.user.Gender != this.Gender.value  && this.Gender.value != undefined && this.Gender.value != null && this.Gender.value != ""){
      details.Gender = this.Gender.value;
      updated = true;
    }
    if(this.user.DOB != this.DOB.value  && this.DOB.value != undefined && this.DOB.value != null && this.DOB.value != ""){
      details.DOB = formatDate(new Date(this.DOB.value),"yyyy-MM-dd","en");
      updated = true;
    }
    if(this.user.Address != this.Address.value  && this.Address.value != undefined && this.Address.value != null && this.Address.value != ""){
      details.Address = this.Address.value;
      updated = true;
    }

    if(updated){
      details.Id = this.userService.user.Id;
      this.http.post("http://localhost:54873/api/User/UpdateUser", details).subscribe((data) => {
        if(data == "Updated"){
          this.UpdateMessage = '<div class="alert alert-success" role="alert">Profile Details Updated </div>';
          this.userService.getUser().subscribe((data2) =>{
            this.userService.user =data2;
          },(error) =>{
            this.router.navigateByUrl('/errorpage');
          });
        }else{
          this.UpdateMessage = '<div class="alert alert-danger" role="alert">Error try again later </div>'
        }
      },(error) =>{
        this.router.navigateByUrl('/errorpage');
      })
    }
  }
}
