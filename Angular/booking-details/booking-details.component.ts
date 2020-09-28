import { AfterContentInit, Component, DoCheck, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import {formatDate} from '@angular/common';
import { TripSelect } from '../model/TripSelect';
import { TripSelectService} from '../services/tripSelect.service';
import { UserStatusService } from '../services/user.service';

@Component({
  selector: 'app-booking-details',
  templateUrl: './booking-details.component.html',
  styleUrls: ['./booking-details.component.css']
})
export class BookingDetailsComponent implements OnInit {

  onwardDetails: TripSelect;
  returnDetails: TripSelect;
  IsReturn: boolean;
  UserSignedIn: boolean;
  constructor(private router:Router, private tripSelectService: TripSelectService, private userService: UserStatusService) {
    
    this.onwardDetails = new TripSelect();
    this.returnDetails = new TripSelect();

    this.onwardDetails = JSON.parse(sessionStorage.getItem('onwardJourney'));
    this.returnDetails = JSON.parse(sessionStorage.getItem('retJourney'));
    this.IsReturn = Boolean(sessionStorage.getItem('IsReturn'));
    if(this.onwardDetails != undefined && this.onwardDetails != null){
      this.tripSelectService.OnwardTrip = new TripSelect();
      this.tripSelectService.OnwardTrip = this.onwardDetails;
    }else{
      this.router.navigateByUrl('searchresults');
    }

    if(this.IsReturn != undefined && this.IsReturn && this.returnDetails != undefined){
      this.tripSelectService.ReturnTrip = new TripSelect();
      this.tripSelectService.ReturnTrip = this.returnDetails;
      this.tripSelectService.IsReturn = this.IsReturn;
    }else{
      this.tripSelectService.IsReturn = false;
    }

    
    
    
  }

  ngOnInit(): void {
    this.userService.userStatussObs.subscribe((data) => {
      this.UserSignedIn = data;
    })
    this.userService.UpdateService();
  }

}
