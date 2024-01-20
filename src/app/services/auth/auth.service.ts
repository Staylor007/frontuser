import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'environments/environment';
import { UserService } from '@app/services/user/user.service';
import { JwtHelperService } from '@auth0/angular-jwt';
import { Router } from '@angular/router';



@Injectable({
  providedIn: 'root'
})
export class AuthService { 
  private myAppUrl: string;
  private myApiUrl: string;
  private jwtHelper: JwtHelperService;

  constructor(
    private http: HttpClient,
    private userService: UserService,
    private router: Router
  ) {
    this.myAppUrl = environment.endpoint;
    this.myApiUrl = 'api/auth';
    this.jwtHelper = new JwtHelperService();
  }

  login(username: string, password: string): Observable<any> {
    return this.http.post(`${this.myAppUrl}${this.myApiUrl}/login`, { username, password });
  }

  setToken(token: string): void {
    localStorage.setItem('token', token);
  }

  getToken(): string | null {
    return localStorage.getItem('token');
  }

  setUserInfo(user: any): void {
    localStorage.setItem('user', JSON.stringify(user));
  }

  getUserInfo(): any | null {
    const userString = localStorage.getItem('user');
    return userString ? JSON.parse(userString) : null;
  }

  logout(): void {
    this.clearSession();
    // Redirigir a la página de inicio de sesión o a la página deseada
    this.router.navigate(['/']);
  }

  clearSession(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    this.userService.clearCurrentUser();
  }

  isAuthenticated(): boolean {
    const token = this.getToken();
    // Devuelve false si el token no existe o ha expirado
    return token ? !this.jwtHelper.isTokenExpired(token) : false;
  }

  requestPasswordReset(email: string,origin:string): Observable<any> {
    //envia correo con token para reseteo
    const url = `${this.myAppUrl}${this.myApiUrl}/password-reset`;
    return this.http.post(url, { email , origin });
  }

  resetPassword(token: string, newPassword: string): Observable<any> {
    const url = `${this.myAppUrl}${this.myApiUrl}/reset-password`;
    const body = { token, newPassword };
    return this.http.post(url, body);
  }    
}