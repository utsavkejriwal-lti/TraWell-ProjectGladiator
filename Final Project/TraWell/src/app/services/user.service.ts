
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { Subject } from 'rxjs';
import {User} from "../model/user";




@Injectable()
export class UserStatusService{
   
    public _userStatus: Subject<boolean> = new Subject<boolean>();
    public userStatussObs = this._userStatus.asObservable();
    isLoggedIn: boolean = false;
    user;
    constructor(private http: HttpClient){
       //this.user = new User();
       this.GetUserFromApi();
    }

    userStatusUpdate(newStatus: boolean){
       
        if(newStatus == true){
            
            this.GetUserFromApi();

        }else{
            sessionStorage.clear();
            this.user = null;
            this.isLoggedIn = false;
            this._userStatus.next(false);
        }
        
    }

    GetUserFromApi(){
        let code = {
            EncData: sessionStorage.getItem("user")
        }
        this.http.post("http://localhost:54873/api/User/GetUser",code).subscribe((data) => {
            
            if(data != null){
            
                this.user = data;
                this.isLoggedIn = true;
                this._userStatus.next(true);
            }else{
                
                sessionStorage.removeItem("user");
                this.user = null;
                this.isLoggedIn = false;
                this._userStatus.next(false);
            }
        })
    }

    

    //UpdateUser(){}

    
}