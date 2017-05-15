package bookregister.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bookregister.dao.WriterRepository;
import bookregister.model.Writer;

@Service
@Transactional
public class WriterService {
	
	private final WriterRepository writerRepository;

	public WriterService(WriterRepository writerRepository) {		
		this.writerRepository = writerRepository;
	}
	
	public List<Writer> findAll() {
		return (List<Writer>) writerRepository.findAll();
	}
	
	public Writer find(int id) {
		return writerRepository.findOne(id);
	}
	
}
