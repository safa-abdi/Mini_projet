import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AddCinemaComponent } from './add-cinema/add-cinema.component';
import { AddVilleComponent } from './add-ville/add-ville.component';
import {CinemaComponent} from './cinema/cinema.component';
import { UpdateVilleComponent } from './update-ville/update-ville.component';
import { VillesComponent } from './villes/villes.component';


const routes: Routes = [
  {path: "cinema",component: CinemaComponent},
  {path: "add-cinema", component : AddCinemaComponent},
  {path: "villes",component: VillesComponent},
  {path: "add-ville", component : AddVilleComponent},
  {path: "updateVille/:id", component: UpdateVilleComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
