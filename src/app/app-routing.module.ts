import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './auth.guard';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { BarComponent } from './pages/bar/bar.component';
import { MenuComponent } from './pages/menu/menu.component';
import { ShopComponent } from './pages/shop/shop.component';
import { ReservasComponent } from './pages/reservas/reservas.component';
import { PerfilComponent } from './pages/perfil/perfil.component';
import { RecuperarComponent } from './pages/recuperar/recuperar.component';
import { ResetComponent } from './pages/reset/reset.component';



const routes: Routes = [
  
  {path: '',component:HomeComponent}, 

  {path: 'recuperar',component:RecuperarComponent},
  {path: 'reset-password',component:ResetComponent},

  {path: 'login', component:LoginComponent}, 
  {path: 'reserva', component:ReservasComponent}, 
  {path: 'perfil', component:PerfilComponent}, 
  {path: 'bar/:id', component:BarComponent},
  {path: 'menu', component:MenuComponent},
  {path: 'shop', component:ShopComponent},

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
