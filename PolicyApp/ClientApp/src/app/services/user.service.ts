import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { UserType } from 'src/app/types/user-types';
import { UserTypes } from 'src/app/types/user-types';
@Injectable({
  providedIn: 'root',
})
export class UserService {
  private activeUser = new BehaviorSubject<UserType>('Admin');
  getActiveUser = this.activeUser.asObservable();

  constructor() {}

  setActiveUser(value: UserType) {
    this.activeUser.next(value);
  }

  getUserTypes() {
    return UserTypes;
  }
}
