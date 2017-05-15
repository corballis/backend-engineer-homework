package bookregister.dao;

import org.springframework.data.repository.CrudRepository;

import bookregister.model.Publisher;

public interface PublisherRepository extends CrudRepository<Publisher, Integer> {

}
