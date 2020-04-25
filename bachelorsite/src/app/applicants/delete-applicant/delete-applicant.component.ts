import { Component, OnInit } from '@angular/core';
import { Applicants } from '../applicants';
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { POST_URL } from '../../backend';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-delete-applicant',
  templateUrl: './delete-applicant.component.html',
  styleUrls: ['./delete-applicant.component.css']
})
export class DeleteApplicantComponent implements OnInit {
  success: boolean;
  nameToDelete: string;
  loggedIn: boolean;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private http: HttpClient
  ) { }

  userModel = new Applicants('','', 21, '', '', '', '');
  responsedata = new Applicants('','', 21, '', '', '', '');

  ngOnInit(): void {
    console.log("initiating");
    let user = localStorage.getItem('user');
    console.log(JSON.parse(user)['name']);
    if (user) {
      // this.name = JSON.parse(user)['name'];
      this.loggedIn = true;
    }
    else{
      // this.name = 'Log In';
      this.loggedIn = false;
      this.router.navigate(['/home']);
    }
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
