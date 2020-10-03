import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import {PlaceService} from '../services/places.service';
import {formatDate} from '@angular/common';
import { SearchQueryService } from '../services/searchquery.service';
import { SearchQuery } from '../model/searchquery';



@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  searchForm: FormGroup;
  placeList;
  currentDate = new Date();
  errorMessage:string = "";
  constructor( private placeService: PlaceService, private searchqueryservice: SearchQueryService, private router:Router) { 
    var searchquery = JSON.parse(sessionStorage.getItem("searchquery"));
    this.SessionClearOthers();
    this.searchqueryservice.searchquery = new SearchQuery();
    if(searchquery == undefined || searchquery == null){
      this.searchForm = new FormGroup({
        FromCity:new FormControl(null,[Validators.required,Validators.minLength(4)]),
        ToCity: new FormControl(null,[Validators.required,Validators.minLength(4)]),
        DepDate : new FormControl(formatDate(new Date(), 'yyyy-MM-dd', 'en'),[Validators.required]),
        RetDate: new FormControl(null)
      });
    }else{
      this.searchForm = new FormGroup({
        FromCity:new FormControl(searchquery.FromCity,[Validators.required,Validators.minLength(4)]),
        ToCity: new FormControl(searchquery.ToCity,[Validators.required,Validators.minLength(4)]),
        DepDate : new FormControl(formatDate(searchquery.DepDate, 'yyyy-MM-dd', 'en'),[Validators.required]),
        RetDate: new FormControl(null)
      });
    }
   
  }

  

  ngOnInit(): void {
    this.placeService.getAllPlacesFromAPI().subscribe((data) => {

      this.placeList = data;
      
    },(error) =>{
      this.router.navigateByUrl('/errorpage');
    });

    this.searchForm.valueChanges.subscribe((data) => {
      
      if(!this.ValidateCity(data.FromCity) || !this.ValidateCity(data.ToCity) || this.FromCity.value == this.ToCity.value){
        this.searchForm.setErrors({'incorrect': true});
      }
      if(this.DepDate.value <  formatDate(new Date(), 'yyyy-MM-dd', 'en')){
        this.searchForm.setErrors({'incorrect': true});
      }
    });

    

    
  }

 

  ValidateCity(city:string):boolean{
   
    let found = false;
    for (let index = 0; index < this.placeList.length; index++) {
      if(this.placeList[index].City == city){
       
        found = true;
      }
    }
    return found;
  }

  performSearch(){
    
    this.errorMessage = "";
    if(this.ValidateCity(this.FromCity.value) == false){
      this.errorMessage += "Invalid From City <br>";
    }
    if(this.ValidateCity(this.ToCity.value) == false){
        this.errorMessage += "Invalid To City <br>";
    }

    if(this.FromCity.value == this.ToCity.value){
      this.errorMessage += "From and To city cannot be same <br>";
    }

    if(this.RetDate.value != null && this.RetDate.value != ""){
      if(this.DepDate.value > this.RetDate.value){
        this.errorMessage += "Return Date invalid <br>";
      }
    }
   


    if(this.errorMessage == ""){
      
      this.searchqueryservice.searchquery.FromCity = this.FromCity.value;
      this.searchqueryservice.searchquery.ToCity = this.ToCity.value;
      this.searchqueryservice.searchquery.DepDate = formatDate(new Date(this.DepDate.value), 'yyyy-MM-dd', 'en');
      if(this.RetDate.value == null || this.RetDate.value == ""){
        this.searchqueryservice.searchquery.RetDate = null;
      }else{
        this.searchqueryservice.searchquery.RetDate = formatDate(new Date(this.RetDate.value), 'yyyy-MM-dd', 'en');
      }
      
     

      sessionStorage.setItem('searchquery', JSON.stringify(this.searchqueryservice.searchquery));
     
      this.router.navigateByUrl('searchresults');
      
    }else{
      
      this.errorMessage = '<div class="alert alert-warning" role="alert">There were some error(s):<br> '+ this.errorMessage +' </div>';
    }
    
    
  }

  get FromCity(){
    return this.searchForm.get("FromCity");
  }

  get ToCity(){
    return this.searchForm.get("ToCity");
  }

  get DepDate(){
    return this.searchForm.get("DepDate");
  }

  get RetDate(){
    return this.searchForm.get("RetDate");
  }

  SessionClearOthers(){
    sessionStorage.removeItem('onwardJourney');
    sessionStorage.removeItem('retJourney');
    sessionStorage.removeItem('IsReturn');
  }

}
