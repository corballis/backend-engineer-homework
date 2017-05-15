<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
<title>Home</title>
</head>
<body>
<div>
	<nav class="navbar navbar-default">
  <div class="container-fluid">    
    <ul class="nav navbar-nav">      
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Comic book
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="comicbook" >New</a></li>
          <li><a href="/">All</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>
</div>
	<script src="static/js/jquery-3.2.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	 
	<table id="comicBooksTable" class="table table-responsive table-bordered table-striped table-hover table-heading table-datatable" >
        <thead>
            <th>Name</th>
            <th>Publication date</th>
            <th>Cover image</th>
            <th>Genre</th>
            <th>Publisher</th>
            <th></th>
        </thead>
     </table>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript">

      $(document).ready(function() {
			loadDatas();
      });
      function comicbook() {
      		$('#comicBooksTable').remove();
      }
      function remove(id) {
      		$.ajax({
            type : "DELETE",
            url : "/"+id,
            contentType: 'application/json',
            success: function(result){
                if(result != null){            
                  	window.location = "/";
                    console.log("Success: ", result);
                }else{                    
                    console.log("Fail: ", result);
                }
            },
            error : function(e) {             
                console.log("ERROR: ", e);
            }
            });
      }
      
      function loadDatas() {
      			var url = window.location;
            $.ajax({
            type : "GET",
            url : url + "/comicBooks",
            contentType: 'application/json',
            success: function(result){
                if(result != null){            
                    $.each(result, function(i, book){
                        
                        $('#comicBooksTable').append('<tr><td>'+book.name+'</td><td>'+book.publicationDate+'</td><td>'+'<a href="' +book.coverImage+'">image</a></td><td>'+book.genre +'</td><td>'+book.publisher.name+ '</td><td><a onclick=remove('+ book.id + ') class="btn btn-danger btn-xs" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></a></td></tr>');
                    });
                    console.log("Success: ", result);
                }else{
                    
                    console.log("Fail: ", result);
                }
            },
            error : function(e) {
                $("#getResultDiv").html("<strong>Error</strong>");
                console.log("ERROR: ", e);
            }
             });
      }
    </script>
</body>
</html>
