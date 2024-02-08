import { HttpClient } from '@angular/common/http';
import { Component, effect } from '@angular/core';
import { Observable, map, tap } from 'rxjs';
import { UserService } from 'src/app/services/user.service';
import { OpaFetchService } from 'src/app/services/opa-fetch.service';

type Right = { action: 'create' | 'edit' | 'delete'; allow: 'allow' | 'denied' | 'undefined' };

interface Policy {
  create: Right['allow'];
  edit: Right['allow'];
  delete: Right['allow'];
}

@Component({
  selector: 'app-users-managment',
  templateUrl: './users-managment.component.html',
  styleUrls: ['./users-managment.component.scss'],
})
export class UsersManagmentComponent {
  public PolicyData!: Observable<Policy>;
  user = this.userService.activeUser;

  allowedUserRights: Right[] = [];

  allowedGroupRights: Right[] = [
    { action: 'create', allow: 'denied' },
    { action: 'edit', allow: 'undefined' },
    { action: 'delete', allow: 'undefined' },
  ];

  constructor(
    private userService: UserService,
    private http: HttpClient,
    private opa: OpaFetchService,
  ) {
    effect(() => this.fetchData())
  }


  fetchData() {
    let body = {
      input: {
        user: {
          username: 'ad',
          roles: [this.user()],
        },
      },
    };

    this.PolicyData = this.http
      .post<any>(window.location.origin + '/opa/v1/data/user_managment/users', body)
      .pipe(map((value) => value.result),
      tap((value: Policy) => {
        if(this.allowedUserRights.length === 0) {
          this.allowedUserRights.push({ action: 'create', allow: value.create});
          this.allowedUserRights.push({ action: 'edit', allow: value.edit});
          this.allowedUserRights.push({ action: 'delete', allow: value.delete});
        } else {
          this.allowedUserRights[0] = { action: 'create', allow: value.create};
          this.allowedUserRights[1] = { action: 'edit', allow: value.edit};
          this.allowedUserRights[2] = { action: 'delete', allow: value.delete};
        }
      }));
  }
}

