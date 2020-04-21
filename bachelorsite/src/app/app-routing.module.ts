import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ApplicantformComponent } from './applicants/applicantform/applicantform.component';
import { DeleteApplicantComponent } from './applicants/delete-applicant/delete-applicant.component';
import { ContestantsComponent } from './contestants/contestants.component';
import { DatesComponent } from './dates/dates.component';
import { CourtedComponent } from './courted/courted.component';
import { AttendsComponent } from './attends/attends.component';
import { ViewersComponent } from './viewers/viewers.component';

const routes: Routes = [
	{
	    path: 'home',
	    component: HomeComponent
  	},

  	{
	    path: 'applicantform',
	    component: ApplicantformComponent
  	},

    {
      path: 'deleteApplicant',
      component: DeleteApplicantComponent
	},
	
	{
		path: 'contestants',
		component: ContestantsComponent
	},
	
	{
		path: 'dates',
		component: DatesComponent
	},

	{
		path: 'courted',
		component: CourtedComponent
	},

	{
		path: 'attends',
		component: AttendsComponent
	},

	{
		path: 'viewers',
		component: ViewersComponent
	},

  { path: '',   redirectTo: '/home', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
