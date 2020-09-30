import { Component, OnInit } from '@angular/core';
import { UserStatusService } from '../services/user.service';
import { UserLoginService } from '../services/userlogin.service';

@Component({
  selector: 'app-user-wallet',
  templateUrl: './user-wallet.component.html',
  styleUrls: ['./user-wallet.component.css']
})
export class UserWalletComponent implements OnInit {

  Transactions;
  constructor(private userService: UserStatusService, private userTransactionService: UserLoginService) { }

  ngOnInit(): void {
    if(this.userService.isLoggedIn){
      this.userTransactionService.GetTransactions(this.userService.user.Id).subscribe((data)=>{
        console.log(data);
        this.Transactions = data;
      })
    }
  }



}
