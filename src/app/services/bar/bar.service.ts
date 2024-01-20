import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'environments/environment';
import { Bar } from '../../models/bar';

@Injectable({
  providedIn: 'root'
})
export class BarService {
  private myAppUrl: string;
  private myApiUrl: string;

  constructor(private http: HttpClient) {
    this.myAppUrl = environment.endpoint;
    this.myApiUrl = 'api/bar'
   }

  getList(): Observable<Bar[]> {
    return this.http.get<Bar[]>(`${this.myAppUrl}${this.myApiUrl}`);
  }
  
  delete(id:number): Observable<void>{
    return this.http.delete<void>(`${this.myAppUrl}${this.myApiUrl}/${id}`)

  }

  save(product: Bar):Observable<void>{
    return this.http.post<void>
    (`${this.myAppUrl}${this.myApiUrl}`,product)
  }

  get(id: number): Observable<Bar>{
    return this.http.get<Bar>(`${this.myAppUrl}${this.myApiUrl}/${id}`)
  }

  update(id: number, product: Bar): Observable<void>{
    return this.http.put<void>(`${this.myAppUrl}${this.myApiUrl}/${id}`, product)
  }
}
