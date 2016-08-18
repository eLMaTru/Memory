<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- libreria para mensajes en los jsp con spring -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- librerias para los formularios en los jsp con spring -->
<%@ taglib prefix="mc" uri="http://www.springframework.org/tags/form"%>
<!-- security tags -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="img/disket.png" rel="icon">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<title>Memory</title>
</head>
<body >

<div class="w3-container w3-center w3-animate-opacity" id="h1UserView" >
  <h1>Memory</h1>
  <p><spring:message code="slogan"/> </p>
</div>

<ul class="w3-navbar w3-light-grey w3-border w3-large">
  <li><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
   <li class="w3-dropdown-hover w3-hover-orange">
    <a class="w3-hover-orange" href="#"><span class="glyphicon glyphicon-floppy-disk"></span> <spring:message code="people"/> <i class="fa fa-caret-down"></i></a>
    <div class="w3-dropdown-content w3-white w3-card-4">
      <a href="savedPeople.html"><spring:message code="savedPeople"/> </a>
      <a href="addPeople.html"><spring:message code="addPeople"/> </a>
    </div>
  </li>
  
<sec:authorize ifAnyGranted="ROLE_ADMIN">
  <li>
  <a href="adminView.html"><span class="glyphicon glyphicon-user"></span> <spring:message code="admin"/> </a>
  </li>
  </sec:authorize>
  
  <li class="w3-right">
  <div class="w3-dropdown-hover">
  <button class="w3-btn w3-orange" id="p"><span class="glyphicon glyphicon-user"></span> <spring:message code="profile"/> </button>
  <div class="w3-dropdown-content w3-border">
     <sec:authorize access="isAuthenticated()"> 
 			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-off"></span> <spring:message code="logout"/> </a> 
 		</sec:authorize> 
 		  </div>
</div>  
  </li>
</ul>

<pre><spring:message code="welcome"/> <sec:authentication property="name"/>  </pre>
<br>


</body>
</html>