package bookregister.dao;

import java.io.Serializable;

import org.springframework.data.repository.CrudRepository;

import bookregister.model.ComicBook;

public interface ComicBookRepository extends CrudRepository<ComicBook, Serializable> {

}
