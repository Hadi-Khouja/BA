import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, tap } from 'rxjs';
import { Right } from 'src/types/right';
import { RequestBody } from 'src/types/request-body';

@Injectable({
  providedIn: 'root',
})
export class OpaFetchService {
  constructor(private http: HttpClient) {}

  public getGroups(): Observable<any> {
    return this.http.get(window.location.origin +  "/opa/v1/data/groups").pipe();
  }

  public readPolicy(body: RequestBody): Observable<Right[]> {
    return this.http.post<any>(window.location.origin + '/opa/v1/data/user_managment/users', body).pipe(
      tap((value: any) => {
        let rights: Right[] = [];

        rights.push({ action: 'create', allow: value.result.create });
        rights.push({ action: 'edit', allow: value.result.edit });
        rights.push({ action: 'delete', allow: value.result.delete });
        
        return rights;
      }),
    );
  }

  public updatePolicy() {
    let body = `
      package user_managment

      actions = [
        "create",
        "edit",
        "delete",
      ]

      users := {x: check_rights_on_users(x) | x = actions[_]}

      check_rights_on_users(action) = "allow" {
        input.user.roles[_] == "admin"
        not action == "delete"
      }

      check_rights_on_users(action) = "denied" {
        input.user.roles[_] == "admin"
        action == "delete"
      }

      check_rights_on_users(action) = "allow" {
        input.user.roles[_] == "editor"
      }

      check_rights_on_users(action) = "allow" {
        input.user.roles[_] == "reader"
      }
      `;

    this.http.put<any>(window.location.origin + '/opa/v1/policies/user_managment', body).subscribe();
  }
}

