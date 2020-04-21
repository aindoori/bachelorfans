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
import { ViewersComponent } from './viewers/viewers.component';
import { ApplicantsComponent } from './applicants/applicants.component';
import { Applicants } from './applicants/applicants';
import { HttpClientModule } from '@angular/common/http';
import { DeleteApplicantComponent } from './applicants/delete-applicant/delete-applicant.component';
import { ApplicantsHomeComponent } from './applicants/applicants-home/applicants-home.component';
import { UpdateApplicantComponent } from './applicants/update-applicant/update-applicant.component';

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
    ApplicantsHomeComponent,
    UpdateApplicantComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
