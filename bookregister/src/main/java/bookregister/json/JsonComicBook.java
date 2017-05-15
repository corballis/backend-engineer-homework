package bookregister.json;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

public class JsonComicBook {
	
	private int id;
	@NotBlank(message = "Name is required!")
	private String name;
	private String genre;
	@NotBlank(message = "Publication date is required!")
	private String publicationDate;
	private String coverImage;
	@Range(min = 1, message = "Writer is required!")
	private int writer;
	@Range(min = 1, message = "Publisher is required!")
	private int publisher;

	public JsonComicBook() {}
	
	public JsonComicBook(int id, String name, String publicationDate, String coverImage, int writer, int publisher) {	
		this.id = id;
		this.name = name;
		this.publicationDate = publicationDate;
		this.coverImage = coverImage;
		this.writer = writer;
		this.publisher = publisher;
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
	
	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getPublicationDate() {
		return publicationDate;
	}
	
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}	
	
	public String getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}

	public int getWriter() {
		return writer;
	}
	
	public void setWriter(int writer) {
		this.writer = writer;
	}
	
	public int getPublisher() {
		return publisher;
	}
	
	public void setPublisher(int publisher) {
		this.publisher = publisher;
	}
	
}
