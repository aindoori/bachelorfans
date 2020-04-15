import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BachelorformComponent } from './bachelorform.component';

describe('BachelorformComponent', () => {
  let component: BachelorformComponent;
  let fixture: ComponentFixture<BachelorformComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BachelorformComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BachelorformComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
