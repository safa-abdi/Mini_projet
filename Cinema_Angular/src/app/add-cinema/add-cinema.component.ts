import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { Cinema } from '../model/cinema';
import { Ville } from '../model/ville';
import { CinemaService } from '../services/cinema.service';
import { VilleService } from '../services/ville.service';

@Component({
  selector: 'app-add-cinema',
  templateUrl: './add-cinema.component.html',
  styleUrls: ['./add-cinema.component.css']
})
export class AddCinemaComponent implements OnInit {
  cinemaForm:FormGroup;
  cinemas:Cinema[];

  newVille : Ville;
  message : string;

  villes:any=[];
  newid : number;

  constructor(private cinemaService: CinemaService,private villeService: VilleService,private router :Router,private formBuilder:FormBuilder) { 
    this.cinemaForm = this.formBuilder.group({

      name : new FormControl(''),
      altitude : new FormControl(''),
      latitude : new FormControl(''),
      longitude : new FormControl(''),
      nombre_salles : new FormControl(''),
      vill : new FormControl('')
    })
  }

  ngOnInit(): void {
    this.onSelectProp();

  }
  addCinema(){
    //(altitude :number, latitude : number,longitude : number,name : String,nombre_salles : number,ville : Ville);
    let newCinema : Cinema  = new Cinema(this.cinemaForm.value.altitude,this.cinemaForm.value.latitude,this.cinemaForm.value.longitude,this.cinemaForm.value.name,this.cinemaForm.value.nombre_salles,this.cinemaForm.value.vill);
    this.cinemaService.ajouterCinema(newCinema).subscribe(voit => {
      console.log(voit);
    });
    this.ngOnInit();
    this.router.navigate(['cinema']).then(()=>
    window.location.reload());
 
    }

  
  onSelectProp(){
    this.villeService.listeVilles().subscribe(response=>{
      console.log(response)
      this.villes = response;
      
    }); 
  }

}
