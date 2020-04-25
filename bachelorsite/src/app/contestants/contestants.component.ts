//import { Component, OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CONTESTANT_URL, POST_URL } from '../backend';
import { saveAs } from 'file-saver';

@Component({
  selector: 'app-contestants',
  templateUrl: './contestants.component.html',
  styleUrls: ['./contestants.component.css']
})
export class ContestantsComponent {
  ID: string;
  title = 'angular8phpmyadmindatabse';
  data = [];
  constructor(private http: HttpClient) {
    this.http.get(CONTESTANT_URL).subscribe(data => {
    this.data.push(data);
    console.log(this.data);
   
    
    }, error => console.error(error));
  }

  upvote(contestantID) {
    // console.log(contestantID);
    this.ID = contestantID;

    console.log(this.ID);

    let params = JSON.stringify({
      type: "upvote_contestant",
      data: {
        contestantID: this.ID,
      }
    });

    console.log('You submitted value: ', {type: "upvote_contestant", data:this.ID});

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

  downvote(contestantID) {
    // console.log(contestantID);
    this.ID = contestantID;

    console.log(this.ID);

    let params = JSON.stringify({
      type: "downvote_contestant",
      data: {
        contestantID: this.ID,
      }
    });

    console.log('You submitted value: ', {type: "downvote_contestant", data:this.ID});

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
    saveAs(blob, "contestants.json");
  }

  //Trying to figue out CSV 
  downloadCSV() {
    const replacer = (key, value) => value === null ? '' : value; 
    const header = Object.keys(this.data[0]);
    let csv = this.data.map(row => header.map(fieldName => JSON.stringify(row[fieldName], replacer)).join(','));
    //csv.unshift(header.join(','));
    let csvArray = csv.join('\r\n');
    var blob = new Blob([csvArray], {type: 'text/csv' })
    saveAs(blob, "contestants.csv");
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
    saveAs(csvBlob,'contestants.csv')
  }

}
