export interface CartItem {
  id_menu?: number;
  id_bar?: number;
  nombre_menu: string;
  plato: string;
  descripcion?: string;
  precio: number;
  estado?: string;
  foto?: string;
  cantidad: number;
  id_detalle_reserva: number;
  id_reserva: number;
  precio_unitario: number;
  subtotal: number;
}