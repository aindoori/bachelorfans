//import { Component, OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BACHELOR_URL, POST_URL } from '../backend';
import { saveAs } from 'file-saver';

@Component({
  selector: 'app-bachelor',
  templateUrl: './bachelor.component.html',
  styleUrls: ['./bachelor.component.css']
})
export class BachelorComponent {
  ID: string;

  title = 'angular8phpmyadmindatabse';
  data = [];
  constructor(private http: HttpClient) {
    this.http.get(BACHELOR_URL).subscribe(data => {
    this.data.push(data);
    console.log(this.data);
   
    
    }, error => console.error(error));
  }

  upvote(bachID) {
    // console.log(bachID);
    this.ID = bachID;

    console.log(this.ID);

    let params = JSON.stringify({
      type: "upvote_bachelor",
      data: {
        bachID: this.ID,
      }
    });

    console.log('You submitted value: ', {type: "upvote_bachelor", data:this.ID});

    this.http.post(POST_URL, params)
    .subscribe((response) => {
         console.log('Response from backend ', response);
        if (response['success'] == "true"){
          this.ID = response["data"];
          //alert("Success!");
        }
        else{
          alert("Something went wrong");
        }
    }, (error) => {
         // An error occurs, handle an error in some way
         console.log('Error ', error);
    });
  }

  downvote(bachID) {
    // console.log(bachID);
    this.ID = bachID;

    console.log(this.ID);

    let params = JSON.stringify({
      type: "downvote_bachelor",
      data: {
        bachID: this.ID,
      }
    });

    console.log('You submitted value: ', {type: "downvote_bachelor", data:this.ID});

    this.http.post(POST_URL, params)
    .subscribe((response) => {
         console.log('Response from backend ', response);
        if (response['success'] == "true"){
          this.ID = response["data"];
          //alert("Success!");
        }
        else{
          alert("Something went wrong");
        }
    }, (error) => {
         // An error occurs, handle an error in some way
         console.log('Error ', error);
    });
  }

  downloadJSON() {
    var jsonObject = JSON.stringify(this.data);
    var blob = new Blob([jsonObject], {type: "application/json"});
    saveAs(blob, "bachelors.json");
  }

  //Trying to figue out CSV 
  downloadCSV() {
    const replacer = (key, value) => value === null ? '' : value; 
    const header = Object.keys(this.data[0]);
    let csv = this.data.map(row => header.map(fieldName => JSON.stringify(row[fieldName], replacer)).join(','));
    //csv.unshift(header.join(','));
    let csvArray = csv.join('\r\n');
    var blob = new Blob([csvArray], {type: 'text/csv' })
    saveAs(blob, "bachelors.csv");
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
    saveAs(csvBlob,'bachelors.csv')
  }

}

