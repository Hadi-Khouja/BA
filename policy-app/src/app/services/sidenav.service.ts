import { Injectable } from '@angular/core';
import { MatSidenav } from '@angular/material/sidenav';

@Injectable({
  providedIn: 'root',
})
export class SidenavService {
  private sidenav!: MatSidenav;
  private data!: any;

  public setSidenav(sidenav: MatSidenav) {
    this.sidenav = sidenav;
  }

  public getData() {
    return this.data;
  }

  public open(data: any) {
    this.data = data;
    return this.sidenav.open();
  }

  public close() {
    return this.sidenav.close();
  }

  public toggle(): void {
    this.sidenav.toggle();
  }
}
