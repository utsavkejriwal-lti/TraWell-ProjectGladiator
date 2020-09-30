
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';




@Injectable()
export class UserLoginService{
   
    constructor(private http: HttpClient , private http2: HttpClient, private http3: HttpClient, private http4: HttpClient){
       
    }

    loginApi(email: string, password:string){
        var UserDetails = {
            Email: email,
            Password: password
        }

        return this.http.post("http://localhost:52374/api/User/SignIn",UserDetails);
    }
    
    SignUpApi(firstName, lastName, password, contact, email){
        var UserDetails = {
            FirstName: firstName,
            LastName: lastName,
            Password: password,
            Contact: contact,
            Email: email
        }
        
        return this.http2.post("http://localhost:52374/api/User/SignUp",UserDetails);
    }

    ChangePasswordApi(email, oldPassword, newPassword){
        var Details = {
            Email: email,
            Password: oldPassword,
            NewPassword: newPassword
        }

        return this.http3.post("http://localhost:52374/api/User/ChangePass",Details);
    }

    GetTransactions(id:number){
        return this.http4.get("http://localhost:52374/api/User/GetTransactions?id="+id);
    }
}