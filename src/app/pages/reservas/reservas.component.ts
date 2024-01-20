import { Component } from '@angular/core';
import { ReservaService } from 'app/services/reserva/reserva.service';
import { DetallereservaService } from 'app/services/detallereserva/detallereserva.service';
import { Reserva } from '../../models/reserva';
import { DetalleReserva } from '@app/models/detallereserva';
import { UserService } from '@app/services/user/user.service';
import { Subscription, interval } from 'rxjs';
@Component({
  selector: 'app-reservas',
  templateUrl: './reservas.component.html',
  styleUrls: ['./reservas.component.css']
})
export class ReservasComponent {
  user: any;  
  list: Reserva[] = [];
  dat: DetalleReserva[] = [];
  loading: boolean = false;

  private tiempoRestanteSub: Subscription = new Subscription();


  constructor(private userService: UserService,private ReservaService: ReservaService,private detallereservaService: DetallereservaService) { }
  
  
  getUser() {
    // Obtener el usuario del servicio
    this.user = this.userService.getCurrentUser();
  }
  
   
  ngOnInit(): void {
    this.getUser();  
    this.getList();   
    this.tiempoRestanteSub = interval(60000).subscribe(() => {
      this.actualizarTiempoRestante();
    });
  }

  ngOnDestroy(): void {
    // Desinscribirse del temporizador al destruir el componente
    if (this.tiempoRestanteSub) {
      this.tiempoRestanteSub.unsubscribe();
    }
  }

  getList(){
    this.loading = true;
    this.ReservaService.getidUser(this.user.userId).subscribe((data:any)=>{     
     this.list = data
     this.actualizarTiempoRestante(); 
      this.loading = false;
    })

  }

  private actualizarTiempoRestante() {
    const ahora = new Date();

    this.list.forEach(reserva => {
        const fechaReserva = new Date(reserva.fecha_reserva);
        const diferenciaEnMilisegundos = ahora.getTime() - fechaReserva.getTime();
        const tiempoRestante = Math.max(30 - Math.floor(diferenciaEnMilisegundos / (1000 * 60)), 0);    
        // Actualizar el tiempo restante para la reserva actual
        reserva.tiempoRestante = tiempoRestante;
       // Actualizar el tiempo restante para la reserva actual
      reserva.tiempoRestante = tiempoRestante;
      if (tiempoRestante <= 0) {
        this.proceso30min(reserva);
      }
    });
  }
 
  delete(id: number){
    this.loading = true;
     this.ReservaService.delete(id).subscribe(()=>{
       this.getList() 
     })
  }

  detalle(id:number){
    this.detallereservaService.getdet(id).subscribe((data:any)=>{     
       this.dat = data;         
    })    
  }

  private proceso30min(reserva: Reserva) {
    console.log(reserva)
    if (reserva.estado == 'Pendiente'){ 
      reserva.estado = 'Cancelado'
      const idReserva = reserva.id_reserva ?? -1;
      this.ReservaService.updateestado(idReserva, reserva).subscribe(() => {
        this.getList();
      });
    }
    // Lógica para realizar el proceso después de 30 minutos
   
  }
}