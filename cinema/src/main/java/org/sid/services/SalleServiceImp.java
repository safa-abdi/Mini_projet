package org.sid.services;

import java.util.List;

import org.sid.dao.CinemaRepository;
import org.sid.dao.SalleRepository;
import org.sid.entities.Cinema;
import org.sid.entities.Salle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SalleServiceImp implements SalleService {
	@Autowired
	SalleRepository salleRepository;
	
	@Override
	public Salle updateSalle(Salle c) {
		return salleRepository.save(c);
	}

	@Override
	public void deleteSalle(Salle c) {
		salleRepository.delete(c);
	}

	@Override
	public void deleteSalleById(Long id) {
		salleRepository.deleteById(id);
		
	}

	@Override
	public Salle getSalle(Long id) {
		return salleRepository.findById(id).get();
	}

	@Override
	public List<Salle> getAllSalle() {
		return salleRepository.findAll();
	}

	@Override
	public Salle saveSalle(Salle c) {
		return salleRepository.save(c);
	}

}
