import { Injectable, Output, EventEmitter } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  @Output() getLoggedIn: EventEmitter<any> = new EventEmitter();

  login(): void {
    let user = localStorage.getItem('user');
    let session = localStorage.getItem('session');
    if (user && session){
      this.getLoggedIn.emit(true);
    }
    else{
      this.getLoggedIn.emit(false);
    }
  }

  logout(): void {
      this.getLoggedIn.emit(false);
  }

  constructor() { }
}
