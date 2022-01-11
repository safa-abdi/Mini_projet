import { Ville } from "./ville";

export class Cinema{
id :number;
altitude :number;
latitude : number;
longitude : number;
name : String;
nombre_salles : number;
ville : Ville;

public constructor(altitude :number, latitude : number,longitude : number,name : String,nombre_salles : number,ville : Ville){
    this.altitude =altitude;
    this.latitude =latitude;
    this.longitude =longitude;
    this.name=name;
    this.nombre_salles=nombre_salles;
    this.ville=ville;
}

}