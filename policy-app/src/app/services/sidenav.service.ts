import { Injectable, signal } from '@angular/core';
import { MatSidenav } from '@angular/material/sidenav';
import { SideDto } from 'src/types/sidedto';

@Injectable({
  providedIn: 'root',
})
export class SidenavService {
  private sidenav!: MatSidenav;
  public data = signal<SideDto>({
    user: { id: -1, name: '', groupname: '', documents: [] },
    document: { filename: '', type: '', read: false, write: false },
  });

  public setSidenav(sidenav: MatSidenav) {
    this.sidenav = sidenav;
  }

  public open(value: SideDto) {
    this.data.set(value);
    return this.sidenav.open();
  }

  public close() {
    return this.sidenav.close();
  }

  public toggle(): void {
    this.sidenav.toggle();
  }
}
