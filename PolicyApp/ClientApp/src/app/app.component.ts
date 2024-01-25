import { Component } from '@angular/core';
import { MatSelectionList } from '@angular/material/list';
import { Router } from '@angular/router';
import { UserService } from './services/user.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {
  constructor(
    private router: Router,
    public userService: UserService
  ) {}

  public onSelectionChange(list: MatSelectionList): void {
    const route = list.selectedOptions.selected[0].value;
    this.router.navigate([route]);
  }

  public isSelected(value: string): boolean {
    return value === this.router.url.slice(1);
  }
}
