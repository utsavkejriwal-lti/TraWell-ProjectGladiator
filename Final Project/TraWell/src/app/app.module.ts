import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {HttpClientModule} from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { SearchComponent } from './search/search.component';
import { SearchResultsComponent } from './search-results/search-results.component';

import {PlaceService} from './services/places.service';
import {SearchQueryService} from './services/searchquery.service';
import {TripSelectService} from './services/tripSelect.service';
import {UserLoginService} from './services/userlogin.service';
import {UserStatusService} from './services/user.service';
import {GuestUserService} from './services/guestUser.service';
import {PaymentService} from './services/payment.service';
import {ViewBookingService} from './services/viewBooking.service';

import { BookingDetailsComponent } from './booking-details/booking-details.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { SignInComponent } from './sign-in/sign-in.component';
import { SignOutComponent } from './sign-out/sign-out.component';
import { PassengerDetailComponent } from './passenger-detail/passenger-detail.component';
import { SeatSelectComponent } from './seat-select/seat-select.component';

import { NumIterate } from './Pipe/numIterate.pipe';
import { PaymentPageComponent } from './payment-page/payment-page.component';
import { ViewBookingComponent } from './view-booking/view-booking.component';
import { UserDashBoardComponent } from './user-dash-board/user-dash-board.component';
import { UserProfileComponent } from './user-profile/user-profile.component';
import { UserWalletComponent } from './user-wallet/user-wallet.component';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { ViewBookingGuestComponent } from './view-booking-guest/view-booking-guest.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { ErrorPageComponent } from './error-page/error-page.component';



const routes: Routes = [
  { path: '', component: SearchComponent },
  { path: 'index', component: SearchComponent },
  { path: 'searchresults', component: SearchResultsComponent},
  { path: 'bookingdetails', component: BookingDetailsComponent},
  { path: 'signup', component: SignUpComponent},
  { path: 'signin', component: SignInComponent},
  { path: 'signout', component: SignOutComponent} ,
  { path: 'payment', component: PaymentPageComponent},
  { path: 'viewbooking', component: ViewBookingComponent},
  { path: 'errorpage', component: ErrorPageComponent}, 
  { path: 'viewbookingguest', component: ViewBookingGuestComponent},
  { path: 'dashboard', component: UserDashBoardComponent , children: [
    {path: 'profile', component: UserProfileComponent},
    {path: 'wallet', component: UserWalletComponent},
    {path: 'changePassword', component: ChangePasswordComponent},
    {path: '', redirectTo: '/dashboard/profile', pathMatch: 'full'}
  ]},
  { path: '**', component: PageNotFoundComponent}
   
];

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    SearchComponent,
    SearchResultsComponent,
    BookingDetailsComponent,
    SignUpComponent,
    SignInComponent,
    SignOutComponent,
    PassengerDetailComponent,
    SeatSelectComponent,
    NumIterate,
    PaymentPageComponent,
    ViewBookingComponent,
    UserDashBoardComponent,
    UserProfileComponent,
    UserWalletComponent,
    ChangePasswordComponent,
    ViewBookingGuestComponent,
    PageNotFoundComponent,
    ErrorPageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    RouterModule.forRoot(routes),
    FormsModule, 
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [PlaceService,SearchQueryService,TripSelectService, UserLoginService, UserStatusService, GuestUserService,PaymentService, ViewBookingService],
  bootstrap: [AppComponent]
})
export class AppModule { }
