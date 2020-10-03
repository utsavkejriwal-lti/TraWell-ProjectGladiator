
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

    
}