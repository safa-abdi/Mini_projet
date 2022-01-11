import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Ville } from '../model/ville';
import { VilleService } from '../services/ville.service';

@Component({
  selector: 'app-villes',
  templateUrl: './villes.component.html',
  styleUrls: ['./villes.component.css']
})
export class VillesComponent implements OnInit {
 villes :any;
 //public villes;
  constructor(private villeService:VilleService,private router :Router) { }

  ngOnInit(): void {
    /*this.villeService.listeVilles().subscribe(prods => {
      console.log(prods);
      this.villes = prods;
      });*/
      this.villeService.listeVilles().subscribe(data=>{ this.villes=data; },error => { console.log(error); })
      console.log(this.villes);
  }
  supprimerVilles(p: Ville)
  {
    let conf = confirm("Etes-vous sûr ?");
    if (conf)
    this.villeService.supprimerVille(p.id).subscribe(() => {
    console.log("ville supprimé");
    this.SuprimerVilleDuTableau(p);
    });
    
  }
SuprimerVilleDuTableau(prod : Ville) {

    this.villes.forEach((cur, index) => {
    if(prod.id=== cur.id) {
    this.villes.splice(index, 1);
    }
    });
    }

}
