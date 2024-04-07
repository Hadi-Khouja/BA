import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { OpaFetchService } from 'src/app/services/opa-fetch.service';
import { MatSelectionList } from '@angular/material/list';
import { SidenavService } from 'src/app/services/sidenav.service';
import { Group } from 'src/types/group';
import { User } from 'src/types/user';

@Component({
  selector: 'app-users-managment',
  templateUrl: './users-managment.component.html',
  styleUrls: ['./users-managment.component.scss'],
})
export class UsersManagmentComponent implements OnInit {
  public users$!: Observable<User[]>;
  public groups$!: Observable<Group[]>;

  constructor(
    private opa: OpaFetchService,
    private sidenav: SidenavService,
  ) {}

  public ngOnInit(): void {
    this.users$ = this.opa.getUsers();
    this.groups$ = this.opa.getGroups();
  }

  public onSelectionChange(list: MatSelectionList, user: User): void {
    const document = list.selectedOptions.selected[0].value;
    this.sidenav.open({ user, document });
  }
}
