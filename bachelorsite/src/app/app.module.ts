import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { UserComponent } from './user/user.component';
import { HomeComponent } from './home/home.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { BachelorformComponent } from './bachelorform/bachelorform.component';
import { ApplicantformComponent } from './applicantform/applicantform.component';

@NgModule({
  declarations: [
    AppComponent,
    UserComponent,
    HomeComponent,
    PageNotFoundComponent,
    BachelorformComponent,
    ApplicantformComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
