package org.sid.services;

import java.util.List;


import org.sid.dao.CinemaRepository;
import org.sid.dao.SeanceRepository;
import org.sid.entities.Seance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SeanceServiceImp implements SeanceService{
	@Autowired
	SeanceRepository seanceRepository;
	@Override
	public Seance updateSeance(Seance c) {
		return seanceRepository.save(c);
	}

	@Override
	public void deleteSeance(Seance c) {
		seanceRepository.delete(c);		
	}

	@Override
	public void deleteSeanceById(Long id) {
		seanceRepository.deleteById(id);		
	}

	@Override
	public Seance getCinema(Long id) {
		return seanceRepository.findById(id).get();
	}

	@Override
	public List<Seance> getAllSeance() {
		return seanceRepository.findAll();
	}

	@Override
	public Seance saveSeance(Seance c) {
		return seanceRepository.save(c);
	}

}
