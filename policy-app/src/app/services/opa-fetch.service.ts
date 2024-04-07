import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, concatMap, from, map, switchMap, toArray } from 'rxjs';
import { Group } from 'src/types/group';
import { User } from 'src/types/user';

@Injectable({
  providedIn: 'root',
})
export class OpaFetchService {
  constructor(private http: HttpClient) {}

  public getUsers(): Observable<User[]> {
    return this.http.get<User[]>('/opa/v1/data/users').pipe(
      map((value: any) => value.result),
      switchMap((users: any[]) =>
        from(users).pipe(
          concatMap((user) =>
            this.getDocuments(user).pipe(
              map((documents: Document[]) => {
                user.documents = documents;
                return user;
              }),
            ),
          ),
          toArray(),
        ),
      ),
    );
  }

  public getGroups(): Observable<Group[]> {
    return this.http.get<Group[]>('/opa/v1/data/groups').pipe(
      map((value: any) => value.result),
      switchMap((groups: any[]) =>
        from(groups).pipe(
          concatMap((group) =>
            this.getMembers(group).pipe(
              map((members: User[]) => {
                group.members = members;
                return group;
              }),
            ),
          ),
          toArray(),
        ),
      ),
    );
  }

  public getDocuments(user: User): Observable<Document[]> {
    let body = this.createRequestBody({
      user: {
        id: user.id,
        name: user.name,
        groupname: user.groupname,
      },
    });

    return this.http.post<any>('/opa/v1/data/user_managment/documents', body).pipe(map((value: any) => value.result));
  }

  private getMembers(group: Group): Observable<User[]> {
    let body = this.createRequestBody({
      group: {
        name: group.name,
        id: group.group_id,
      },
    });

    return this.http.post<any>('/opa/v1/data/user_managment/membersOfGroup', body).pipe(
      map((value: any) => {
        return value.result.map((member: any) => ({
          name: member.username,
          id: member.user_id,
        }));
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

  private createRequestBody(object: any) {
    return {
      input: object,
    };
  }
}
