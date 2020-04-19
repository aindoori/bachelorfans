import { Component, OnInit } from '@angular/core';
import { Applicants } from '../applicants';
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { POST_URL } from '../../backend';

@Component({
  selector: 'app-delete-applicant',
  templateUrl: './delete-applicant.component.html',
  styleUrls: ['./delete-applicant.component.css']
})
export class DeleteApplicantComponent implements OnInit {
  success: boolean;
  nameToDelete: string;

  constructor(private http: HttpClient) { }

  userModel = new Applicants('','', 21, '', '', '', '');
  responsedata = new Applicants('','', 21, '', '', '', '');

  ngOnInit(): void {
  }

  deleteApplicant(data) {
  	  let params = JSON.stringify({
  		type: "delete_applicant",
  		data: {
  			name: this.nameToDelete
	  	 }
	  	});

  	     console.log('You submitted value: ', {type: "delete_applicant", data:this.nameToDelete});

	  	this.http.post(POST_URL, params)
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
  }

}
