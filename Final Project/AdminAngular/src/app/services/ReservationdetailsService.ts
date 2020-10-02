import { Injectable } from '@angular/core';  
import {HttpClient} from '@angular/common/http';  


@Injectable() 
export class ReservationdetailsService{

    constructor(private http:HttpClient){}

    GetBookingDetailsFromApi(){
        let ids = [-1];
        return this.http.post("http://localhost:54873/api/booking/GetBooking",ids);
    }
}