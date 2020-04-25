import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { POST_URL } from '../../backend';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-applicants-home',
  templateUrl: './applicants-home.component.html',
  styleUrls: ['./applicants-home.component.css']
})
export class ApplicantsHomeComponent implements OnInit {
  loggedIn: boolean;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private http: HttpClient
  ) { }

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

}
