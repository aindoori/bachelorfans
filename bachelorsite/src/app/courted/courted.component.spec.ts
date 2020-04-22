import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CourtedComponent } from './courted.component';

describe('CourtedComponent', () => {
  let component: CourtedComponent;
  let fixture: ComponentFixture<CourtedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CourtedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CourtedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});