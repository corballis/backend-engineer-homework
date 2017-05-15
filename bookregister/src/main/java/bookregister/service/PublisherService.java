package bookregister.service;

import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

import bookregister.dao.PublisherRepository;
import bookregister.model.Publisher;

@Service
@Transactional
public class PublisherService {
	
	private final PublisherRepository publisherRepository;

	public PublisherService(PublisherRepository publisherRepository) {	
		this.publisherRepository = publisherRepository;
	}
	
	public List<Publisher> findAll() {
		List<Publisher> publishers = new ArrayList<>();
		for (Publisher publisher : publisherRepository.findAll()) {
			publishers.add(publisher);
		}
		return publishers;
	}
	
	public Publisher find(int id) {
		return publisherRepository.findOne(id);	
	}

}
