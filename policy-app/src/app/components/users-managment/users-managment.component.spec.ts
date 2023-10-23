import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UsersManagmentComponent } from './users-managment.component';

describe('UsersManagmentComponent', () => {
  let component: UsersManagmentComponent;
  let fixture: ComponentFixture<UsersManagmentComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [UsersManagmentComponent]
    });
    fixture = TestBed.createComponent(UsersManagmentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
