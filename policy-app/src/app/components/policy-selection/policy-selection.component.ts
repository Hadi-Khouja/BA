import { Component, computed } from '@angular/core';
import { MatSelectionList } from '@angular/material/list';
import { OpaFetchService } from 'src/app/services/opa-fetch.service';
import { SidenavService } from 'src/app/services/sidenav.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'policy-selection',
  templateUrl: './policy-selection.component.html',
  styleUrl: './policy-selection.component.scss',
})
export class PolicySelectionComponent {
  document = computed(() => this.sidenav.data().document);
  user = computed(() => this.sidenav.data().user);
  selection: string[] = [];

  constructor(
    public sidenav: SidenavService,
    public userService: UserService,
    private opa: OpaFetchService,
  ) {}

  public updatePolicy() {
    this.opa.updatePolicy(this.sidenav.data(), this.selectionPrepare());
    this.sidenav.close();
  }

  public onSelectionChange(list: MatSelectionList): void {
    this.selection = list.selectedOptions.selected.map((selected) => selected.value);
  }

  private selectionPrepare(): boolean[] {
    if (this.selection.length === 0) return [false, false];
    return this.selection.flatMap((value) => [value == 'read', value == 'write']);
  }
}
