
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { UserStatusService } from './user.service';



@Injectable()
export class ViewBookingService{
    
    BookingIds;
    RedirectFrom: string;
    constructor(private http: HttpClient , private http2: HttpClient, private http3: HttpClient, private http4: HttpClient, private userService: UserStatusService){
       if(this.BookingIds == undefined){
           this.BookingIds = [];
           
       }
    }

    GetBookingDetailsFromApi(id: number[]){
        return this.http.post("http://localhost:54873/api/booking/GetBooking",id);
    }

    CancelBooking(id: number){
        return this.http2.get("http://localhost:54873/api/booking/CancelBooking?id="+id);
    }

    getBookingIds(id: number){
        return this.http3.get("http://localhost:54873/api/booking/getUserBooking?id="+id);
    }

    insertFeedback(feedback){
        
        return this.http4.post("http://localhost:54873/api/Feedback", feedback);
    }

    
}