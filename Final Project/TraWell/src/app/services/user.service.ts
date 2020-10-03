
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';




@Injectable()
export class UserStatusService{
   
    public _userStatus: Subject<boolean> = new Subject<boolean>();
    public userStatussObs = this._userStatus.asObservable();
    isLoggedIn: boolean = false;
    user;
    constructor(private http: HttpClient, private router:Router, private http2:HttpClient){
       
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
            console.log(data);
            if(data){
            
                this.user = data;
                this.isLoggedIn = true;
                this._userStatus.next(true);
            }else{
                
                sessionStorage.removeItem("user");
                this.user = null;
                this.isLoggedIn = false;
                this._userStatus.next(false);
            }
        },(error) =>{
            this.router.navigateByUrl('/errorpage');
          })
    }

    getUser(){
        return this.http2.get("http://localhost:54873/api/User/update?id="+this.user.Id);
    }
    
}