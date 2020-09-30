
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { FinalDetails } from '../model/FinalDetails';



@Injectable()
export class PaymentService{
    
   
    finalDetails: FinalDetails;
    constructor(private http: HttpClient){
       var exists = sessionStorage.getItem("finalDetails");
       if(exists != undefined){
           this.finalDetails = JSON.parse(exists);
       }
    }

    CreateNewBooking(){
       // this.http.post()
    }
}