<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="mc" uri="http://www.springframework.org/tags/form"%>
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
<script type="text/javascript" src="js/general.js"></script>
<title>Memory</title>
<script type="text/javascript">


</script>
</head>
<body>

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
        <li class="active" id="licv">
        <a onclick="editpassword()" href="#"><spring:message code="editpassword"/></a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <li class="dropdown ">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> <spring:message code="user"/> <span class="caret"></span></a>
          <ul class="dropdown-menu">
          <sec:authorize access="isAuthenticated()"> 
 	<li>		<a href="userView.html"><span class="glyphicon glyphicon-user"></span> <spring:message code="userProfile"/> </a> </li>
<li>  			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="logout"/> </a> 
 		 </li>
 		</sec:authorize> 
 		
          </ul>
        </li>
      </ul>

    </div>
  </div>


</nav>

    </div>  


		<mc:form modelAttribute="user" method="post" enctype="multipart/form-data" class="w3-container formUp">
			
			
			<div class="w3-panel gradblue w3-card-8" style="border-radius:5px;">
			<h3 class="">
				<spring:message code="signin.form" />
			</h3>
			</div>
			
			<label>	<spring:message code="signin.fullName" /></label>
					<mc:input path="fullName" type="text" class="w3-input w3-hover-blue int-color" placeholder="" />
					<mc:errors class="error" path="fullName"></mc:errors><br/>
			<div id="nick">
			<label><spring:message code="username" /> </label>
			<mc:input path="userName" class="w3-input int-color w3-hover-blue" />
			<mc:errors path="userName" /><br/>
			</div>
			<label><spring:message code="email" /> </label>
			<mc:input path="email" type="email" class="w3-input int-color w3-hover-blue" />
			<mc:errors path="email" /><br/>
			<div id="divpassword">
			<label><spring:message code="password" /> </label>
			<mc:input path="password" type="password" class="w3-input int-color w3-hover-blue" id="password" value="~0~" />
 			<mc:errors path="password" /><br/> 

</div>

<a href="userView.html"><button type="button" class="btn w3-lightgray" ><spring:message code="back"/></button></a>
					
	    <button type="submit" class="btn mc-blue"><spring:message code="save"/></button>
		
		</mc:form>

</body>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var isNumeric = ${isNumeric} + 1;
var password = ${password} + 1;
	$(document).on('ready', function() {
		if(isNumeric == 2){	
			$("#licv").hide();
			$("#nick").hide();
		}		
		
		if(password == 2){
			 document.getElementById("password").value="";
			 $("#divpassword").show();
		}else{
			 $("#divpassword").hide();
			 document.getElementById("password").value="~0~";
		}		
	}); 
	

	function editpassword(){
        document.getElementById("password").value="";
        $("#divpassword").show(500);
	}
</script>
</html>