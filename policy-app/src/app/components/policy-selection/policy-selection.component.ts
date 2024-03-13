import { Component } from '@angular/core';
import { SidenavService } from 'src/app/services/sidenav.service';

@Component({
  selector: 'policy-selection',
  templateUrl: './policy-selection.component.html',
  styleUrl: './policy-selection.component.scss',
})
export class PolicySelectionComponent {
  constructor(private sidenav: SidenavService) {}

  public updatePolicy() {
    this.close();
  }

  public close() {
    this.sidenav.close();
  }
}
