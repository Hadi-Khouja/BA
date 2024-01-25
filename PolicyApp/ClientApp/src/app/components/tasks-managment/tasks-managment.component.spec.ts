import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TasksManagmentComponent } from './tasks-managment.component';

describe('TasksManagmentComponent', () => {
  let component: TasksManagmentComponent;
  let fixture: ComponentFixture<TasksManagmentComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TasksManagmentComponent]
    });
    fixture = TestBed.createComponent(TasksManagmentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
