<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- libreria para mensajes en los jsp con spring -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- librerias para los formularios en los jsp con spring -->
<%@ taglib prefix="mc" uri="http://www.springframework.org/tags/form"%>
<!-- security tags -->
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
</head>
<body  onload='document.f.j_username.focus();'>

<ul class="w3-navbar w3-blue w3-border w3-large">
  <li><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
   
  
  <li class="w3-right">
  <div class="w3-dropdown-hover">
  <button class="w3-btn w3-orange" id="p"><span class="glyphicon glyphicon-user"></span> <spring:message code="profile"/> </button>
  <div class="w3-dropdown-content w3-border">
    <a href="signIn.html"><spring:message code="signin"/> </a> 
     <sec:authorize access="isAuthenticated()"> 
 			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-off"></span> <spring:message code="logout"/> </a> 
 		</sec:authorize> 
 		  </div>
</div>  
  </li>
</ul>
<br>
	
<c:if test="${not empty error }">	
<div class="errorblockLogin">
Your login was unsuccessful. <br/>
Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}

</div>

</c:if>
		${info}

<div id="formLogin">
		<form action="j_spring_security_check" name="f" method="post" role="form">
             <div class="form-group" >
      <label for="email"><spring:message code="username"/> </label>
      <input type="text" class="form-control"  placeholder="username" name="j_username" />
    </div>
      <div class="form-group" >
      <label for="email"><spring:message code="password"/> </label>
      <input type="password" class="form-control"  placeholder="password" name="j_password" />
    </div>
			
			 <button type="submit" class="btn btn-primary" ><spring:message code="login"/> </button>
		</form>
</div>

</body>
</html>