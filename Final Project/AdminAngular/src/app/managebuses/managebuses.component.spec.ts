import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManagebusesComponent } from './managebuses.component';

describe('ManagebusesComponent', () => {
  let component: ManagebusesComponent;
  let fixture: ComponentFixture<ManagebusesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManagebusesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManagebusesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
