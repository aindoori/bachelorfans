import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  loggedIn: boolean;

  constructor() { }

  ngOnInit(): void {
    let user = localStorage.getItem('user');
    if (user) {
      // this.name = JSON.parse(user)['name'];
      this.loggedIn = true;
    }
    else{
      // this.name = 'Log In';
      this.loggedIn = false;
    }
  }

}
