import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { BachelorformComponent } from './bachelorform/bachelorform.component';
import { ApplicantformComponent } from './applicants/applicantform/applicantform.component';
import { ContestantsComponent } from './contestants/contestants.component';
import { DatesComponent } from './dates/dates.component';
import { AttendsComponent } from './attends/attends.component';
import { CourtedComponent } from './courted/courted.component';
import { ViewersComponent } from './viewers/viewers.component';
import { ApplicantsComponent } from './applicants/applicants.component';
import { Applicants } from './applicants/applicants';
import { HttpClientModule } from '@angular/common/http';
import { DeleteApplicantComponent } from './applicants/delete-applicant/delete-applicant.component';
import { ApplicantsHomeComponent } from './applicants/applicants-home/applicants-home.component';
import { UpdateApplicantComponent } from './applicants/update-applicant/update-applicant.component';


import { CommonModule } from "@angular/common";

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    PageNotFoundComponent,
    BachelorformComponent,
    ApplicantformComponent,
    ContestantsComponent,
    DatesComponent,
    ViewersComponent,
    ApplicantsComponent,
    DeleteApplicantComponent,
    AttendsComponent,
    CourtedComponent,
    ApplicantsHomeComponent,
    UpdateApplicantComponent

  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
    CommonModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
export class ProductModule { }
