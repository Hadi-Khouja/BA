import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, concatMap, from, map, switchMap, toArray } from 'rxjs';
import { Group } from 'src/types/group';
import { SideDto } from 'src/types/sidedto';
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
        id: user.user_id,
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

  public updatePolicy(data: SideDto, selection: boolean[]) {
    let body = `
      package custom_documents
      custom_permission("${data.document.filename}", ${data.user.user_id}) := [${selection[0]}, ${selection[1]}]
      `;
    this.http.put<any>('/opa/v1/policies/custom_documents', body).subscribe();
  }

  private createRequestBody(object: any) {
    return {
      input: object,
    };
  }
}
