import { Component, OnInit } from '@angular/core';
import { Applicants } from '../applicants';
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { POST_URL } from '../../backend'
import { ActivatedRoute, Router } from '@angular/router';
import { AuthenticationService } from 'src/app/authentication.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  name: any;
  password: any;
  responsedata: any;
  confirm_msg: string;
  session: string;
  applicant: Applicants;

  constructor(
  	private route: ActivatedRoute,
    private router: Router,
    private http: HttpClient,
    private authenticationService: AuthenticationService
  ) { }

  ngOnInit(): void {
  }

    processLogIn(data: { name: string; password: string; }) {
    if (!data.name) {
      alert("Name required");
    }
    else if (!data.password) {
      alert("Password required");
    }
    else {
      let params = JSON.stringify({
        type: "login",
        data: {
          name: data.name,
          pwd: data.password,
          session: localStorage.getItem('session')
        }
      });

      console.log('Sending ', params);
      this.http.post(POST_URL, params)
        .subscribe((response) => {
          console.log('Response from backend ', response);
          let found = response['success'];
          if (found) {
            localStorage.setItem('session', response['session']);
            // localStorage.setItem('user', JSON.stringify(response['data']));
            this.authenticationService.login();
            alert("Login Success!");
            this.router.navigate(['/home']);
          }
          else {
            alert("Incorrect User or Password!");
          }
        }, (error) => {
          // An error occurs, handle an error in some way
          console.log('Error ', error);
        });
        this.router.navigate(['/home']);
    }
  }

}
