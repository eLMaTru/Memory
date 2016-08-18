<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- libreria para mensajes en los jsp con spring -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- librerias para los formularios en los jsp con spring -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
  <li><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/></a></li>
   <li class="w3-dropdown-hover w3-hover-orange">
    <a class="w3-hover-orange" href="#"><span class="glyphicon glyphicon-floppy-disk"></span> <spring:message code="people"/> <i class="fa fa-caret-down"></i></a>
    <div class="w3-dropdown-content w3-white w3-card-4">
      <a href="savedPeople.html"><spring:message code="savedPeople"/></a>
    </div>
  </li>

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

<div id="formAddPeople">
	<form:form role="form" modelAttribute="people" enctype="multipart/form-data">
    <div  >
      <label ><spring:message code="img"/> </label>
      <form:input type="file"   path="img" />
    </div>
    <div class="form-group" id="inpAddPeople">
      <label ><spring:message code="name"/> </label>
      <form:input type="text" class="form-control"  placeholder="name" path="name" />
    <form:errors class="error" path="lastName"></form:errors>
    </div>
    <div class="form-group" id="inpAddPeople">
      <label for="pwd"><spring:message code="lastName"/> </label>
      <form:input type="text" class="form-control"  placeholder="Last Name" path="lastName" />
      <form:errors class="error" path="lastName"></form:errors>
    </div>
     <div class="form-group" id="inpAddPeople">
      <label for="pwd"><spring:message code="age"/> </label>
      <form:input type="number" class="form-control"  placeholder="Last Name" path="age" />
      <form:errors class="error" path="age"></form:errors>
    </div>
 
 <div id="form2">
	<form:form role="form" modelAttribute="phone" method="post">
    <div class="form-group" id="inpAddPeople">
      <label ><spring:message code="phoneNumber"/> </label>
      <form:input type="number" class="form-control"  placeholder="number" path="number" />
    <form:errors class="error" path="number"></form:errors>
    </div>
    <div class="form-group" id="inpAddPeople">
      <form:select id="category" path="category">
               <form:option value="HOME"><spring:message code="HOME"/> </form:option>
               <form:option value="WORK"><spring:message code="WORK"/> </form:option>
               <form:option value="OTHER"><spring:message code="OTHER"/> </form:option>
					</form:select>
    </div>
    <div id="formPhone">
    
    </div>
   <button type="button" onClick="phoneFunction()">+</button><br/><br/>

<div id="form3">
<label> <spring:message code="address"/> </label>
	<form:form role="form" modelAttribute="address" method="post">
    <div class="form-group" id="inpAddPeople">
      <label for="email"><spring:message code="street"/> </label>
      <form:input type="text" class="form-control"  placeholder="Street" path="street" />
    <form:errors class="error" path="street"></form:errors>
    </div>
    <div class="form-group" id="inpAddPeople">
      <label for="email"><spring:message code="city"/> </label>
      <form:input type="text" class="form-control"  placeholder="City" path="city" />
    <form:errors class="error" path="city"></form:errors>
    </div>
    <div class="form-group" id="inpAddPeople">
      <label for="email"><spring:message code="state"/> </label>
      <form:input type="text" class="form-control"  placeholder="State" path="state" />
    <form:errors class="error" path="state"></form:errors>
    </div>
    <div class="form-group" id="inpAddPeople">
      <form:select id="category" path="category">
		   <form:option value="HOME"><spring:message code="HOME"/> </form:option>
		   <form:option value="WORK"><spring:message code="WORK"/> </form:option>
		   <form:option value="OTHER"><spring:message code="OTHER"/> </form:option>   
					</form:select>
    </div>
    <div id="formAddress">
    </div>
 <button type="button" onClick="addressFunction()">+</button><br/><br/>

