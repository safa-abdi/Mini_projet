package org.sid.services;

import java.util.List;

import org.sid.dao.CinemaRepository;
import org.sid.entities.Cinema;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class cinemaServiceImp implements cinemaService {
	@Autowired
	CinemaRepository cinemaRepository;

	@Override
	public Cinema updateCinema(Cinema c) {
		return cinemaRepository.save(c);
	}

	@Override
	public void deleteCinema(Cinema c) {
		cinemaRepository.delete(c);
	}

	@Override
	public void deleteCinemaById(Long id) {
		cinemaRepository.deleteById(id);
	}

	@Override
	public Cinema getCinema(Long id) {
		return cinemaRepository.findById(id).get();
	}

	@Override
	public List<Cinema> getAllCinemas() {
		return cinemaRepository.findAll();
	}

	@Override
	public Cinema saveCinema(Cinema c) {
		return cinemaRepository.save(c);
	}

}
