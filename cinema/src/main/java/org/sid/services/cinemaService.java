package org.sid.services;

import java.util.List;

import org.sid.entities.Cinema;
import org.sid.entities.Ville;

public interface cinemaService {
	Cinema updateCinema(Cinema c);
	void deleteCinema(Cinema c);
	void deleteCinemaById(Long id);
	Cinema getCinema(Long id);
	List<Cinema> getAllCinemas();
	Cinema saveCinema(Cinema c);

}
