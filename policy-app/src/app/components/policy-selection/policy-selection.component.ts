import { Component, computed } from '@angular/core';
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

  constructor(public sidenav: SidenavService, public userService: UserService) {}

  public updatePolicy() {
    this.close();
  }

  public close() {
    this.sidenav.close();
  }
}
