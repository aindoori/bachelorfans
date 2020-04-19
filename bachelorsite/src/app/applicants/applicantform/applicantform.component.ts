import { Component, OnInit } from '@angular/core';
import { Applicants } from '../applicants';
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { POST_URL } from '../../backend';

@Component({
  selector: 'app-applicantform',
  templateUrl: './applicantform.component.html',
  styleUrls: ['./applicantform.component.css']
})

export class ApplicantformComponent implements OnInit {
	success: boolean;
	password: string;

	constructor(private http: HttpClient) { }

	userModel = new Applicants('','', 21, '', '', '', '');
	responsedata = new Applicants('','', 21, '', '', '', '');

	ngOnInit(): void { }

  sendToBackend(data) {
  	  console.log('hello');
      this.userModel.name = data.regName;
      this.password = data.password;
      this.userModel.age = data.age;
      this.userModel.hometown_city = data.hometown_city;
      this.userModel.hometown_state = data.hometown_state;
      this.userModel.profession = data.profession;
      this.userModel.reason = data.reason;
      this.success = true;

  	let params = JSON.stringify({
  		type: "add_applicant",
  		data: {
  			user: this.userModel,
  			pwd: this.password
  		}
  	});

  	console.log('You submitted value: ', {type: "add_applicant", data:this.userModel});

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
