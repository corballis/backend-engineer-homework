package bookregister.serializer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import bookregister.model.ComicBook;

public class SimpleComicBookSerializer extends JsonSerializer<Collection<ComicBook>> {

	@Override
	public void serialize(Collection<ComicBook> comicBooks, JsonGenerator generator, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		final List<SimpleComicBook> simpleComicBooks = new ArrayList<>();
        for (final ComicBook comicBook : comicBooks) {
            simpleComicBooks.add(new SimpleComicBook(comicBook.getId(), comicBook.getName()));                
        }
        generator.writeObject(simpleComicBooks);		
	}
	
	static class SimpleComicBook {
		private int id;
		private String name;
		
		public SimpleComicBook() {
		}
		
		public SimpleComicBook(int id, String name) {
			this.id = id;
			this.name = name;
		}
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}		
		
	}

}