<div id="form4">
	<form:form role="form" modelAttribute="mail" method="post">
	<label><spring:message code="mail"/> </label>
    <div class="form-group" id="inpAddPeople">
      <label for="email"><spring:message code="email"/> </label>
      <form:input type="email" class="form-control"  placeholder="Email" path="email" />
    </div>
    <div class="form-group" id="inpAddPeople">
      <form:select id="category" path="category">
            <form:option value="HOME"><spring:message code="HOME"/> </form:option>
             <form:option value="WORK"><spring:message code="WORK"/> </form:option>
              <form:option value="OTHER"><spring:message code="OTHER"/> </form:option>
					</form:select>
    </div>
    <div id="emailForm"></div>
     <button type="button" onClick="emailFunction()">+</button><br/><br/>
   
    <button type="submit" class="btn btn-primary"><spring:message code="save"/></button>
  </form:form>
  </div>
  </form:form>
  </div>
  </form:form>
 </div>
  </form:form>
</div>
	
	
	


</body>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery-1.8.3.js"></script>
<script type="text/javascript">

function phoneFunction(){
	var x = "";
	x = '<div><form:form role="form" modelAttribute="phone" method="post">'+
	   ' <div class="form-group" id="inpAddPeople">'+
    '<form:input type="number" class="form-control"  placeholder="number" path="number" /> '+
  '<form:errors class="error" path="number"></form:errors> '+
 ' </div>'+
  '<div class="form-group" id="inpAddPeople">'+
   ' <form:select id="category" path="category"> '+
             '<form:option value="HOME"><spring:message code="HOME"/></form:option>'+
             '<form:option value="WORK"><spring:message code="WORK"/></form:option>'+
             '<form:option value="OTHER"><spring:message code="OTHER"/></form:option>'+
					'</form:select></form:form></div>';
	document.getElementById("formPhone").innerHTML += x;
}

function addressFunction(){
	var x ='<div ><form:form role="form" modelAttribute="address" method="post">'+
    '<div class="form-group" id="inpAddPeople">'+
     ' <label for="email"><spring:message code="street"/></label>'+
      '<form:input type="text" class="form-control"  placeholder="Street" path="street" />'+
   ' <form:errors class="error" path="street"></form:errors>'+
    '</div>'+
    '<div class="form-group" id="inpAddPeople">'+
     ' <label for="email"><spring:message code="city"/></label>'+
      '<form:input type="text" class="form-control"  placeholder="City" path="city" />'+
    '<form:errors class="error" path="city"></form:errors>'+
    '</div>'+
  '  <div class="form-group" id="inpAddPeople">'+
      '<label for="email"><spring:message code="state"/></label>'+
      '<form:input type="text" class="form-control"  placeholder="State" path="state" />'+
    '<form:errors class="error" path="state"></form:errors>'+
    '</div>'+
    '<div class="form-group" id="inpAddPeople">'+
      '<form:select id="category" path="category">'+
		   '<form:option value="HOME"><spring:message code="HOME"/></form:option>'+
		   '<form:option value="WORK"><spring:message code="WORK"/></form:option>'+
		   '<form:option value="OTHER"><spring:message code="OTHER"/></form:option>'+   
					'</form:select> </form:form> </div>';
	
	document.getElementById("formAddress").innerHTML += x;
}

function emailFunction(){
	var x = '<div >'+
	'<form:form role="form" modelAttribute="mail" method="post">'+
    '<div class="form-group" id="inpAddPeople">'+
     ' <form:input type="email" class="form-control"  placeholder="Email" path="email" />'+
    '</div>'+
    '<div class="form-group" id="inpAddPeople">'+
      '<form:select id="category" path="category">'+
            '<form:option value="HOME"><spring:message code="HOME"/></form:option>'+
             '<form:option value="WORK"><spring:message code="WORK"/></form:option>'+
             ' <form:option value="OTHER"><spring:message code="OTHER"/></form:option>'+
				'	</form:select></form:form></div>';
					
					document.getElementById("emailForm").innerHTML += x;
}


</script>
</html>