package bookregister.dao;

import org.springframework.data.repository.CrudRepository;

import bookregister.model.Writer;

public interface WriterRepository extends CrudRepository<Writer, Integer> {

}
