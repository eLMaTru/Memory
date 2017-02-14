<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="js/general.js"></script>
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
       
      </ul>
      <ul class="nav navbar-nav navbar-right">
       
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

	<!-- forms -->
	<div id="formAddPeople">
		<form:form role="form" modelAttribute="people"
			enctype="multipart/form-data" class="w3-container formS" id="xd">
			<div class="form1" >
				<div class="form-group" id="inpAddPeople">
					<label><spring:message code="name" /> </label>
					<form:input type="text" class="form-control int-color"
						placeholder='' path="name" />
					<form:errors class="error" path="lastName"></form:errors>
				</div>
				<div class="form-group" id="inpAddPeople">
					<label for="pwd"><spring:message code="lastName" /> </label>
					<form:input type="text" class="form-control"
						placeholder="" path="lastName" />
					<form:errors class="error" path="lastName"></form:errors>
				</div>
				<div class="form-group" id="inpAddPeople">
					<label for="pwd"><spring:message code="age" /> </label>
					<form:input type="number" class="form-control"
						placeholder="" path="age" />
					<form:errors class="error" path="age"></form:errors>
					
					</div >
					<div class="form-group">
					 <form:radiobutton path="gender" value="M"/> <label> <spring:message code="male"/></label>
                     <form:radiobutton path="gender" value="F"/> <label> <spring:message code="female"/></label>
                    <br/></div>
                    <div  class="form-group">
                    <a href="userView.html"><button type="button" class="btn  w3-lightgray"><spring:message code="back"/></button></a> 
					<button class="btn mc-blue" id="btn-next-people" type="button"><spring:message code="next"/></button>
				</div>
			</div>

			<div id="form2">
				<form:form role="form" modelAttribute="phone" method="post">
					<div class="form2">
						<div class="form-group" id="inpAddPeople">
							<label><spring:message code="phoneNumber" /> </label>
							<form:input type="number" class="form-control"
								placeholder="" path="number" />
							<form:errors class="error" path="number"></form:errors>
						</div>

						<div class="form-group" id="inpAddPeople">
							<form:select id="category-phone" path="categoryPh" class="btn mc-blue">
								<form:option value="HOME">
									<spring:message code="HOME" />
								</form:option>
								<form:option value="WORK">
									<spring:message code="WORK" />
								</form:option>
								<form:option value="OTHER">
									<spring:message code="OTHER" />
								</form:option>
							</form:select>
						</div>

						<div id="formPhone"></div>
						<button type="button" class="btn mc-blue" onClick="phoneFunction()">+</button>
						<br /><br />
					<button class="btn w3-lightgray" id="btn-back-phone" type="button"><spring:message code="back"/></button>
					<button class="btn mc-blue" id="btn-next-phone" type="button"><spring:message code="next"/></button>
						
					</div>

					<div id="form3">

						<form:form role="form" modelAttribute="address" method="post">
							<div class="form3">
								<label> <spring:message code="address" />
								</label>
								<div class="form-group" id="inpAddPeople">
									<label for="email"><spring:message code="street" /> </label>
									<form:input type="text" class="form-control inputs"
										placeholder="" path="street" />
										<p class="demo1"></p>
									<form:errors class="error" path="street"></form:errors>
								</div>
								<div class="form-group" id="inpAddPeople">
									<label for="email"><spring:message code="city" /> </label>
									<form:input type="text"  class="form-control inputs" placeholder=""
										path="city" />
										<p class="demo1"></p>
									<form:errors class="error" path="city"></form:errors>
								</div>
								<div class="form-group" id="inpAddPeople">
									<label for="email"><spring:message code="state" /> </label>
									<form:input type="text" class="form-control inputs"
										placeholder="" path="state" />
										<p class="demo1"></p>
									<form:errors class="error" path="state"></form:errors>
								</div>
								<div class="form-group" id="inpAddPeople">
									<form:select id="category" path="categoryA" class="btn mc-blue">
										<form:option value="HOME">
											<spring:message code="HOME" />
										</form:option>
										<form:option value="WORK">
											<spring:message code="WORK" />
										</form:option>
										<form:option value="OTHER">
											<spring:message code="OTHER" />
										</form:option>
									</form:select>
								</div>
								<div id="formAddress"></div>
								<button type="button" onClick="addressFunction()" class="btn mc-blue">+</button>
								<br />
								<br />
					          <button class="btn w3-lightgray" id="btn-back-address" type="button"><spring:message code="back"/></button>
					<button class="btn mc-blue" id="btn-next-address" type="button"><spring:message code="next"/></button>
					
							</div>
						
							<div id="form4">
								<form:form role="form" modelAttribute="mail" method="post" id="form-email">
									<div class="form4">
										<label><spring:message code="mail" /> </label>
										<div class="form-group" id="inpAddPeople">
											<label for="email"><spring:message code="email" /> </label>
											<form:input type="email" class="form-control"
												placeholder="" path="email" />
										</div>
										<div class="form-group" id="inpAddPeople">
											<form:select id="category" path="categoryM" class="btn mc-blue">
												<form:option value="HOME">
													<spring:message code="HOME" />
												</form:option>
												<form:option value="WORK">
													<spring:message code="WORK" />
												</form:option>
												<form:option value="OTHER">
													<spring:message code="OTHER" />
												</form:option>
											</form:select>
										</div>
										<div id="emailForm"></div>
										<button type="button" class="btn mc-blue" onClick="emailFunction()">+</button>
										<br />
										<br />
                                        <button class="btn  w3-lightgray" id="btn-back-email" type="button"><spring:message code="back"/></button>
										<button type="button" class="btn mc-blue" id="btn-submit" onClick="validate()"><spring:message code="save" /></button>
									</div>
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
	window.onload = function() {
		$('#btn-next-people').click(function() {
			$('.form1').fadeOut("1000", function() {
				$('.form2').fadeIn();
			});
		});
		
		$("#btn-back-phone").click(function(){
			$(".form2").fadeOut(500,function(){
				$(".form1").fadeIn();
			});
		});
		
		$("#btn-next-phone").click(function(){
			$(".form2").fadeOut(500,function(){
				$(".form3").fadeIn();
			});
		});
		
		$("#btn-back-address").click(function(){
			$(".form3").fadeOut(500, function(){
				$(".form2").fadeIn();
			});
		});
		
		$("#btn-next-address").click(function(){
			$(".form3").fadeOut(500,function(){
				$(".form4").fadeIn();
			});
		});
		
		$("#btn-back-email").click(function(){
			$(".form4").fadeOut(500,function(){
				$(".form3").fadeIn();
			});
		});
		
}

