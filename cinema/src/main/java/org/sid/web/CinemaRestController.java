package org.sid.web;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.sid.dao.FilmRepository;
import org.sid.dao.TicketRepository;
import org.sid.dao.VilleRepository;
import org.sid.entities.Categorie;
import org.sid.entities.Cinema;
import org.sid.entities.Film;
import org.sid.entities.Seance;
import org.sid.entities.Ticket;
import org.sid.entities.Ville;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.sid.services.CategorieService;
import org.sid.services.SeanceService;
import org.sid.services.VilleService;
import org.sid.services.cinemaService;
import lombok.Data;
@RestController
public class CinemaRestController {
	/*
	 * @Autowired private FilmRepository filmRepository;
	 * 
	 * @GetMapping("/listFilms") public List<Film> films(){ return
	 * filmRepository.findAll(); }
	 */
	@Autowired
	private FilmRepository filmRepository;
	@Autowired
	private TicketRepository ticketRepository;
	@Autowired
	cinemaService cinemaService;
	@Autowired
	CategorieService categorieService;
	@Autowired
	SeanceService seanceService;
	@Autowired
	VilleService villeService;
	//------------------------ Ville -----------------------------------------------
	   @PostMapping(path = "api/addville")
	    void addNewQuoteOrUpdate(@RequestBody(required = true) Ville ville) {
	        villeService.saveVille(ville);
	    }
	   @GetMapping(path ="/api/villes")
	    List<Ville> getVille()  {
	        return villeService.getAllVilles();
	    }
	 
	   @GetMapping(path = "api/villes/{id}")
	    Ville getVille(@PathVariable(name = "id") long id) {
	        return villeService.getVille(id);
	    }
	   @RequestMapping(path="/api/delvilles/{id}",method = RequestMethod.DELETE)
	   public void deleteVoiture(@PathVariable("id") Long id)
	   {
		   villeService.deleteVilleById(id);
	   }
	   @RequestMapping(path="/update",method = RequestMethod.PUT)
	    public Ville updateUser(@RequestBody Ville ville){
	        return villeService.updateVille(ville);
	    }
		//------------------------ Seance -----------------------------------------------
	   @GetMapping(path ="/apis/seances")
	    List<Seance> getSeance()  {
	        return seanceService.getAllSeance();
	    }
	   @PostMapping(path = "apis/addseance")
	    void addSeance(@RequestBody(required = true) Seance seance) {
		   seanceService.saveSeance(seance);
	    }
	   @RequestMapping(path="/api/delSeances/{id}",method = RequestMethod.DELETE)
	   public void deleteS(@PathVariable("id") Long id)
	   {
		   seanceService.deleteSeanceById(id);
	   }
	   @RequestMapping(path="/updateS",method = RequestMethod.PUT)
	    public Seance updateS(@RequestBody Seance seance){
	        return seanceService.updateSeance(seance);
	    }
		//------------------------ Cinma -----------------------------------------------
	   @GetMapping(path ="/api/cinemas")
	    List<Cinema> getCinemas()  {
	        return cinemaService.getAllCinemas();
	    }
	   @PostMapping(path = "api/addcinema")
	    void addNewQuoteOrUpdate(@RequestBody(required = true) Cinema cinema) {
		   cinemaService.saveCinema(cinema);
	    }
		//------------------------ Catégories -----------------------------------------------
	   @GetMapping(path ="/apia/categories")
	    List<Categorie> getCateg()  {
	        return categorieService.getAllCategories();
	    }

	 
	   @PostMapping(path = "api/addcateg")
	    void addNewCategorie(@RequestBody(required = true) Categorie cat) {
		   categorieService.saveCat(cat);
	    }
	   @RequestMapping(path="/api/delcat/{id}",method = RequestMethod.DELETE)
	   public void deleteCateg(@PathVariable("id") Long id)
	   {
		   categorieService.deleteCategorieById(id);
	   }
	   @RequestMapping(path="/updateCateg",method = RequestMethod.PUT)
	    public Categorie updateCateg(@RequestBody Categorie cat){
	        return categorieService.updateCat(cat);
	    }
	   
	   /*
	   @PostMapping(path ="/api/delvilles/{id}")
	   public void deleteVoiture(@PathVariable(name="id") long id)
	   {
		   villeService.deleteVilleById(id);
	   }*/
	@Autowired
	private VilleRepository villeRepository;
	
	@GetMapping(path = "/imageFilm/{id}", produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] image(@PathVariable(name = "id") Long id) throws Exception {

		Film f = filmRepository.findById(id).get();
		String photoName = f.getPhoto();
		File file = new File(System.getProperty("user.home") + "/cinema/images/" + photoName);
		System.out.println(file);
		// File file=new File(System.getProperty("D:/images/"+photoName));
		Path path = Paths.get(file.toURI());
		return Files.readAllBytes(path);
	}
	@RequestMapping(path="allV",method = RequestMethod.GET)
	public List<Ville> getAllVilles()
	{   
		return villeRepository.findAll();	
	}

	@PostMapping("/payerTickets")
	@Transactional
	public List<Ticket> payerTickets(@RequestBody TicketForm ticketForm) {
		List<Ticket> listTickets = new ArrayList<Ticket>();
		ticketForm.getTickets().forEach(idTicket -> {
			//System.out.println(idTicket);
			Ticket ticket = ticketRepository.findById(idTicket).get();
			ticket.setNomClient(ticketForm.getNomClient());
			ticket.setReservee(true);
			ticketRepository.save(ticket);
			listTickets.add(ticket);
		});
		return listTickets;

	}

	
	@RequestMapping(path="delV",method = RequestMethod.DELETE)
	public void deleteVille(@RequestBody Ville ville)
	{
		villeRepository.delete(ville);;
	}

	@Data
	static class TicketForm {
		private String nomClient;
		private List<Long> tickets = new ArrayList<>();
	}
	
}
