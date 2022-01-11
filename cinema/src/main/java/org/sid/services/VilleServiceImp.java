package org.sid.services;

import java.util.List;

import org.sid.dao.VilleRepository;
import org.sid.entities.Ville;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VilleServiceImp implements VilleService{
	@Autowired
	VilleRepository villeRepository;
	@Override
	public List<Ville> getAllVilles() {
		return villeRepository.findAll();
	}
	@Override
	public Ville saveVille(Ville v) {
		return villeRepository.save(v);
	}
	@Override
	public Ville getVille(long id) {
		return villeRepository.findById(id).get();
	}
	@Override
	public void deleteVilleById(Long id) {
		villeRepository.deleteById(id);
		
	}
	@Override
	public Ville updateVille(Ville v) {
		return villeRepository.save(v);

	}

}
