import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplicantsHomeComponent } from './applicants-home.component';

describe('ApplicantsHomeComponent', () => {
  let component: ApplicantsHomeComponent;
  let fixture: ComponentFixture<ApplicantsHomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApplicantsHomeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplicantsHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
