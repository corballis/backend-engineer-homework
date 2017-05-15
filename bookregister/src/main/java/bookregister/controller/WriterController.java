package bookregister.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import bookregister.model.Writer;
import bookregister.service.WriterService;

@RestController
public class WriterController {
	
	@Autowired
	WriterService writerService;
	
	@RequestMapping(value="/writers", method=RequestMethod.GET)
	public List<Writer> writers() {
		return writerService.findAll();
	}
}
