import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Ville } from '../model/ville';
import { VilleService } from '../services/ville.service';

@Component({
  selector: 'app-update-ville',
  templateUrl: './update-ville.component.html',
  styles: [
  ]
})
export class UpdateVilleComponent implements OnInit {
  currentVille = new Ville();

  constructor(private activatedRoute: ActivatedRoute,
    private villeService: VilleService,
    private router :Router) { }

  ngOnInit(): void {
    this.villeService.consulterVille(this.activatedRoute.snapshot.params.id).
    subscribe( prod =>{ this.currentVille = prod; } ) ;
  }
  updateVille()
  { //console.log(this.currentProduit);
    this.villeService.updateVille(this.currentVille).subscribe(prod => {
      this.router.navigate(['ville']);
      },(error) => { alert("Problème lors de la modification !"); }
      );
      
  }

}
