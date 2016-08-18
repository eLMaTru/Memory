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
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="img/disket.png" rel="icon">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<title>Memory</title>
</head>
<body  >

<ul class="w3-navbar w3-blue w3-border w3-large">
  <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
  
  <li class="w3-right">
  <div class="w3-dropdown-hover">
  <button class="w3-btn w3-orange" id="p"><span class="glyphicon glyphicon-user"></span> <spring:message code="profile"/> </button>
  <div class="w3-dropdown-content w3-border">
 <a href="login.html"><spring:message code="login"/> </a>
     <sec:authorize access="isAuthenticated()"> 
 			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-off"></span> <spring:message code="logout"/> </a> 
 		</sec:authorize> 
 		  </div>
</div>  
  </li>
</ul>
<br>


	<div id="formSignin">
		<mc:form method="post" modelAttribute="user" enctype="multipart/form-data">
			<h3>
				<spring:message code="signin.form" />
			</h3>
			<label><spring:message code="img"/> </label>
			    <mc:input path="img" type="file"  /><br/>
			    
				<label>	<spring:message code="signin.username" /></label>
					<mc:input path="userName" type="text"  />
					<mc:errors class="error" path="userName"></mc:errors><br/>
				
				<label>	<spring:message code="signin.email" /></label>
					 <mc:input path="email" type="email" />
					<mc:errors class="error" path="email"></mc:errors><br/>
				
			
			<label>					<spring:message code="signin.password" /></label>
					 <mc:input path="password" type="password" />
					<mc:errors class="error" path="password"></mc:errors>
			<br /><br/>

			<input class="btn btn-primary" type="submit"
				value="<spring:message code="signin.button.submit"/>"  />
			<input class="btn btn-primary" type="reset"
				value="<spring:message code="signin.button.reset"/>" />
		</mc:form>
	</div>



</body>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery-1.8.3.js"></script>
<script type="text/javascript">


</script>
</html>