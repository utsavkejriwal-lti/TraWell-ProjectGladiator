import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {formatDate} from '@angular/common';
import { SearchQueryService } from '../services/searchquery.service';
import { SearchQuery } from '../model/searchquery';
import { SearchQueryToSend } from '../model/searchquerytosend';
import { SelectedResults } from '../model/SelectedResults';
import { TripSelect } from '../model/TripSelect';
import { TripSelectService} from '../services/tripSelect.service';


@Component({
  selector: 'app-search-results',
  templateUrl: './search-results.component.html',
  styleUrls: ['./search-results.component.css']
})
export class SearchResultsComponent implements OnInit {

  returnSearch: boolean = false;

  toresult;
  toquery: SearchQueryToSend;
  returnresult;
  returnquery:SearchQueryToSend ;

  validData1: boolean = false;
  validData2: boolean = false;

  OnwardSearchResultSelected: SelectedResults[] = [];
  ReturnSearchResultSelected: SelectedResults[] = [];

  

  OnwardSelected:string = "0";
  ReturnSelected:string = "0";

  constructor(private searchQueryService: SearchQueryService,  private router:Router, private tripSelectService: TripSelectService) { 
    
    this.toquery = new SearchQueryToSend();
    this.returnquery = new SearchQueryToSend();
    
    sessionStorage.removeItem('retJourney');
    sessionStorage.removeItem('onwardJourney');
    sessionStorage.removeItem('IsReturn');
    var sessionSearch = JSON.parse(sessionStorage.getItem('searchquery'));
    if(sessionSearch != undefined && sessionSearch != null){
      this.searchQueryService.searchquery = new SearchQuery();
      this.searchQueryService.searchquery = sessionSearch;
    }else{
      this.router.navigateByUrl('');
    }

    
  }

  ngOnInit(): void {
    if(this.searchQueryService.searchquery.RetDate != null){
      this.returnSearch = true;
    }
    this.GetResults();
  }

 
  GetResults(){
    
    
    this.toquery.FromCity = this.searchQueryService.searchquery.FromCity;
    this.toquery.ToCity = this.searchQueryService.searchquery.ToCity;
    this.toquery.DepDate = this.searchQueryService.searchquery.DepDate;
    
    this.searchQueryService.getSearchResult(this.toquery).subscribe((data) => {
      
      
      this.toresult = data;
      console.log(data);
      if(this.toresult != undefined && this.toresult.length > 0){
        this.validData1 = true;
        this.UpdateOnwardSelectedResult();
      }
    })


   
    
    if(this.returnSearch){
      this.returnquery.FromCity = this.searchQueryService.searchquery.ToCity;
      this.returnquery.ToCity = this.searchQueryService.searchquery.FromCity;
      this.returnquery.DepDate = this.searchQueryService.searchquery.RetDate;
      this.searchQueryService.getSearchResult(this.returnquery).subscribe((data) => {
        this.returnresult = data;
       
        if(this.returnresult != undefined && this.returnresult.length > 0){
          this.validData2 = true;
          this.UpdateReturnSelectResult();
        }
      })
    }
    
    
  }

  UpdateOnwardSelectedResult(){
    
    if(this.validData1){
      
      for(let x = 0; x < this.toresult.length; x++){
        this.OnwardSearchResultSelected[x] = new SelectedResults();
        for(let y = 0; y<this.toresult[x].Searches.length; y++){
          this.OnwardSearchResultSelected[x].sP = 0;
        }
      }
    }
    
    
  }

  UpdateReturnSelectResult(){
    if(this.validData2){
      
      for(let x = 0; x < this.returnresult.length; x++){
        this.ReturnSearchResultSelected[x] = new SelectedResults();
        for(let y = 0; y<this.returnresult[x].Searches.length; y++){
          this.ReturnSearchResultSelected[x].sP = 0;
        }
      }
    }
  }

  OnwardSelectChange(value){
    var name = value.name;
    var x = name.split("Onward",1);
    x = Number(x[0]);
    this.OnwardSearchResultSelected[x].sP = Number(value.value);
    
  }

  ReturnSelectChange(value){
    var name = value.name;
    var x = name.split("Return",1);
    x = Number(x[0]);
    this.ReturnSearchResultSelected[x].sP = Number(value.value);
    
  }

  proceedOneWay(){
    this.searchQueryService.searchquery.RetDate = null;
    
      
      this.validData2 = false;
      this.returnSearch = false;
      this.returnresult = undefined;
      
  }

  ProceedButton(){
    var onward: TripSelect = new TripSelect();
    var oSelected: number = Number(this.OnwardSelected);

    if(!isNaN(oSelected) && oSelected < this.toresult.length){
      onward.BusDetails = this.toresult[oSelected].BusDetails;
      onward.Trip = this.toresult[oSelected].Trip;
      onward.Details = this.toresult[oSelected].Searches[this.OnwardSearchResultSelected[oSelected].sP];
      this.tripSelectService.OnwardTrip = new TripSelect();
      this.tripSelectService.OnwardTrip = onward;
      sessionStorage.setItem('onwardJourney', JSON.stringify(onward));
    }
    

    
    if(this.returnSearch){
      
      var ret: TripSelect = new TripSelect();
      var rSelected: number = Number(this.ReturnSelected);

      if(!isNaN(rSelected) && rSelected < this.returnresult.length){
        ret.BusDetails = this.returnresult[rSelected].BusDetails;
        ret.Trip = this.returnresult[rSelected].Trip;
        ret.Details = this.returnresult[rSelected].Searches[this.ReturnSearchResultSelected[rSelected].sP];
        this.tripSelectService.IsReturn = true;
        this.tripSelectService.ReturnTrip = new TripSelect();
        this.tripSelectService.ReturnTrip = ret;
        sessionStorage.setItem('retJourney', JSON.stringify(ret));
        sessionStorage.setItem('IsReturn', "true");
      }
    }else{
      this.tripSelectService.IsReturn = false;
    }

    this.router.navigateByUrl('bookingdetails');
  }
  
}
