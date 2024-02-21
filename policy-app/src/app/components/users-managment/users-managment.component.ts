import { HttpClient } from '@angular/common/http';
import { Component, signal, effect, computed, Signal } from '@angular/core';
import { Observable, tap } from 'rxjs';
import { UserService } from 'src/app/services/user.service';
import { OpaFetchService } from 'src/app/services/opa-fetch.service';
import { Policy } from 'src/types/policy';
import { Right } from 'src/types/Right';

@Component({
  selector: 'app-users-managment',
  templateUrl: './users-managment.component.html',
  styleUrls: ['./users-managment.component.scss'],
})
export class UsersManagmentComponent {
  public PolicyData!: Observable<Policy>;
  user = this.userService.activeUser;

  allowedUserRights = signal<Right[]>([]);

  selectedValues: Signal<Right['action'][]> = computed(() => {
    var array: Right['action'][] = [];

    this.allowedUserRights().forEach((right) => {
      if (right.allow === 'allow') array.push(right.action);
    });

    return array;
  });

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
    effect(() => this.fetchData());
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

    this.PolicyData = this.http.post<any>(window.location.origin + '/opa/v1/data/user_managment/users', body).pipe(
      tap((value: any) => {
        this.allowedUserRights.update((rights) => {
          if (rights.length === 0) {
            rights.push({ action: 'create', allow: value.result.create });
            rights.push({ action: 'edit', allow: value.result.edit });
            rights.push({ action: 'delete', allow: value.result.delete });
          } else {
            rights[0] = { action: 'create', allow: value.result.create };
            rights[1] = { action: 'edit', allow: value.result.edit };
            rights[2] = { action: 'delete', allow: value.result.delete };
          }

          return rights;
        });
      }),
    );
  }
}

