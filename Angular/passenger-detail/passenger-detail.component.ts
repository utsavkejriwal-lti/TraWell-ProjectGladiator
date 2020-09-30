import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import {PassengerDetail} from '../model/passenger';

@Component({
  selector: 'app-passenger-detail',
  templateUrl: './passenger-detail.component.html',
  styleUrls: ['./passenger-detail.component.css']
})
export class PassengerDetailComponent implements OnInit, OnChanges {

  @Input() passenger: PassengerDetail;
  @Input() bookedSeats: number[];
  @Input() IsReturn: boolean = false;
  @Input() passengers;
  @Input() OnwardBusDetails;
  @Input() ReturnBusDetails;
  isPassenger:boolean = false;

  @Output() deletePassenger = new EventEmitter();
  constructor() {

  }

  ngOnInit(): void {
  }

  ngOnChanges(changes: SimpleChanges){
    if(changes['passenger'].firstChange){
      this.isPassenger = true;
     if(this.passenger.Gender == undefined){
       this.passenger.Gender = "Male";
     }
    }
    
  }

  deleteButtonClicked(){
    this.deletePassenger.emit(this.passenger.Id);
  }

  

}
