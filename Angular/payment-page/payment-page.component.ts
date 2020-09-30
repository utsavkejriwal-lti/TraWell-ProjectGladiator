import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FinalDetails } from '../model/FinalDetails';
import { Transaction } from '../model/Transaction';
import { PaymentService } from '../services/payment.service';
import { UserStatusService } from '../services/user.service';
import { ViewBookingService } from '../services/viewBooking.service';

@Component({
  selector: 'app-payment-page',
  templateUrl: './payment-page.component.html',
  styleUrls: ['./payment-page.component.css']
})
export class PaymentPageComponent implements OnInit {

  finalDetails: FinalDetails;
  IsReturn: boolean = false;
  IsLoggedIn: boolean = false;
  user;
  walletUsed: boolean = false;

  totalAmount: number;
  totalAmountToPay: number;

  ModeOfPayment: string = "Card";

  constructor(private paymentService: PaymentService, private router: Router, private userService: UserStatusService, private viewBooking: ViewBookingService) {
    
  }

  ngOnInit(): void {
    //console.log("paymentpage");
    this.finalDetails = this.paymentService.finalDetails;
    //console.log(this.finalDetails);
    if(this.finalDetails == undefined){
      this.finalDetails = JSON.parse(sessionStorage.getItem('finalDetails'));
      if(this.finalDetails == undefined){
        this.router.navigateByUrl('bookingdetails');
      }
    }
    
    if(this.finalDetails.Bookings.length > 1){
      this.IsReturn = true;
    }
    this.IsLoggedIn = this.userService.isLoggedIn;
    if(this.IsLoggedIn){
      this.user = this.userService.user;
    }
    this.userService.userStatussObs.subscribe((data) => {
      this.IsLoggedIn = data;
      if(data){
        this.user = this.userService.user;
      }
    })
    

    if(!this.IsReturn){
      this.totalAmount = this.finalDetails.Bookings[0].Amount;
    }else{
      this.totalAmount = this.finalDetails.Bookings[0].Amount + this.finalDetails.Bookings[1].Amount;
    }
    this.totalAmountToPay = this.totalAmount;
  }

  walletCheck(update){
    this.walletUsed = update.checked;

    if(update.checked){
      
      if(this.totalAmount >= this.user.Wallet){
        this.totalAmountToPay = this.totalAmount - this.user.Wallet;
      }else{
        this.totalAmountToPay = 0;
      }
      
    }else{
      this.totalAmountToPay = this.totalAmount;
      
    }
  }

  paymentConfirmClick(){
   

      if(this.walletUsed){
        if(this.totalAmountToPay > 0){

          if(this.IsReturn){

            if(this.user.Wallet > this.finalDetails.Bookings[0].Amount){
              this.AddTransaction("Wallet","onward","Debit",this.finalDetails.Bookings[0].Amount);
              var WalletPayReturn = this.user.Wallet - this.finalDetails.Bookings[0].Amount;
              var RemainingPayReturn = this.finalDetails.Bookings[1].Amount - WalletPayReturn;
              this.AddTransaction("Wallet","return","Debit",WalletPayReturn);
              this.AddTransaction(this.ModeOfPayment,"return","Debit",RemainingPayReturn);
            }else{
              var WalletPay = this.user.Wallet;
              var RemainingPay = this.finalDetails.Bookings[0].Amount - this.user.Wallet;
              this.AddTransaction("Wallet","onward","Debit",WalletPay);
              this.AddTransaction(this.ModeOfPayment,"onward","Debit",RemainingPay);
              this.AddTransaction(this.ModeOfPayment,"return","Debit",this.finalDetails.Bookings[0].Amount);
            }

          }else{
            var WalletPay = this.user.Wallet;
            var RemainingPay = this.finalDetails.Bookings[0].Amount - this.user.Wallet;
            this.AddTransaction("Wallet","onward","Debit",WalletPay);
            this.AddTransaction(this.ModeOfPayment,"onward","Debit",RemainingPay);
          }

        }else{
          this.AddTransaction("Wallet","onward","Debit",this.finalDetails.Bookings[0].Amount);
          if(this.IsReturn){
            this.AddTransaction("Wallet","return","Debit",this.finalDetails.Bookings[1].Amount);
          }
        }

      }else{
        
        this.AddTransaction(this.ModeOfPayment,"onward","Debit",this.finalDetails.Bookings[0].Amount);
        if(this.IsReturn){
          
          this.AddTransaction(this.ModeOfPayment,"return","Debit",this.finalDetails.Bookings[1].Amount);
        }
      }
      console.log(this.finalDetails);
      this.paymentService.finalDetails = this.finalDetails;
      this.paymentService.CreateNewBooking().subscribe((data) => {
        this.viewBooking.BookingIds = data;
        this.router.navigateByUrl('/viewbooking');
      })
  }

  AddTransaction(Mode: string, BookingDirection: string, TransType: string, Amount: number){
        var transaction = new Transaction();
        transaction.BookingDirection = BookingDirection;
        transaction.Mode = Mode;
        transaction.TransType = TransType;
        transaction.amount = Amount;
        this.finalDetails.Transactions.push(transaction);
  }



}


