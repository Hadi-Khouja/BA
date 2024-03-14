import { HttpClient } from '@angular/common/http';
import { Component, signal, effect, computed, Signal } from '@angular/core';
import { tap } from 'rxjs';
import { UserService } from 'src/app/services/user.service';
import { OpaFetchService } from 'src/app/services/opa-fetch.service';
import { Right } from 'src/types/right';
import { action } from 'src/types/action';
import { MatSelectionList } from '@angular/material/list';
import { SidenavService } from 'src/app/services/sidenav.service';

@Component({
  selector: 'app-users-managment',
  templateUrl: './users-managment.component.html',
  styleUrls: ['./users-managment.component.scss'],
})
export class UsersManagmentComponent {
  user = this.userService.activeUser;

  allowedUserRights = signal<Right[]>([]);

  selectedValues: Signal<action[]> = computed(() => {
    var array: action[] = [];

    this.allowedUserRights().forEach((right) => {
      if (right.allow === 'allow') array.push(right.action);
    });

    return array;
  });

  constructor(
    private userService: UserService,
    private http: HttpClient,
    private opa: OpaFetchService,
    private sidenav: SidenavService
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

    this.http.post<any>(window.location.origin + '/opa/v1/data/user_managment/users', body).pipe(
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

  public onSelectionChange(list: MatSelectionList): void {
    const route = list.selectedOptions.selected[0].value;
    this.sidenav.open(route);
  }
}
