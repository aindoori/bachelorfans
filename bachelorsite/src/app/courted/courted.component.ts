//import { Component, OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
@Component({
  selector: 'app-courted',
  templateUrl: './courted.component.html',
  styleUrls: ['./courted.component.css']
})
export class CourtedComponent {

  title = 'angular8phpmyadmindatabse';
  data = [];
  constructor(private http: HttpClient) {
    this.http.get('http://localhost/courted.php').subscribe(data => {
    this.data.push(data);
    console.log(this.data);
   
    
    }, error => console.error(error));
  }

}
