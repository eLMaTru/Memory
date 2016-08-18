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
<body  >


<ul class="w3-navbar w3-blue w3-border w3-large">
  <li><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
  
  <li class="w3-right">
  <div class="w3-dropdown-hover">
  <button class="w3-btn w3-orange" id="p"><span class="glyphicon glyphicon-user"></span> <spring:message code="profile"/> </button>
  <div class="w3-dropdown-content w3-border">
<sec:authorize access="isAuthenticated()"> 
 			<a href="userView.html"><spring:message code="userProfile"/> </a> 
 		</sec:authorize>
 		<a href="adminView.html"><spring:message code="adminProfile"/> </a> 
     <sec:authorize access="isAuthenticated()"> 
 			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-off"></span> <spring:message code="logout"/> </a> 
 		</sec:authorize> 
 		  </div>
</div>  
  </li>
</ul>
<br>
	
	<div>
	   <mc:form modelAttribute="user"  method="post" enctype="multipart/form-data">
	          <table>
	            <tr>
	                 <td><label><spring:message code="img"/> </label><mc:input path="img" type="file"/><br/>
	                 </td>
	              <tr>
	                 <td><label><spring:message code="username"/> </label> <mc:input path="userName"/>
	                  <mc:errors path="userName"/>
	                 </td>
	              </tr>
	              <tr>
	                 <td><label><spring:message code="email"/> </label> <mc:input path="email" type="email"/>
	                  <mc:errors path="email"/>
	                 </td>
	              </tr>
	              <tr>
	                 <td><label><spring:message code="password"/> </label> <mc:input path="password" type="password"/>
	                  <mc:errors path="password"/>
	                 </td>
	              </tr>
	              <tr>
	                 <td><a href="userUpdate.html?id=${id}"><button type="submit" class="btn btn-primary"><spring:message code="update"/> </button></a>
	                 </td>
	              </tr>
	          </table>
	   </mc:form>
	</div>

</body>
  <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> 
    <script type="text/javascript">

	$(document).on('ready', function() {
	
	
	
	}); //cierre del document on ready

	
	</script>
</html>