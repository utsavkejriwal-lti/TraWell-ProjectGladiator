
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';



@Injectable()
export class GuestUserService{
    
   
    constructor(private http: HttpClient , private http2: HttpClient){
       
    }

    CheckandAddUser(email: string, contact: string){
        var User = {
            Email: email,
            Contact: contact
        }

        return this.http.post("http://localhost:52374/api/User/CheckGuestUser",User);
    }

    
}