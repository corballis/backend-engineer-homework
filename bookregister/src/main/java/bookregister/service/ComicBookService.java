package bookregister.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookregister.dao.ComicBookRepository;
import bookregister.json.JsonComicBook;
import bookregister.model.ComicBook;
@Service
@Transactional
public class ComicBookService {
	
	private final ComicBookRepository comicBookRepository;
	@Autowired
	private PublisherService publisherService;
	@Autowired
	private WriterService writerService;
	
	private static final SimpleDateFormat simpleDateFormatter = new SimpleDateFormat("dd.MM.yyyy");

	public ComicBookService(ComicBookRepository comicBookRepository) {
		this.comicBookRepository = comicBookRepository;
	}
	
	public List<ComicBook> findAll() {
		List<ComicBook> comicBooks = new ArrayList<>();
		for (ComicBook comicBook : comicBookRepository.findAll()) {
			if (!comicBook.getDeleted().equals("deleted")) {
				comicBooks.add(comicBook);
			}
		}
		return comicBooks;
	}
	
	public void persist(JsonComicBook jsonComicBook) throws ParseException {
		ComicBook comicBook = new ComicBook();
		
		comicBook.setName(jsonComicBook.getName());
		comicBook.setPublisher(publisherService.find(jsonComicBook.getPublisher()));
		if (comicBook.getWriterCollection() == null) {
			comicBook.setWriterCollection(new ArrayList<>());
		}
		comicBook.getWriterCollection().add(writerService.find(jsonComicBook.getWriter()));
		comicBook.setGenre(jsonComicBook.getGenre());
		comicBook.setCoverImage(jsonComicBook.getCoverImage());
		comicBook.setPublicationDate(simpleDateFormatter.parse(jsonComicBook.getPublicationDate()));
		comicBook.setDeleted("");
		comicBookRepository.save(comicBook);
	}
	
	public void delete(int id) {
		ComicBook comicBook = comicBookRepository.findOne(id);
		comicBook.setDeleted("deleted");
		comicBookRepository.save(comicBook);
	}
	
}
