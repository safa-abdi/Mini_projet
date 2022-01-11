import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionCinemaComponent } from './gestion-cinema.component';

describe('GestionCinemaComponent', () => {
  let component: GestionCinemaComponent;
  let fixture: ComponentFixture<GestionCinemaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GestionCinemaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GestionCinemaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
