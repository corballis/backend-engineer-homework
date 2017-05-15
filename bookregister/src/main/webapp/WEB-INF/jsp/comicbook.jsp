<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
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
	 <div class="panel-body">
	  <div id="feedback"></div>
		 <div class="row">
			<div class="form-group col-sm-4">
	    	<form id="comicBookForm">
	    
	            <label>Name</label>
	            <input type="text" id="name" class="form-control input-sm"/>
	            <label>Publication date</label>
	            <input type="text" id="publicationdate" class="form-control input-sm"/>
	             <label>Cover image url</label>
	            <input type="text" id="coverImage" class="form-control input-sm"/>
	            <label>Genre</label>
	            <input type="text" id="genre" class="form-control input-sm"/>
	            <label>Publisher</label> <select class="form-control"
								id="publisherSelect">
								<option value="0">-- Please select --</option>
							</select>
				   <label>Writer</label> <select class="form-control"
								id="writerSelect">
								<option value="0">-- Please select --</option>
							</select>
				   <button type="submit" id="postBtn" class="btn btn-primary btn-sm">Submit</button>
	        </form>
	       
	    </div>
    </div>
    
    </div>
    <script type="text/javascript">

      $(document).ready(function() {
			
            $.ajax({
            type : "GET",
            url : "/publishers",
            contentType: 'application/json',
            success: function(result){
                if(result != null){               
                    $.each(result, function(i, publisher){                        
                        $('#publisherSelect').append('<option value="'+ publisher.id+ '">' + publisher.name + '</option>');
                    });
                    console.log("Success: ", result);
                }else{                    
                    console.log("Fail: ", result);
                }
            },
            error : function(e) {                
                console.log("ERROR: ", e);
            }
             });
             
                $.ajax({
            type : "GET",
            url : "/writers",
            contentType: 'application/json',
            success: function(result){
                if(result != null){               
                    $.each(result, function(i, writer){                        
                        $('#writerSelect').append('<option value="'+ writer.id+ '">' + writer.name + '</option>');
                    });
                    console.log("Success: ", result);
                }else{                    
                    console.log("Fail: ", result);
                }
            },
            error : function(e) {                
                console.log("ERROR: ", e);
            }
             });
             
      });
       // SUBMIT FORM
    $("#comicBookForm").submit(function(event) {
        // Prevent the form from submitting via the browser.
        event.preventDefault();
        ajaxPost();
    });
     
     
    function ajaxPost(){        
     
        var formData = {
            name : $("#name").val(),
            publicationDate :  $("#publicationdate").val(),
            coverImage : $("#coverImage").val(),
            genre : $("#genre").val(),
            publisher : $("#publisherSelect").val(),
            writer : $("#writerSelect").val()        
        }         
    
        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : "/comicBook",
            data : JSON.stringify(formData),
            dataType : 'json',
            cache: false,
        	timeout: 600000,
            success : function(result) {              
                 window.location = "/";             
            },
            error : function(e) {
                		var msg = '<div class="alert alert-danger" role="alert" id="errorMessages" style="margin-top: 10px">' +
									'<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>'
									+ e.responseText +'</div>';
           				 $('#feedback').html(msg);
           			 		console.log("ERROR : ",e);
           			 	if (e.responseText.length == 0)
           			 	 	window.location = "/";
            }
        }); 
    } 
    </script>
    </body>
</html>