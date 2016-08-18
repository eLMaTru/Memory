<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- libreria para mensajes en los jsp con spring -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- librerias para los formularios en los jsp con spring -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- security tags -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="img/disket.png" rel="icon">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">



<title>Memory</title>

<style type="text/css">

</style>
</head>
<body  >


<ul class="w3-navbar w3-blue w3-border w3-large">
  <li><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
  
  
  <li class="w3-right">
  <div class="w3-dropdown-hover">
  <button class="w3-btn w3-orange" id="p"><span class="glyphicon glyphicon-user"></span> <spring:message code="profile"/> </button>
  <div class="w3-dropdown-content w3-border">
  <sec:authorize access="isAuthenticated()"> 
 			<a href="userView.html"> <spring:message code="userProfile"/> </a> 
 		</sec:authorize>
     <sec:authorize access="isAuthenticated()"> 
 			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-off"></span> <spring:message code="logout"/> </a> 
 		</sec:authorize> 
 		  </div>
</div>  
  </li>
</ul>	
<br>
	
	<form:form modelAttribute="people" enctype="multipart/form-data">
	 <div  >
      <label for="email"><spring:message code="img"/> </label>
      <form:input type="file"   path="img" />
    </div>
    <div class="form-group" id="inpPeopleUpdate">
      <label for="email"><spring:message code="name"/> </label>
      <form:input type="text" class="form-control"  placeholder="name" path="name" />
    <form:errors class="error" path="lastName"></form:errors> 
    </div>
    <div class="form-group" id="inpPeopleUpdate">
      <label for="pwd"><spring:message code="lastName"/> </label>
      <form:input type="text" class="form-control"  placeholder="Last Name" path="lastName" />
       <form:errors class="error" path="lastName"></form:errors> 
    </div>
     <div class="form-group" id="inpPeopleUpdate">
      <label for="pwd"><spring:message code="age"/> </label>
      <form:input type="number" class="form-control"  placeholder="Last Name" path="age" />
       <form:errors class="error" path="age"></form:errors> 
    </div>
<%--   <a href="peopleUpdate.html?id=${id}"><button type="submit" class="btn btn-primary">Update</button></a>   --%>
 <button class="btn btn-primary"><spring:message code="update"/> </button> 
	</form:form>

</body>
 <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> 
    <script type="text/javascript">

	$(document).on('ready', function() {
	
	
	
	}); //cierre del document on ready

	
	</script>


</html>