import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { UsersManagmentComponent } from './components/users-managment/users-managment.component';

const routes: Routes = [
  {
    path: '',
    redirectTo: '/USERS',
    pathMatch: 'full',
  },
  {
    path: 'USERS',
    component: UsersManagmentComponent,
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}

