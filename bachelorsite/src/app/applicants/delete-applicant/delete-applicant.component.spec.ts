import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DeleteApplicantComponent } from './delete-applicant.component';

describe('DeleteApplicantComponent', () => {
  let component: DeleteApplicantComponent;
  let fixture: ComponentFixture<DeleteApplicantComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DeleteApplicantComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DeleteApplicantComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
