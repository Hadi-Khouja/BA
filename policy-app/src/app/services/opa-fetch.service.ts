import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { loadPolicy } from '@open-policy-agent/opa-wasm';
import { exhaustMap, map } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class OpaFetchService {
  constructor(private http: HttpClient) {}

  public async readPolicy(body: any) {
    this.http.get(window.location.origin + '/v1/data/user_managment/users');
  }
}

