import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { UserService } from 'src/app/services/user.service';
import { OpaFetchService } from 'src/app/services/opa-fetch.service';

type Right = { action: 'create' | 'edit' | 'delete'; allow: boolean | 'undefined' };

@Component({
  selector: 'app-users-managment',
  templateUrl: './users-managment.component.html',
  styleUrls: ['./users-managment.component.scss'],
})
export class UsersManagmentComponent implements OnInit {
  public PolicyData!: Observable<any>;

  allowedUserRights: Right[] = [
    { action: 'create', allow: true },
    { action: 'edit', allow: true },
    { action: 'delete', allow: 'undefined' },
  ];

  allowedGroupRights: Right[] = [
    { action: 'create', allow: false },
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
  
    this.http.get<any>("http://localhost:8000/opa/v1/data/user_managment/users").subscribe({
      next: (data) => {
        console.log(data);
      }, 
      error: () => {
        console.log("fehler");
      }
    });
  }
}

