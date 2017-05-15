package bookregister.controller;

import java.text.ParseException;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import bookregister.json.JsonComicBook;
import bookregister.model.ComicBook;
import bookregister.service.ComicBookService;

@RestController
public class BookController {

	@Autowired
	ComicBookService comicBookService;

	@RequestMapping("/book")
	public String books() {
		return "Hello!!";
	}

	@RequestMapping(value = "/comicBooks", method = RequestMethod.GET)
	public List<ComicBook> allComicBooks() {
		return comicBookService.findAll();
	}
	
	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public ResponseEntity<?> getPieWithId(@PathVariable int id) {
		comicBookService.delete(id);
        return ResponseEntity.ok("OK");
    }

	@RequestMapping(value = "/comicBook", method = RequestMethod.POST)
	public ResponseEntity<?> postComicBook(@Valid @RequestBody JsonComicBook jsonComicBook, Errors errors) throws ParseException {
		String msg = "";
		if (errors.hasErrors()) {
			msg = errors.getAllErrors().stream().map(x -> x.getDefaultMessage())
					.collect(Collectors.joining("</br>"));			
			return ResponseEntity.badRequest().body(msg);
		}
		try {
			comicBookService.persist(jsonComicBook);
		} catch (ParseException pe) {
			pe.printStackTrace();
			return ResponseEntity.badRequest().body("Publication is not a valid format. Well format is dd.MM.yyyy");
		}		
		return ResponseEntity.ok(msg);
	}
}
