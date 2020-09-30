import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PreferredBusComponent } from './preferred-bus.component';

describe('PreferredBusComponent', () => {
  let component: PreferredBusComponent;
  let fixture: ComponentFixture<PreferredBusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PreferredBusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PreferredBusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
