package org.sid.services;

import java.util.List;

import org.sid.dao.CategorieRepository;
import org.sid.dao.VilleRepository;
import org.sid.entities.Categorie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategorieServiceImp implements CategorieService{
	@Autowired
	CategorieRepository catRepository;
	@Override
	public List<Categorie> getAllCategories() {
		return catRepository.findAll();
	}

	@Override
	public Categorie saveCat(Categorie v) {
		return catRepository.save(v);
	}

	@Override
	public Categorie getCat(long id) {
		return catRepository.findById(id).get();
	}

	@Override
	public void deleteCategorieById(Long id) {
		catRepository.deleteById(id);		
	}

	@Override
	public Categorie updateCat(Categorie v) {
		return catRepository.save(v);
	}

}
