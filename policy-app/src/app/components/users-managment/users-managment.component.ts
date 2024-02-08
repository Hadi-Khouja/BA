import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
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
export class UsersManagmentComponent implements OnInit {
  public PolicyData!: Observable<Policy>;

  allowedUserRights: Right[] = [
    { action: 'create', allow: 'allow' },
    { action: 'edit', allow: 'allow' },
    { action: 'delete', allow: 'undefined' },
  ];

  allowedGroupRights: Right[] = [
    { action: 'create', allow: 'denied' },
    { action: 'edit', allow: 'undefined' },
    { action: 'delete', allow: 'undefined' },
  ];

  constructor(
    private userService: UserService,
    private http: HttpClient,
    private opa: OpaFetchService,
  ) {}

  ngOnInit(): void {
    let body = {
      input: {
        user: {
          username: 'ad',
          roles: ['developer', 'admin'],
        },
      },
    };

    this.PolicyData = this.http
      .post<any>(window.location.origin + '/opa/v1/data/user_managment/users', body)
      .pipe(map((value) => value.result),
      tap((value: Policy) => {
        this.allowedUserRights[0].allow = value.create;
        this.allowedUserRights[1].allow = value.edit;
        this.allowedUserRights[2].allow = value.delete;
      }));
  }
}

