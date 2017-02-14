<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="mc" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html >
<html>
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
<title>Memory</title>
<style type="text/css">
.trr{
border: solid 1px 1px 1px 10px black;
}
</style>
</head>
<body >

<div id="header">
<nav class="navbar navbar-inverse" id="nav">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand " href="#">Memory</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class=""><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
       <li class=""><a href="addPeople.html"><span class="glyphicon glyphicon-floppy-disk"></span> <spring:message code="addnew"/> </a></li>
 
      </ul>
      <ul class="nav navbar-nav navbar-right">
     	  <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> <spring:message code="user"/> <span class="caret"></span></a>
          <ul class="dropdown-menu">
           <sec:authorize ifAnyGranted="ROLE_ADMIN" >
  <li> <a href="adminView.html"><span class="glyphicon glyphicon-user"></span> <spring:message code="admin"/> </a></li>
  </sec:authorize>
  <li><a href="useredit.html"><span class="fa fa-gear fa-spin" style="font-size:16px"></span> <spring:message code="editprofile"/></a></li>
<li>  			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="logout"/> </a> 
 		 </li>
           </ul>
           </li> 		
      </ul>
    </div>
  </div>
</nav>
    </div>  
    
<div>
<div class="w3-container w3-section  w3-padding-0">
<div  class="w3-left w3-light-grey w3-padding w3-card-4" id="welcome"><spring:message code="welcome"/> ${name}</div>
<div class="w3-right mc-blue w3-padding w3-card-4" id="time" ></div>
</div>
</div>

<div >
<div class="table-responsive">         
			<table border="" id="customersSavedPeople" class="w3-table w3-border w3-striped w3-bordered" >
		
				<tr class="mc-blue " >
				<th><spring:message code="img"/> </th>   
					<th class="w3-center"><spring:message code="name"/> </th>   
					<th class="th w3-center"><spring:message code="lastName"/> </th>
					<th class="th w3-center"><spring:message code="phoneNumber"/> </th>
					
				<th class="th  w3-center"><spring:message code="address"/> <br/>
				</th> 
					<th class="th  w3-center"><spring:message code="email"/> </th>
					<th class="th  w3-center"><spring:message code="update"/> </th>
					<th class="th  w3-center"><spring:message code="delete"/> </th>
				</tr>
<c:forEach var="people" items="${people}">

				<tr >
				    <td ><img width="75px" class="w3-circle" height="75px" src="/Memory/${people.rutaImg }"></td>
					<td class="w3-center">${people.name}</td>
					<td>${people.lastName}</td>

					<td>
						<table border="1">  
	 						<c:forEach var="phone" items="${people.phoneNumbers}">


								<tr>
									<td>${phone.categoryPh}</td>
									<td>${phone.number}</td>
								</tr>
							</c:forEach>
		 				</table>  
					</td>
					<td>
						<table border="1">
							<c:forEach var="address" items="${people.addresses}">


								<tr>
									<td>${address.categoryA}</td>
									<td>${address.street}</td>
									<td>${address.city}</td>
									<td>${address.state}</td>
								</tr>
							</c:forEach>
						</table>

					</td>

					<td>
						<table border="1">
							<c:forEach var="email" items="${people.mails}">



								<tr>
									<td>${email.categoryM}</td>
									<td>${email.email}</td>
			</tr>
							</c:forEach>
						</table>
					</td>
					   <td><a href="peopleUpdate.html?id=${people.getIdPeople()}"><span  id="removeupSavedPeople" class="fa fa-gear" style="font-size:45px;"></span></a></td>
 <td>
     <a href="#" onClick="dPeople(${people.getIdPeople()})"><span id="removeupSavedPeople" class="glyphicon glyphicon-floppy-remove"></span></a>  </td>
				</tr>
		</c:forEach>
			</table>
								
			
		
	</div></div>


<div id="paginerdiv">
<div class="w3-container w3-section  w3-padding-0">
<div  class="w3-left w3-light-grey w3-padding w3-card-4 backpeople" ><div class=""><a id="backlink" href="pagination.html?paginer=back">&#10094; <spring:message code="back"/></a></div></div>
<div class="w3-right mc-blue w3-padding w3-card-4 nextpeople"  ><div class=""><a id="nextlink" href="pagination.html?paginer=next"><spring:message code="next"/> &#10095;</a></div></div>
</div>
</div>
</body>
<script type="text/javascript" src="jquery-1.8.3.js"></script>
<script type="text/javascript">
function dPeople(id){
	$.post("peopleDelete.html",{id:id},
			function(data,status){location.reload();});
}

	
window.onload = function(){
	document.getElementById("time").innerHTML = Date().substring(0, 24);
}



</script>
</html>
