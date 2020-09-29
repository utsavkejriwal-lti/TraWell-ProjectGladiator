import {SearchQuery} from '../model/searchquery';
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {SearchQueryToSend} from '../model/searchquerytosend';


@Injectable()
export class SearchQueryService{
    searchquery: SearchQuery;
    constructor(private http: HttpClient , private http2: HttpClient){
       
    }

    getSearchResult(search: SearchQueryToSend){
       
        return this.http.post('http://localhost:52374/api/searchquery',search);
    }
}