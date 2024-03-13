import { Component, ViewChild } from '@angular/core';
import { UserService } from './services/user.service';
import { MatSidenav } from '@angular/material/sidenav';
import { SidenavService } from './services/sidenav.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  @ViewChild('drawer') public sidenav!: MatSidenav;

  constructor(
    public userService: UserService,
    private sidenavService: SidenavService,
  ) {}

  ngAfterViewInit(): void {
    this.sidenavService.setSidenav(this.sidenav);
  }
}

