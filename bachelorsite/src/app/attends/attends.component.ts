import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import * as FileSaver from 'file-saver';
import { saveAs } from 'file-saver';

@Component({
  selector: 'app-attends',
  templateUrl: './attends.component.html',
  styleUrls: ['./attends.component.css']
})
export class AttendsComponent implements OnInit {

  title = 'angular8phpmyadmindatabse';
  data = [];
  constructor(private http: HttpClient) {
    this.http.get('http://localhost/attends.php').subscribe(data => {
    this.data.push(data);
    console.log(this.data);
    }, error => console.error(error));
  }


  downloadFile() {
    const replacer = (key, value) => value === null ? '' : value; 
    const header = Object.keys(this.data[0]);
    let csv = this.data.map(row => header.map(fieldName => JSON.stringify(row[fieldName], replacer)).join(','));
    //csv.unshift(header.join(','));
    let csvArray = csv.join('\r\n');
    var blob = new Blob([csvArray], {type: 'text/csv' })

    //var jsonObject = JSON.stringify(this.data);
    //var blob = new Blob([jsonObject], {type: 'text/csv' })
    saveAs(blob, "attends.csv");
  }

  download(){
    // Variable to store data as CSV string 
    let csvStr = 'Contestant ID, Date ID\n';
    // Fetch data from service
    for(let data of this.data){
      var recordStr = data.contestantID + ',' + data.dateID
      csvStr = csvStr + recordStr + '\n'
    }
    // Convert string to blob
    var csvBlob = new Blob([csvStr], {
      type: 'text/csv'
    });
    // Download
    saveAs(csvBlob,'data.csv')
}


  ngOnInit(): void { }



}


