import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { UserComponent } from './user/user.component';
import { HomeComponent } from './home/home.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { BachelorformComponent } from './bachelorform/bachelorform.component';
import { ApplicantformComponent } from './applicantform/applicantform.component';
import { LoginComponent } from './user/login/login.component';
import { LogoutComponent } from './user/logout/logout.component';
import { RegisterApplicantsComponent } from './user/register-applicants/register-applicants.component';
import { ContestantsComponent } from './contestants/contestants.component';
import { DatesComponent } from './dates/dates.component';
import { ViewersComponent } from './viewers/viewers.component';

@NgModule({
  declarations: [
    AppComponent,
    UserComponent,
    HomeComponent,
    PageNotFoundComponent,
    BachelorformComponent,
    ApplicantformComponent,
    LoginComponent,
    LogoutComponent,
    RegisterApplicantsComponent,
    ContestantsComponent,
    DatesComponent,
    ViewersComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }