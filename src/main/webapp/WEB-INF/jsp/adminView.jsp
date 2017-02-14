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
      <a class="navbar-brand" href="#">Memory</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class=""><a href="home.html"><span class="glyphicon glyphicon-home"></span> <spring:message code="home"/> </a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-globe"></span> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="?language=en"><spring:message code="english"/> </a></li>
            <li> <a href="?language=es"><spring:message code="spanish"/> </a></li>
          </ul>
        </li>
         <li class="dropdown active">
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


	
	<div class="table-responsive">
	
	   <table border="1" id="customersAdminView">
	         <tr >
	         <th>ID</th>
	         <th><spring:message code="img"/> </th>
	         <th><spring:message code="signin.fullName"/></th>
	        <th> <spring:message code="username"/> </th>
	         <th><spring:message code="email"/> </th>
	         <th>Role</th>
	         <th><spring:message code="update"/> </th>
	         <th><spring:message code="delete"/> </th>
	         </tr>
	<c:forEach items="${users}" var="user">
	         <tr>
	         
	             <td>${user.id}  </td>
	         <td>
	
	 <img width="75px" height="75px" class="w3-circle" src="/Memory/${user.rutaImg }">  
	         
	         </td>
	         <td>${user.fullName}</td>
	             <td>${user.userName}   </td>
	             <td>${user.email}  </td>
	             <c:forEach var="authorities" items="${user.authorities}">
	             <td>
	               ${authorities.authority}
	             </td>
	             </c:forEach>
						   <td><a href="userUpdate.html?id=${user.id}"><span  id="removeupAdminView" class="glyphicon glyphicon-refresh"></span></a></td>
 <td>
     <a href="userDelete.html?id=${user.id}"><span id="removeupAdminView" class="glyphicon glyphicon-floppy-remove"></span></a>
 
  </td>
  
	         </tr>
	       </c:forEach>
	     </table>    
	       
	     
	     
	</div>
	<div>
	<ul>
	<c:forEach var="c" items="${comments}">
	 <li>
	   <h4> <a href="#" onClick="dComment(${c.id})">X</a> - ${c.name} </h4>
	   <p>${c.message}</p>
	  
	 </li>
	</c:forEach>
	</ul>
	
	</div>
	

</body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery-1.8.3.js"></script>
<script type="text/javascript">
function dComment(id){
	$.post("dComment.html", {id: id},
			function(data,status){
				location.reload();
			});
}

</script>
</html>