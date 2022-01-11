package org.sid.services;

import java.util.List;

import org.sid.entities.Seance;

public interface SeanceService {
	Seance updateSeance(Seance c);
	void deleteSeance(Seance c);
	void deleteSeanceById(Long id);
	Seance getCinema(Long id);
	List<Seance> getAllSeance();
	Seance saveSeance(Seance c);
		}
