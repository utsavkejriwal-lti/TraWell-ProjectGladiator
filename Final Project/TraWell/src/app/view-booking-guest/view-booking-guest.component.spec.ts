import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewBookingGuestComponent } from './view-booking-guest.component';

describe('ViewBookingGuestComponent', () => {
  let component: ViewBookingGuestComponent;
  let fixture: ComponentFixture<ViewBookingGuestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewBookingGuestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewBookingGuestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
