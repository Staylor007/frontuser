import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { BarService } from '@app/services/bar/bar.service';
import { MenuService } from '@app/services/menu/menu.service';
import { Menu } from '../../models/menu';
import { CartService } from '@app/services/cart/cart.service';
import { CartItem } from '@app/models/cart';
import { environment } from 'environments/environment';



@Component({
  selector: 'app-bar',
  templateUrl: './bar.component.html',
  styleUrls: ['./bar.component.css']
})
export class BarComponent {
  id: number;
  loading: boolean = false;
  list : Menu[] = [];
  currentState = 'All'; 
  env = environment.endpoint; 
  

  constructor(private barService : BarService,
    private menuService : MenuService,
    private router: Router,
    private aRouter: ActivatedRoute,
    private cartService: CartService){ 
    this.id = Number(aRouter.snapshot.paramMap.get('id')); 
  } 
   
  ngOnInit(): void {
    this.getList();   
  }

  getList(){
    this.loading = true;
    this.menuService.getListBar(this.id).subscribe(
      (data: Menu | Menu[]) => { // Allow for a single item or an array
        // Filtrar los elementos con estado diferente de 'Agotado'
        this.list = Array.isArray(data) ? data.filter(item => item.estado !== 'Agotado') : [data];
        this.loading = false;
      },
      (error) => {
        console.error('Error fetching data:', error);
        this.loading = false;
      }
    );
  }  

  filterMenuItems() {
    if (this.currentState === 'All') {
      return this.list; // Display all items
    } else {
      return this.list.filter(item => item.nombre_menu === this.currentState);
    }
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
