package org.sid.services;

import java.util.List;

import org.sid.entities.Categorie;


public interface CategorieService {
	List<Categorie> getAllCategories();
	Categorie saveCat(Categorie v);
	Categorie getCat(long id);
	void deleteCategorieById(Long id);
	Categorie updateCat(Categorie v);

}
