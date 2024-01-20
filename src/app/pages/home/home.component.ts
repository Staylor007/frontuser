import { Component } from '@angular/core';
import { BarService } from 'app/services/bar/bar.service';
import { Bar } from '../../models/bar';
import { environment } from 'environments/environment';



@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
      
  list: Bar[] = [];
  loading: boolean = false;
  env = environment.endpoint; 

  constructor(private barService: BarService) { }

     
  ngOnInit(): void {
    this.getListProducts();   
  }
  
   getListProducts(){
    this.loading = true;
    this.barService.getList().subscribe((data: Bar[])=>{
      this.list = data;
      this.loading = false;
    })

  }
 

}