function validate() {
			var text = "";
			var x = 0;
			var empty = 0;
			var inputs = document.getElementsByClassName("inputs");
			
			for(var i = 0; i < inputs.length; i++) {
				if(inputs[i].value == "") {
					empty += 1;
				}
			}
			if(empty == inputs.length ) {
				document.getElementById("xd").submit();
				} 
			else if(empty == 0){
										 $("#xd").submit();
				}
			    else{
			    
			    	while (x < inputs.length) {
						if(inputs[x].value == "") {
							text = "<spring:message code='empty.m2'/>";
							var demo1 = document.getElementsByClassName("demo1");
							demo1[x].innerHTML = text;
						}
						x++;
					}//cierre del while
					$(".form4").fadeOut(2000);
						$(".form1").fadeOut(2000);
						$(".form2").fadeOut(2000);
						 $(".form3").fadeIn();
			    }
			}

	function phoneFunction() {
		var x = "";
		x = '<div><form:form role="form" modelAttribute="phone" method="post">'
				+ ' <div class="form-group" id="inpAddPeople">'
				+ '<form:input type="number" class="form-control"  placeholder="" path="number" /> '
				+ '<form:errors class="error" path="number"></form:errors> '
				+ ' </div>'
				+ '<div class="form-group" id="inpAddPeople">'
				+ ' <form:select id="category" path="categoryPh" class="btn mc-blue"> '
				+ '<form:option value="HOME"><spring:message code="HOME"/></form:option>'
				+ '<form:option value="WORK"><spring:message code="WORK"/></form:option>'
				+ '<form:option value="OTHER"><spring:message code="OTHER"/></form:option>'
				+ '</form:select></form:form></div>';
		document.getElementById("formPhone").innerHTML += x;
	}

	function addressFunction() {
		var x = '<div ><form:form role="form" modelAttribute="address" method="post">'
				+ '<div class="form-group" id="inpAddPeople">'
				+ ' <label for="email"><spring:message code="street"/></label>'
				+ '<form:input type="text" class="form-control inputs"  placeholder="" path="street" />'
				+ '<p class="demo1"></p>'
				+ ' <form:errors class="error" path="street"></form:errors>'
				+ '</div>'
				+ '<div class="form-group" id="inpAddPeople">'
				+ ' <label for="email"><spring:message code="city"/></label>'
				+ '<form:input type="text" class="form-control inputs"  placeholder="" path="city" />'
				+ '<p class="demo1"></p>'
				+ '<form:errors class="error" path="city"></form:errors>'
				+ '</div>'
				+ '  <div class="form-group" id="inpAddPeople">'
				+ '<label for="email"><spring:message code="state"/></label>'
				+ '<form:input type="text" class="form-control inputs"  placeholder="" path="state" />'
				+ '<p class="demo1"></p>'
				+ '<form:errors class="error" path="state"></form:errors>'
				+ '</div>'
				+ '<div class="form-group" id="inpAddPeople">'
				+ '<form:select id="category" path="categoryA" class="btn mc-blue">'
				+ '<form:option value="HOME"><spring:message code="HOME"/></form:option>'
				+ '<form:option value="WORK"><spring:message code="WORK"/></form:option>'
				+ '<form:option value="OTHER"><spring:message code="OTHER"/></form:option>'
				+ '</form:select> </form:form> </div>';

		document.getElementById("formAddress").innerHTML += x;
	}

	function emailFunction() {
		var x = '<div >'
				+ '<form:form role="form" modelAttribute="mail" method="post">'
				+ '<div class="form-group" id="inpAddPeople">'
				+ ' <form:input type="email" class="form-control"  placeholder="" path="email" />'
				+ '</div>'
				+ '<div class="form-group" id="inpAddPeople">'
				+ '<form:select id="category" path="categoryM" class="btn mc-blue">'
				+ '<form:option value="HOME"><spring:message code="HOME"/></form:option>'
				+ '<form:option value="WORK"><spring:message code="WORK"/></form:option>'
				+ ' <form:option value="OTHER"><spring:message code="OTHER"/></form:option>'
				+ '	</form:select></form:form></div>';

		document.getElementById("emailForm").innerHTML += x;
	}
</script>
</html>