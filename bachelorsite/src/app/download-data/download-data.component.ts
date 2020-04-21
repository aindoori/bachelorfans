import { Component, OnInit } from '@angular/core';
import { DomSanitizer, SafeResourceUrl, SafeUrl} from '@angular/platform-browser';
import { Bachelor } from './bachelor';
import { GET_URL } from '../backend';
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';

@Component({
  selector: 'app-download-data',
  templateUrl: './download-data.component.html',
  styleUrls: ['./download-data.component.css']
})
export class DownloadDataComponent implements OnInit {
	// bachelor: Bachelor;
	resJsonResponse: string;
	responsedata: string;

  bachelor = new Bachelor('', '', 0, 0);

  ngOnInit(): void { }

  constructor(private sanitizer: DomSanitizer,
  private http: HttpClient){}

  	getBachelorData() {
  		let params = JSON.stringify({
  			type: "get_all_bachelors"
  		})

  		console.log('Hellooo');

  		    this.http.get(GET_URL + '?str=' + params)
		    .subscribe((response) => {
		         console.log('Response from backend ', response);
		        if (response['success'] == "true"){
		          this.responsedata = response["data"];
		          alert("Success!");
		        }
		        else{
		          alert("Something went wrong");
		        }
		    }, (error) => {
		         // An error occurs, handle an error in some way
		         console.log('Error ', error);
		    });

        var theJSON = JSON.stringify(this.resJsonResponse);
        var uri = this.sanitizer.bypassSecurityTrustUrl("data:text/json;charset=UTF-8," + encodeURIComponent(theJSON));
        //this.downloadJsonHref = uri;
  	}

}
