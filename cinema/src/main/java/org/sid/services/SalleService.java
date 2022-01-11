package org.sid.services;

import java.util.List;

import org.sid.entities.Cinema;
import org.sid.entities.Salle;

public interface SalleService {
	Salle updateSalle(Salle c);
	void deleteSalle(Salle c);
	void deleteSalleById(Long id);
	Salle getSalle(Long id);
	List<Salle> getAllSalle();
	Salle saveSalle(Salle c);
}
