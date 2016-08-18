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

<style type="text/css">



</style>
</head>
<body >

<ul class="w3-navbar w3-blue w3-border w3-large">
  <li><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
   <li class="w3-dropdown-hover w3-hover-orange">
    <a class="w3-hover-orange" href="#"><span class="glyphicon glyphicon-floppy-disk"></span> <spring:message code="people"/> <i class="fa fa-caret-down"></i></a>
    <div class="w3-dropdown-content w3-white w3-card-4">
      <a href="addPeople.html"><spring:message code="addPeople"/> </a>
    </div>
  </li>
  
  <li class="w3-right">
  <div class="w3-dropdown-hover">
  <button class="w3-btn w3-orange" id="p"><span class="glyphicon glyphicon-user"></span> <spring:message code="profile"/> </button>
  <div class="w3-dropdown-content w3-border">
  <sec:authorize access="isAuthenticated()"> 
 			<a href="userView.html"> <spring:message code="userProfile"/> </a> 
 		</sec:authorize>
     <sec:authorize access="isAuthenticated()"> 
 			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-off"></span> <spring:message code="logout"/> </a> 
 		</sec:authorize> 
 		  </div>
</div>  
  </li>
</ul>
<br>

	<div id="showPeople">
		<c:forEach var="people" items="${people}">

			<table border="1" id="customersSavedPeople" >
				<tr>
				<th ><spring:message code="img"/> </th>   
					<th ><spring:message code="name"/> </th>   
					<th class="th"><spring:message code="lastName"/> </th>
					<th class="th"><spring:message code="phoneNumber"/> </th>
					
				<th class="th"><spring:message code="address"/> <br/>
			<!-- 	 <p>Category      Street      City    State </p>  -->
				</th> 
					<th class="th"><spring:message code="email"/> </th>
					<th class="th"><spring:message code="update"/> </th>
					<th class="th"><spring:message code="delete"/> </th>
				</tr>


				<tr>
				    <td><img width="75px" height="75px" src="http://localhost:8080/Memory${people.rutaImg }"></td>
					<td>${people.name}</td>
					<td>${people.lastName}</td>

					<td>
						<table border="1">
							<c:forEach var="phone" items="${people.phoneNumbers}">

<!-- 								<tr> -->
<!-- 									<th class="th">Category</th> -->
<!-- 									<th class="th">Number</th> -->
<!-- 								</tr> -->

								<tr>
									<td>${phone.category}</td>
									<td>${phone.number}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
					<td>
						<table border="1">
							<c:forEach var="address" items="${people.addresses}">

<!-- 								<tr> -->
<!-- 									<th class="th">Category</th> -->
<!-- 									<th class="th">Street</th> -->
<!-- 									<th class="th">City</th> -->
<!-- 									<th class="th">State</th> -->
<!-- 								</tr> -->

								<tr>
									<td>${address.category}</td>
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

<!-- 								<tr> -->
<!-- 									<th class="th">Category</th> -->
<!-- 									<th class="th">Email</th> -->
<!-- 								</tr> -->

								<tr>
									<td>${email.category}</td>
									<td>${email.email}</td>
			</tr>
							</c:forEach>
						</table>
					</td>
					   <td><a href="peopleUpdate.html?id=${people.id}"><span  id="removeupSavedPeople" class="glyphicon glyphicon-refresh"></span></a></td>
 <td>
     <a href="peopleDelete.html?id=${people.id}"><span id="removeupSavedPeople" class="glyphicon glyphicon-floppy-remove"></span></a>  </td>
				</tr>
			</table>
								
			
		</c:forEach>
	</div>



<!-- 	<div id="showPeople"> -->

<%-- 		<c:forEach var="peopleReport" items="${peopleReport}"> --%>

<!-- 			<table border="1"> -->

<!-- 				<tr> -->
<!-- 					<th>ID -->
<!-- 					<th>Name</th> -->
<!-- 					<th>Last Name</th> -->
<!-- 					<th>Age</th> -->
<!-- 					<th>Phone Number</th> -->
<!-- 					<th>Address</th> -->
<!-- 					<th>Email</th> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<td>${peopleReport.peopleId}</td> --%>
<%-- 					<td>${peopleReport.peopleName}</td> --%>
<%-- 					<td>${peopleReport.peopleLastName}</td> --%>
<%-- 					<td>${peopleReport.peopleAge}</td> --%>
<!-- 					<td> -->
<!-- 						<table> -->
<!-- 							<tr> -->
<!-- 								<th>Category</th> -->
<!-- 								<th>Number</th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<%-- 								<td>${peopleReport.phoneNumberNumber}</td> --%>
<%-- 								<td>${peopleReport.phoneNumberNumber}</td> --%>
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</td> -->
<!-- 					<td> -->
<!-- 						<table> -->

<!-- 							<tr> -->
<!-- 								<th>Category</th> -->
<!-- 								<th>Street</th> -->
<!-- 								<th>City</th> -->
<!-- 								<th>State</th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<%-- 								<td>${peopleReport.addressCategory}</td> --%>
<%-- 								<td>${peopleReport.addressStreet}</td> --%>
<%-- 								<td>${peopleReport.addressCity}</td> --%>
<%-- 								<td>${peopleReport.addressState}</td> --%>
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</td> -->
<!-- 					<td> -->
<!-- 						<table> -->
<!-- 							<tr> -->
<!-- 								<th>Category</th> -->
<!-- 								<th>Email</th> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<%-- 								<td>${peopleReport.mailCategory}</td> --%>
<%-- 								<td>${peopleReport.mailEmail}</td> --%>
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->

<%-- 		</c:forEach> --%>

<!-- 	</div> -->




</body>
</html>