
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { FinalDetails } from '../model/FinalDetails';



@Injectable()
export class PaymentService{
    
   
    finalDetails: FinalDetails;
    constructor(private http: HttpClient){
      
    }

    CreateNewBooking(){
       return this.http.post("http://localhost:54873/api/booking/CreateNewBooking",this.finalDetails);
    }
}