import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { UsersManagmentComponent } from './components/users-managment/users-managment.component';
import { DocumentManagmentComponent } from './components/document-managment/document-managment.component';
import { SignComponent } from './components/sign/sign.component';
import { TasksManagmentComponent } from './components/tasks-managment/tasks-managment.component';
import { HomeComponent } from './home/home.component';
import { CounterComponent } from './counter/counter.component';
import { FetchDataComponent } from './fetch-data/fetch-data.component';

const routes: Routes = [
  // { 
  //   path: '', 
  //   component: HomeComponent, 
  //   pathMatch: 'full' 
  // },
  {
    path: 'counter', 
    component: CounterComponent 
  },
  { 
    path: 'fetch-data', 
    component: FetchDataComponent 
  },
  {
    path: '',
    redirectTo: '/USERS',
    pathMatch: 'full',
  },
  {
    path: 'TASKS',
    component: TasksManagmentComponent,
  },
  {
    path: 'USERS',
    component: UsersManagmentComponent,
  },
  {
    path: 'DOCS',
    component: DocumentManagmentComponent,
  },
  {
    path: 'SIGN',
    component: SignComponent,
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}

