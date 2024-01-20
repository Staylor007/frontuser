import { ChangeDetectorRef, Component } from '@angular/core';
import { Router } from '@angular/router';
import { CartItem } from '@app/models/cart';
import { AuthService } from '@app/services/auth/auth.service';
import { CartService } from '@app/services/cart/cart.service';
import { UserService } from '@app/services/user/user.service';
import { environment } from 'environments/environment';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent {
  user: any;
  cartItems$: Observable<CartItem[]>;
  env = environment.endpoint; 
  isDropdownOpen = false;


  toggleDropdown() {
  this.isDropdownOpen = !this.isDropdownOpen;
}


  constructor(private userService: UserService, public cartService: CartService,
    private authService: AuthService,private router: Router,
    private cdr: ChangeDetectorRef) {
    this.cartItems$ = this.cartService.getCartItems();
    this.getUser();   
  }
  ngOnInit(): void {
    // Suscribirse a los cambios del usuario (esto es opcional si no necesitas reaccionar a cambios)
    this.userService.getCurrentUser().subscribe((user:any) => {
      this.user = user;
      this.cdr.detectChanges(); // Forzar la detección de cambios
    });
  }

  getUser() {
    // Obtener el usuario del servicio
    this.user = this.userService.getCurrentUser();
  }

  isAuthenticated(): boolean {
    return this.authService.isAuthenticated();
  }

  logout() {
    this.authService.logout();
  }

}
