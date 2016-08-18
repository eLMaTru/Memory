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

<div class="w3-container w3-center w3-animate-opacity" id="h1AdminView" >
  <h1>Memory</h1>
  <p><spring:message code="slogan"/> </p>
</div>

<ul class="w3-navbar w3-light-grey w3-border w3-large">
  <li><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
   <li class="w3-dropdown-hover w3-hover-orange" >
    <a class="w3-hover-orange" href="#" ><span class="glyphicon glyphicon-floppy-disk" ></span> <spring:message code="errors"/> <i class="fa fa-caret-down"></i></a>
    <div class="w3-dropdown-content w3-white w3-card-4">
     <a href="#"><spring:message code="savedErrors"/> </a> 
      <a href="#"><spring:message code="addError"/> </a>
    </div>
  </li>
<!--   <li class="w3-dropdown-hover w3-hover-orange"> -->
<!--     <a class="w3-hover-orange" href="#"><span class="glyphicon glyphicon-plus-sign"></span> More <i class="fa fa-caret-down"></i></a> -->
<!--     <div class="w3-dropdown-content w3-white w3-card-4"> -->
<!--       <a href="#">Piedra-Paper-Tijera</a> -->
<!--       <a href="#">BlackJack</a> -->
<!--     </div> -->
<!--   </li> -->
  
  <li class="w3-right">
  <div class="w3-dropdown-hover">
  <button class="w3-btn w3-orange" id="p"><span class="glyphicon glyphicon-user"></span> <spring:message code="profile"/> </button>
  <div class="w3-dropdown-content w3-border">
<sec:authorize access="isAuthenticated()"> 
 			<a href="userView.html"><spring:message code="userProfile"/> </a> 
 		</sec:authorize>
     <sec:authorize access="isAuthenticated()"> 
 			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-off"></span> <spring:message code="logout"/> </a> 
 		</sec:authorize> 
 		  </div>
</div>  
  </li>
</ul>
<br>


	
	<div>
	<c:forEach items="${users}" var="user">
	   <table border="1" id="customersAdminView">
	         <tr>
	         <th>ID</th><th><spring:message code="img"/> <th><spring:message code="username"/> </th><th><spring:message code="email"/> </th><th><spring:message code="update"/> </th><th><spring:message code="delete"/> </th>
	         </tr>
	         <tr>
	         
	             <td>${user.id}  </td>
	         <td>
	
	 <img width="75px" height="75px" src="http://localhost:8080/Memory${user.rutaImg }">  
	             
	         
	         </td>
	             <td>${user.userName}   </td>
	             <td>${user.email}  </td>
	             
						   <td><a href="userUpdate.html?id=${user.id}"><span  id="removeupAdminView" class="glyphicon glyphicon-refresh"></span></a></td>
 <td>
     <a href="userDelete.html?id=${user.id}"><span id="removeupAdminView" class="glyphicon glyphicon-floppy-remove"></span></a>
 
  </td>
  
	         </tr>
	     
	     </table>    
	         </c:forEach>
	     
	     
	</div>
	
	

</body>
</html>