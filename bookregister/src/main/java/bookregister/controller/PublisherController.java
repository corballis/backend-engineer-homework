package bookregister.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import bookregister.model.Publisher;
import bookregister.service.PublisherService;

@RestController
public class PublisherController {
	
	@Autowired
	PublisherService publisherService;
	
	@RequestMapping(value="/publishers", method=RequestMethod.GET)
	public List<Publisher> publishers() {
		return publisherService.findAll();
	}
	
}
