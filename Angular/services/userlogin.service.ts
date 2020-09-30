
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';




@Injectable()
export class UserLoginService{
   
    constructor(private http: HttpClient , private http2: HttpClient){
       
    }

    loginApi(email: string, password:string){
        var UserDetails = {
            Email: email,
            Password: password
        }

        return this.http.post("http://localhost:52374/api/User/SignIn",UserDetails);
    }
}