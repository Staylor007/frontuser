import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'environments/environment';
import { Menu } from '../../models/menu';

@Injectable({
  providedIn: 'root'
})

export class MenuService {
  private myAppUrl: string;
  private myApiUrl: string;

  constructor(private http: HttpClient) {
    this.myAppUrl = environment.endpoint;
    this.myApiUrl = 'api/menu'
   }

  getList(): Observable<Menu[]> {
    return this.http.get<Menu[]>(`${this.myAppUrl}${this.myApiUrl}`);
  }
  
  delete(id:number): Observable<void>{
    return this.http.delete<void>(`${this.myAppUrl}${this.myApiUrl}/${id}`)

  }

  save(product: Menu):Observable<void>{
    return this.http.post<void>
    (`${this.myAppUrl}${this.myApiUrl}`,product)
  }

  get(id: number): Observable<Menu>{
    return this.http.get<Menu>(`${this.myAppUrl}${this.myApiUrl}/${id}`)
  }

  update(id: number, product: Menu): Observable<void>{
    return this.http.put<void>(`${this.myAppUrl}${this.myApiUrl}/${id}`, product)
  }

  getListBar(id: number): Observable<Menu>{
    return this.http.get<Menu>(`${this.myAppUrl}${this.myApiUrl}/bar/${id}`)
  }
}
