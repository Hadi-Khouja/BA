import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, tap } from 'rxjs';
import { Right } from 'src/types/Right';
import { RequestBody } from 'src/types/request-body';

@Injectable({
  providedIn: 'root',
})
export class OpaFetchService {
  constructor(private http: HttpClient) {}

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
}

