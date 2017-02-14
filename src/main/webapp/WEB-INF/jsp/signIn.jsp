<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="mc" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html >
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="img/disket.png" rel="icon">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<script type="text/javascript" src="js/general.js"></script>
<title>Memory</title>
</head>
<body  >



<div id="header">
<nav class="navbar navbar-inverse" id="nav">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Memory</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
         <li class=""><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
   <!--     <li class="active"><a data-toggle="modal" data-target="#loginModal"  href="#"><button id="aSubmit" hidden="true"></button><span class="glyphicon glyphicon-log-in"></span> <spring:message code="login"/></a>
    </li> -->
     </ul>
    </div>
  </div>
</nav>
    </div>  



		<mc:form class="w3-container formS"  method="post" modelAttribute="user" enctype="multipart/form-data">
			
			<div class="w3-panel gradblue w3-card-8" style="border-radius:5px;">
			<h3 class="">
				<spring:message code="signin.form" />
			</h3>
</div>
                 <label>	<spring:message code="signin.fullName" /></label>
					<mc:input path="fullName" type="text" class="w3-input w3-hover-blue int-color" placeholder="" />
					<mc:errors class="error w3-text-red" path="fullName"></mc:errors><br/>
                                       		    
				<label>	<spring:message code="signin.username" /></label>
					<mc:input path="userName" type="text" class="w3-input w3-hover-blue int-color" placeholder="" />
					<mc:errors class="error w3-text-red" path="userName"></mc:errors><i class="w3-text-red" id="username"></i><br/>
				
				<label>	<spring:message code="signin.email" /></label>
					 <mc:input path="email" type="email" class="w3-input w3-hover-blue int-color" placeholder=""/>
					<mc:errors class="error w3-text-red" path="email"></mc:errors><i class="w3-text-red" id="emaill"></i><br/>
			
			<label>					<spring:message code="signin.password" /></label>
					 <mc:input path="password" type="password" class="w3-input w3-hover-blue int-color" placeholder=""/>
					<mc:errors class="error w3-text-red" path="password"></mc:errors>
			<br />

			<button type="reset" class="btn w3-ligth-gray"><spring:message code="cancel"/></button>
	        <input class="btn mc-blue" type="submit"
				value="<spring:message code="signin.button.submit"/>"  />
		</mc:form>





   

</body>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery-1.8.3.js"></script>
<script type="text/javascript">
var res = ${res};
window.onload = function(){
	if(res == 1){
		document.getElementById("username").innerHTML = "<spring:message code='signin.m1'/>";
	}else if(res == 2){
		document.getElementById("emaill").innerHTML = "<spring:message code='signin.m2'/>";
	}else if(res == 3){
		document.getElementById("username").innerHTML = "<spring:message code='signin.m1'/>";
		document.getElementById("emaill").innerHTML = "<spring:message code='signin.m2'/>";
	}
	
	
}




</script>
</html>