import { Component } from '@angular/core';
import { CartService } from '@app/services/cart/cart.service';
import { Observable, take } from 'rxjs';
import { CartItem } from '@app/models/cart';
import { AuthService } from '@app/services/auth/auth.service';
import { DetallereservaService } from '@app/services/detallereserva/detallereserva.service';
import { Router } from '@angular/router';
import { UserService } from '@app/services/user/user.service';
import { environment } from 'environments/environment';


@Component({
  selector: 'app-shop',
  templateUrl: './shop.component.html',
  styleUrls: ['./shop.component.css']
})
export class ShopComponent {
  user: any;
  comentario: string = '';
  cartItems$: Observable<CartItem[]>;
  env = environment.endpoint; 
  
  constructor( public cartService: CartService, private authService: AuthService,
    private detalleReserva: DetallereservaService,private router: Router,
    private userService: UserService,) {
    this.cartItems$ = this.cartService.getCartItems();
    this.getUser(); 
  }

  
  getUser() {
    // Obtener el usuario del servicio
    this.user = this.userService.getCurrentUser();
  }

  removeItemFromCart(menuId: any) {
    this.cartService.removeFromCart(menuId);
  }

  isAuthenticated(): boolean {
    return this.authService.isAuthenticated();
  }

  generarCodigoUnico(): string {
    const getRandomNumber = (min: number, max: number) => Math.floor(Math.random() * (max - min + 1)) + min;
    const fechaActual = new Date();
    const codigoUnico = `${
      fechaActual.getFullYear()
    }${fechaActual.getMonth() + 1}${fechaActual.getDate()}${getRandomNumber(1000, 9999)}`;
    return codigoUnico;
  }

 
  createReserva() { 

    console.log('Valor del input:', this.comentario);
    // Obtén la información necesaria para la reserva desde tu carrito
    this.cartItems$.pipe(take(1)).subscribe((cartItems) => {
      // Crea un objeto de reserva con la información necesaria
      const nuevaReserva = {
        id_usuario : this.user.userId,
        fecha_reserva: new Date(), // Asigna la fecha actual o la que desees
        estado: 'Pendiente',
        codigo_estado:this.generarCodigoUnico(),
        comentario:this.comentario,
        // Otros campos de la reserva...
        detalles: cartItems.map(item => ({
          id_menu: item.id_menu,
          id_bar:item.id_bar,
          cantidad: item.cantidad,
          precio_unitario: item.precio_unitario,
          subtotal: item.cantidad*item.precio_unitario,    
        }))
      }; 
     
      this.detalleReserva.save(nuevaReserva).subscribe(
        () => {
          this.cartService.clearCart();
          this.router.navigate(['']);
        },
        (error) => {
          console.error('Error saving reserva:', error);
        }
      ); 
    });
  }  


}