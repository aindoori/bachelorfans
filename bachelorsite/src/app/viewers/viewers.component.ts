//import { Component, OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { VIEWERS_URL } from '../backend';

@Component({
  selector: 'app-viewers',
  templateUrl: './viewers.component.html',
  styleUrls: ['./viewers.component.css']
})
export class ViewersComponent {

  title = 'angular8phpmyadmindatabse';
  data = [];
  constructor(private http: HttpClient) {
    console.log('hellooooo');
    this.http.get(VIEWERS_URL).subscribe(data => {
    this.data.push(data);
    console.log(this.data);
   
    
    }, error => console.error(error));
  }

}

