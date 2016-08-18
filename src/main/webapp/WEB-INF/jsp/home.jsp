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
<!-- <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"> -->
<title>Memory</title>
</head>
<body  >

<div class="w3-container w3-center w3-animate-opacity" id="h1Home">
<p id="timeHome"></p>
  <h1>Memory</h1>
  <p><spring:message code="slogan"/> </p>
</div>

<ul class="w3-navbar w3-light-grey w3-border w3-large">
  <li><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
   
  
  <li><a href="#help" onClick="helpFunction()"><span class="glyphicon glyphicon-bullhorn"></span> <spring:message code="help"/> </a></li>
  
  <li class="w3-dropdown-hover w3-hover-orange">
    <a class="w3-hover-orange" href="#"><span class="glyphicon glyphicon-plus-sign"></span> <spring:message code="more"/> <i class="fa fa-caret-down"></i></a>
    <div class="w3-dropdown-content w3-white w3-card-4">
      <a href="https://www.facebook.com/profile.php?id=100009227932912">Facebook/AndersonFerreiras</a>
      <a href="https://www.instagram.com/elmatru/">Instagram/AndersonFerreiras</a>
    </div>
  </li>
  
  
  <li class="w3-dropdown-hover w3-hover-orange">
    <a class="w3-hover-orange"  href="#"><span class="glyphicon glyphicon-globe"></span><i class="fa fa-caret-down"></i></a>
    <div class="w3-dropdown-content w3-white w3-card-4">
      <a href="?language=en"><spring:message code="english"/> </a>
      <a href="?language=es"><spring:message code="spanish"/> </a>
    </div>
 
  </li>
  
  
  <li class="w3-right">
  <div class="w3-dropdown-hover">
  <button class="w3-btn w3-orange" id="p"><span class="glyphicon glyphicon-user"></span> <spring:message code="profile"/> </button>
  <div class="w3-dropdown-content w3-border">
  <sec:authorize access="isAuthenticated()"> 
 			<a href="userView.html"><spring:message code="userProfile"/> </a> 
 		</sec:authorize> 
    <a href="signIn.html"><spring:message code="signin"/> </a> 
 <a href="login.html"><spring:message code="login"/> </a>
     <sec:authorize access="isAuthenticated()"> 
 			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-off"></span> <spring:message code="logout"/> </a> 
 		</sec:authorize> 
 		  </div>
</div>  
  </li>
</ul>

<section id="sectionHome">
<div id="matruimg">
  <img src="img/matru.jpg" alt="car" class="w3-circle" style="width:90%;max-width:320px">
</div>
<p><spring:message code="info"/> </p>
</section>

<div id="helpHome" >
<a name="help"></a>
<h2 id="h2tHome"  ></h2>
<p id="helpTextHome"></p>
<br/>
</div>

</body>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery-1.8.3.js"></script>
<script type="text/javascript">
	window.onload = document.getElementById("timeHome").innerHTML = Date().substring(0, 24);
	
	function helpFunction(){
		var helpText ='<spring:message code="helpTextHome"/>';
		
		var h2t = '<spring:message code="h2tHome"/>';
		document.getElementById("h2tHome").innerHTML = h2t;
		document.getElementById("helpTextHome").innerHTML = helpText;
	}

	
</script>
</html>
