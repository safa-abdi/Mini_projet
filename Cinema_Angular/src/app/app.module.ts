import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CinemaComponent } from './cinema/cinema.component';
import {HttpClientModule} from '@angular/common/http';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import { AddCinemaComponent } from './add-cinema/add-cinema.component';
import { VillesComponent } from './villes/villes.component';
import { AddVilleComponent } from './add-ville/add-ville.component';
import { UpdateVilleComponent } from './update-ville/update-ville.component';
import { GestionCinemaComponent } from './gestion-cinema/gestion-cinema.component';

@NgModule({
  declarations: [
    AppComponent,
    CinemaComponent,
    AddCinemaComponent,
    VillesComponent,
    AddVilleComponent,
    UpdateVilleComponent,
    GestionCinemaComponent
  ],
    imports: [
        BrowserModule,
        AppRoutingModule,
        HttpClientModule,
        FormsModule,
        ReactiveFormsModule
    ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
