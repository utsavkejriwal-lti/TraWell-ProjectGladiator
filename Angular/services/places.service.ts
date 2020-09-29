import {Places} from '../model/place';
import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';

@Injectable()
export class PlaceService{
    constructor(private http: HttpClient){

    }

    getAllPlacesFromAPI(){
        return this.http.get("http://localhost:52374/api/citysearch");
    }
}