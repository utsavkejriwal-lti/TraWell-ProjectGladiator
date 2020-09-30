
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { UserStatusService } from './user.service';



@Injectable()
export class ViewBookingService{
    
    BookingIds;
    RedirectFrom: string;
    constructor(private http: HttpClient , private http2: HttpClient, private http3: HttpClient, private userService: UserStatusService){
       if(this.BookingIds == undefined){
           //this.BookingIds = [118];
           
       }
    }

    GetBookingDetailsFromApi(id: number){
        return this.http.get("http://localhost:52374/api/booking/GetBooking?id="+id);
    }

    CancelBooking(id: number){
        return this.http2.get("http://localhost:52374/api/booking/CancelBooking?id="+id);
    }

    getBookingIds(id: number){
        return this.http3.get("http://localhost:52374/api/booking/getUserBooking?id="+id);
    }

    
}