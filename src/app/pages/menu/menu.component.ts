import { Component } from '@angular/core';
import { MenuService } from 'app/services/menu/menu.service';
import { Menu } from '../../models/menu';
import { CartItem } from '@app/models/cart';
import { CartService } from 'app/services/cart/cart.service'
import { environment } from 'environments/environment';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent {
    
  list: Menu[] = [];
  loading: boolean = false;
  currentState = 'All'; 
  env = environment.endpoint; 

  constructor(private menuService: MenuService,private cartService: CartService) { }
   
  ngOnInit(): void {
    this.getList();   
  }

  getList(){
    this.loading = true;
    this.menuService.getList().subscribe((data: Menu[])=>{
      this.list = data.filter(item => item.estado !== 'Agotado');
      this.loading = false;
    })
  }  

  filterMenuItems() {
    return this.list.filter(item => item.estado !== 'Agotado');
  } 

  addToCart(menu: Menu) {
    // Convierte el objeto Menu a un objeto CartItem antes de agregarlo al carrito
    const cartItem: CartItem = {
      id_menu: menu.id_menu,
      id_bar: menu.id_bar,
      nombre_menu: menu.nombre_menu,
      plato: menu.plato,
      descripcion: menu.descripcion,
      precio: menu.precio,
      estado: menu.estado,
      foto: menu.foto,
      cantidad: 1, // Cantidad inicial, puedes ajustar esto según tus necesidades
      id_detalle_reserva: 0, // Ajusta según tus necesidades
      id_reserva: 0, // Ajusta según tus necesidades
      precio_unitario: menu.precio, // Ajusta según tus necesidades
      subtotal: menu.precio // Ajusta según tus necesidades
    };

    this.cartService.addToCart(cartItem);
  }
}