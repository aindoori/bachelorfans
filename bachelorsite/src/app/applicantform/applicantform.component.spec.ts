import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplicantformComponent } from './applicantform.component';

describe('ApplicantformComponent', () => {
  let component: ApplicantformComponent;
  let fixture: ComponentFixture<ApplicantformComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApplicantformComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplicantformComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
