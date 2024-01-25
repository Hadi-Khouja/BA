import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DocumentManagmentComponent } from './document-managment.component';

describe('DocumentManagmentComponent', () => {
  let component: DocumentManagmentComponent;
  let fixture: ComponentFixture<DocumentManagmentComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DocumentManagmentComponent]
    });
    fixture = TestBed.createComponent(DocumentManagmentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
