import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Ville } from '../model/ville';
import { VilleService } from '../services/ville.service';

@Component({
  selector: 'app-add-ville',
  templateUrl: './add-ville.component.html',
  styleUrls: ['./add-ville.component.css']
})
export class AddVilleComponent implements OnInit {
  newVille = new Ville();
  message : string;
  constructor(private villeService: VilleService,private router :Router) { }

  ngOnInit(): void {
  }
  addVille(){
    this.villeService.ajouterVille(this.newVille)
    .subscribe(prod => {
    console.log(prod);
    });
    this.router.navigate(['ville']);
    }

}
