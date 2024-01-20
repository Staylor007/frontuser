export interface DetalleReserva {
  id_detalle_reserva: number;
  id_reserva: number;
  id_menu?: number | undefined; // Hacer i
  cantidad: number;
  precio_unitario: number;
  subtotal: number;
  id_bar: number;
  nombre_menu: string;
  plato: string;
  descripcion: string;
  precio: number;
  estado: string;
  foto: string;
  }