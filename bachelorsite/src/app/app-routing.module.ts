import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ApplicantformComponent } from './applicants/applicantform/applicantform.component';
import { DeleteApplicantComponent } from './applicants/delete-applicant/delete-applicant.component';

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

  { path: '',   redirectTo: '/home', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
