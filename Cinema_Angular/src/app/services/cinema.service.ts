import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Cinema } from '../model/cinema';
import { Observable } from 'rxjs';
const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
};

@Injectable({
  providedIn: 'root',
})
export class CinemaService {
  public host: string = 'http://localhost:8081';

  constructor(private http: HttpClient) {}

  public getVilles() {
    return this.http.get(this.host + '/vil');
  }

  public getCinemas(v) {
    return this.http.get(v._links.cinemas.href);
  }

  public getSalles(c) {
    return this.http.get(c._links.salles.href);
  }

  public getProjections(salle) {
    let url = salle._links.projections.href.replace('{?projection}', '');
    return this.http.get(url + '?projection=p1');
  }

  public getTicketsPlaces(p) {
    let url = p._links.tickets.href.replace('{?projection}', '');
    return this.http.get(url + '?projection=t1');
  }

  public payerTickets(dataForm) {
    return this.http.post(this.host + '/payerTickets', dataForm);
  }
  ajouterCinema(prod: Cinema): Observable<Cinema> {
    return this.http.post<Cinema>(this.host, prod, httpOptions);
  }
  public listeCinemas() {
    //console.log(this.http.get<Ville[]>(this.host+"/vil"));
    return this.http.get(this.host);
  }
}
