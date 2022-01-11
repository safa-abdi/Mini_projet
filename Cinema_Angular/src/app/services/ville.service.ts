import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Ville } from '../model/ville';
const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
};

@Injectable({
  providedIn: 'root',
})
export class VilleService {
  public host: string = 'http://localhost:8081/vil';

  constructor(private http: HttpClient) {}

  public listeVilles() {
    //console.log(this.http.get<Ville[]>(this.host+"/vil"));
    return this.http.get(this.host);
  }
  supprimerVille(id: number) {
    const url = `${this.host}/${id}`;
    return this.http.delete(url, httpOptions);
  }
  ajouterVille(prod: Ville): Observable<Ville> {
    return this.http.post<Ville>(this.host, prod, httpOptions);
  }
  updateVille(prod: Ville): Observable<Ville> {
    return this.http.put<Ville>(this.host, prod, httpOptions);
  }
  consulterVille(id: number): Observable<Ville> {
    const url = `${this.host}/${id}`;
    return this.http.get<Ville>(url);
  }
}
