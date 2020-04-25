import { Component, OnInit } from '@angular/core';
import { POST_URL } from '../../backend';
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthenticationService } from 'src/app/authentication.service';

@Component({
  selector: 'app-logout',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.css']
})
export class LogoutComponent implements OnInit {
  loggedOut: boolean;
  confirm_msg = "Logged out successfully!";

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private http: HttpClient,
    private authenticationService: AuthenticationService
  ) { }
  ngOnInit(): void {
    this.logOut();
  }

    logOut() {

    if (localStorage.length == 0) {
      this.confirm_msg = "Not logged in";
      this.router.navigate(['/home']);
    }
    else {
      let params = JSON.stringify({
        type: "logout",
        data: {
          session: localStorage.getItem('session')
        }
      });

      console.log('Sending ', params);
      this.http.post(POST_URL, params)
        .subscribe((response) => {
          console.log('Response from backend ', response);
          let found = response['success'];
          let message = response['message'];
          if (found) {
            localStorage.clear();
            this.authenticationService.logout();
          }
          this.confirm_msg = message;
          alert(message);
        }, (error) => {
          // An error occurs, handle an error in some way
          console.log('Error ', error);
        });
      this.router.navigate(['/home']);
    }
  }

}
