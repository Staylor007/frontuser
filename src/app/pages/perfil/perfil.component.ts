import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UbicacionService } from '@app/services/ubicacion/ubicacion.service';
import { UserService } from '@app/services/user/user.service';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.css'],
})
export class PerfilComponent {
  user: any;
  empleado: any = [];
  form!: FormGroup;
  id: number = 0;

  paises: any[] = [];
  provincias: any[] = [];
  ciudades: any[] = [];
  selectedPais!: number; // Cambia el tipo según la estructura de tu modelo de país.

  constructor(
    private ubicacionService: UbicacionService,
    private userService: UserService,
    private router: Router,
    private fb: FormBuilder
  ) {}

  ngOnInit(): void {
    this.form = this.fb.group({
      id_usuario: ['', Validators.required],
      usuario: ['', Validators.required],
      contrasena: [''],
      nombre: ['', Validators.required],
      apellido: [''],
      cedula: [''],
      correo: [''],
      direccion: [''],
      telefono: [''],
       id_ciudad: [''],
       id_pais:[''],
       id_provincia: [''],
      id_tipo_usuario: [''],
    });

    this.user = this.userService.getCurrentUser();
    this.userService.get(this.user.userId).subscribe((data) => {
      this.form.setValue(data);
      this.id = this.user.userId;
    });

    this.ubicacionService.getPais().subscribe((data) => {
      this.paises = data;
    });

     // Escuchar cambios en el select de país
     this.form.get('id_pais')?.valueChanges.subscribe((selectedPais) => {
      if (selectedPais) {
        this.ubicacionService.getProvincia(selectedPais).subscribe((provincias) => {
          this.provincias = provincias;
        });
      }
    });

    // Escuchar cambios en el select de provincia
    this.form.get('id_provincia')?.valueChanges.subscribe((selectedProvincia) => {
      if (selectedProvincia) {
        this.ubicacionService.getCiudad(selectedProvincia).subscribe((ciudades) => {
          this.ciudades = ciudades;
        });
      }
    });
    
  }

  add() {
    const user = this.form.value;
    if (this.id !== 0) {
      this.userService.update(this.id, user).subscribe(() => {
        this.router.navigate(['perfil']);
      });
    }
  }
}
