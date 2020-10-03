import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {HttpClientModule} from '@angular/common/http';

//import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { FormsModule } from '@angular/forms';
import { LoginService } from './services/LoginService';
import { ManagebusesComponent } from './managebuses/managebuses.component';
import {ManagebusesService} from'./services/ManagebusesService';
import {ReservationdetailsService} from './services/ReservationdetailsService';
import {FrequentRoutesService} from './services/FrequentroutesService';
import{RecordprofitService} from './services/RecordprofitService';
import{PreferredbusService} from './services/PreferredbusService';
import {ManagetripsService} from './services/ManagetripsService';
import {ManageroutesService} from './services/ManageroutesService';

import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ReservationDetailsComponent } from './reservation-details/reservation-details.component';
import { FrequentRoutesComponent } from './frequent-routes/frequent-routes.component';
import { RecordProfitComponent} from './record-profit/record-profit.component';
import { PreferredBusComponent } from './preferred-bus/preferred-bus.component';
import { ManagetripsComponent } from './managetrips/managetrips.component';
import { ManageroutesComponent } from './manageroutes/manageroutes.component';

import {AdminAuthenticationService} from './services/authentication.service';
import { NavigationBarComponent } from './navigation-bar/navigation-bar.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { ErrorPageComponent } from './error-page/error-page.component'

const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'login', component: LoginComponent },
  { path: 'managebuses', component: ManagebusesComponent},
  { path: 'dashboard', component: DashboardComponent },
  {path: 'reservation-details', component:ReservationDetailsComponent},
  {path:'frequent-routes', component:FrequentRoutesComponent},
  {path:'record-profit',component:RecordProfitComponent},
  {path:'preferred-bus', component:PreferredBusComponent},
  {path:'managetrips',component:ManagetripsComponent},
  {path:'manageroutes',component:ManageroutesComponent},
  {path: 'errorpage', component: ErrorPageComponent},
  {path: '**', component: PageNotFoundComponent}
];

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    ManagebusesComponent,
    DashboardComponent,
    ReservationDetailsComponent,
    FrequentRoutesComponent,
    RecordProfitComponent,
    PreferredBusComponent,
    ManagetripsComponent,
    ManageroutesComponent,
    NavigationBarComponent,
    PageNotFoundComponent,
    ErrorPageComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    RouterModule.forRoot(routes)
  ],
  providers: [LoginService,ManagebusesService,ReservationdetailsService,FrequentRoutesService,
               RecordprofitService,PreferredbusService,ManagetripsService,ManageroutesService, AdminAuthenticationService],
  bootstrap: [AppComponent]
})
export class AppModule { }
