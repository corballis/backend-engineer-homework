This repository contains an intro challange for Java developers who want to join [Corballis Consulting](http://corballis.ie).

### So you want to prove you're worthy to join Corballis? Awesome!

**Here you go:**
* Create a github account if you don't have yet.
* Fork this repository.
* Solve the tasks you can read below.
* Commit and push your work.
* When you think you finished with all the tasks send us a new pull request.

**Tasks:**

Your friend asks you to help him to build a simple web application where he can track his old comic books. You have to allow him to create, update, delete and list comic books in a table (without pagination). The following criteria have to be fulfilled:
* The web application must be implemented with Spring Boot.
* You can use any database you like (preferred any in-memory database eg.: H2).
* Any JPA framework can be used eg.: EclipseLink, Hibernate
* The server has to provide a REST API for the client.
* The client and the server must communicate with JSON objects.
* The server has to reject save and update requests when the required fields are not filled in. (Spring supports JSR-303 validation. You should use @Valid and @NotNull annotations to make it work)
* You can use any javascript framework to call REST api.
* To make it a nice-looking web page you must use Twitter's bootstrap on the frontend.
* The database must be pre-populated with some initial data.

A comic book has the following attributes:
* Id
* Name (required)
* Cover image url
* Publication date (required)
* Genre
* Written by (should be a many-to-many connection to writers table in the database) (required)
* Publisher (should be a one-to-many connection to publishers table in database) (required)

The data table must show all of these properies. In case of the joined entities the name has to be displayed.

A writer has the following attributes:
* Id
* Name

A publisher has the following attributes:
* Id
* Name
