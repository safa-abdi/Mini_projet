package org.sid.services;

import java.util.List;

import org.sid.entities.Ville;

public interface VilleService {
	List<Ville> getAllVilles();
	Ville saveVille(Ville v);
	Ville getVille(long id);
	void deleteVilleById(Long id);
	Ville updateVille(Ville v);

}
