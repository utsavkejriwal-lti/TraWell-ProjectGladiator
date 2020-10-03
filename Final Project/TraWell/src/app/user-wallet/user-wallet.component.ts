import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserStatusService } from '../services/user.service';
import { UserLoginService } from '../services/userlogin.service';

@Component({
  selector: 'app-user-wallet',
  templateUrl: './user-wallet.component.html',
  styleUrls: ['./user-wallet.component.css']
})
export class UserWalletComponent implements OnInit {

  Transactions;
  user;
  constructor(private userService: UserStatusService, private userTransactionService: UserLoginService, private router:Router) { 
    this.user = {
      Wallet: 0
    };
  }

  ngOnInit(): void {
    if(this.userService.isLoggedIn){
      this.userTransactionService.GetTransactions(this.userService.user.Id).subscribe((data)=>{
        
        this.Transactions = data;
       
        this.userService.getUser().subscribe((data2) => {
          console.log(data2);
          this.userService.user = data2;
          this.user = this.userService.user;
        },(error) =>{
          this.router.navigateByUrl('/errorpage');
        })
       
      },(error) =>{
        this.router.navigateByUrl('/errorpage');
      })

      
    }
  }



}
