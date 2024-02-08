import { Injectable, signal } from '@angular/core';
import { UserType } from 'src/types/user-types';
import { UserTypes } from 'src/types/user-types';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  activeUser = signal<UserType>('admin');

  setActiveUser(value: UserType) {
    this.activeUser.set(value);
  }

  getUserTypes() {
    return UserTypes;
  }
}
