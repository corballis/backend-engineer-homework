package bookregister.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import bookregister.service.ComicBookService;

@Controller
public class MainController {
	
	@Autowired
	ComicBookService comicBookService;
	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	
	@GetMapping("/comicbook")
	public String comicBook() {
		return "comicbook";
	}
}
