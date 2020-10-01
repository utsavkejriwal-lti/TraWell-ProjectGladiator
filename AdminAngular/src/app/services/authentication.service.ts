
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import { Subject } from 'rxjs';




@Injectable()
export class AdminAuthenticationService{
   
    public _adminStatus: Subject<boolean> = new Subject<boolean>();
    public adminStatussObs = this._adminStatus.asObservable();
    isLoggedIn: boolean = false; //has to be changed to false
    admin;
    constructor(private http: HttpClient){
    //   this.admin = {
    //       UserName: "bhanu",
    //         Password: "bhanu1234"
    //   } //this part has to be removed
    }

    userStatusUpdate(newStatus: boolean){
       
        if(newStatus == true){
            this.isLoggedIn = true;
            this._adminStatus.next(true);
        }else{
            
            this.admin = null;
            this.isLoggedIn = false;
            this._adminStatus.next(false);
        }
    }

    

    UpdateService(){
        if(this.isLoggedIn != undefined){
            this._adminStatus.next(this.isLoggedIn);
        }
    }

    

    
}