//import { Component, OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { COURTED_URL } from '../backend';
import { saveAs } from 'file-saver';

@Component({
  selector: 'app-courted',
  templateUrl: './courted.component.html',
  styleUrls: ['./courted.component.css']
})
export class CourtedComponent {

  title = 'angular8phpmyadmindatabse';
  data = [];
  constructor(private http: HttpClient) {
    this.http.get(COURTED_URL).subscribe(data => {
    this.data.push(data);
    console.log(this.data);
   
    
    }, error => console.error(error));
  }
  downloadJSON() {
    var jsonObject = JSON.stringify(this.data);
    var blob = new Blob([jsonObject], {type: "application/json"});
    saveAs(blob, "courted.json");
  }

  //Trying to figue out CSV 
  downloadCSV() {
    const replacer = (key, value) => value === null ? '' : value; 
    const header = Object.keys(this.data[0]);
    let csv = this.data.map(row => header.map(fieldName => JSON.stringify(row[fieldName], replacer)).join(','));
    //csv.unshift(header.join(','));
    let csvArray = csv.join('\r\n');
    var blob = new Blob([csvArray], {type: 'text/csv' })
    saveAs(blob, "courted.csv");
  }

  downloadTest(){
    let csvStr = 'Contestant ID, Date ID\n';
    for(let data of this.data){
      var recordStr = data.contestantID + ',' + data.dateID
      csvStr = csvStr + recordStr + '\n'
    }
    var csvBlob = new Blob([csvStr], {
      type: 'text/csv'
    });
    saveAs(csvBlob,'courted.csv')
  }

}
