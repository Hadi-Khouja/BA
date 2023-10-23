import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Usertypes } from 'src/types/user-types';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  private activeUser = new BehaviorSubject<Usertypes>('Admin');
  getActiveUser = this.activeUser.asObservable();

  constructor() {}

  setActiveUser(value: Usertypes) {
    this.activeUser.next(value);
  }
}

