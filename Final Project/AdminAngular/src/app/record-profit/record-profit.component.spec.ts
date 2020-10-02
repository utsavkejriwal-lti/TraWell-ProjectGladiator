import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RecordProfitComponent } from './record-profit.component';

describe('RecordProfitComponent', () => {
  let component: RecordProfitComponent;
  let fixture: ComponentFixture<RecordProfitComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RecordProfitComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RecordProfitComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
