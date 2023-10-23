import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppMaterialModule } from './app-material.module';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { UsersManagmentComponent } from './components/users-managment/users-managment.component';
import { DocumentManagmentComponent } from './components/document-managment/document-managment.component';
import { TasksManagmentComponent } from './components/tasks-managment/tasks-managment.component';
import { SignComponent } from './components/sign/sign.component';

@NgModule({
  declarations: [
    AppComponent,
    UsersManagmentComponent,
    DocumentManagmentComponent,
    TasksManagmentComponent,
    SignComponent
  ],
  imports: [
    BrowserModule,
    AppMaterialModule,
    AppRoutingModule,
    BrowserAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
