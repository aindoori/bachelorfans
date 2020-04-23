//import { Component, OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ATTENDS_URL } from '../backend';

@Component({
  selector: 'app-attends',
  templateUrl: './attends.component.html',
  styleUrls: ['./attends.component.css']
})
export class AttendsComponent {

  title = 'angular8phpmyadmindatabse';
  data = [];
  constructor(private http: HttpClient) {
    this.http.get(ATTENDS_URL).subscribe(data => {
    this.data.push(data);
    console.log(this.data);
   
    
    }, error => console.error(error));
  }

}

