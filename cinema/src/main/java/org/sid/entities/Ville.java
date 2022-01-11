package org.sid.entities;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Data  @NoArgsConstructor
public class Ville {
	@Id  @GeneratedValue
	private Long id;
	private String name;
	private double longitude, latitude, altitude;
	@OneToMany(mappedBy = "ville")
	private Collection<Cinema> cinemas;
	public Ville(Long id, String name, double longitude, double latitude, double altitude, Collection<Cinema> cinemas) {
		super();
		this.id = id;
		this.name = name;
		this.longitude = longitude;
		this.latitude = latitude;
		this.altitude = altitude;
		this.cinemas = cinemas;
	}
	
}
