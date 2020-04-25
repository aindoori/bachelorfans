import { Component, OnInit } from '@angular/core';
import { POST_URL } from '../backend';
import { AuthenticationService } from '../authentication.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  loggedIn: boolean;

  constructor(private authenticationService: AuthenticationService) {
    authenticationService.getLoggedIn.subscribe(success => this.changeName(success));
  }

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

  private changeName(success: boolean): void {
    if (success){
    	this.loggedIn = success;
    }
  }

}
