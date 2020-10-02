
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {TripSelect} from '../model/TripSelect';



@Injectable()
export class TripSelectService{
    OnwardTrip: TripSelect;
    ReturnTrip: TripSelect;
    IsReturn: boolean = false;
    constructor(private http: HttpClient , private http2: HttpClient){
       
    }

    
}