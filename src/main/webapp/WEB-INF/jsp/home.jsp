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

</style>

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
      <a class="navbar-brand active" href="#">Memory</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
       <li><a data-toggle="modal" data-target="#" onClick="aboutMemory('1')" href="#"><spring:message code="aboutmemory"/></a></li>
      <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href=""><spring:message code="contact"/><span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#"> <span class="fa fa-mobile" style="font-size:22px"></span>    Whatsapp: 1-809-230-1476</a></li>
       <li> <a href="https://github.com/elmatru" target="_blank"><span class="fa fa-github" style="font-size:16px"></span> github.com/elmatru</a></li>
     <li> <a href="https://do.linkedin.com/in/anderson-ferreiras-bab7a7128" target="_blank"><span class="fa fa-linkedin-square" style="font-size:16px"></span> linkedin.com/in/anderson-ferreiras-bab7a7128</a></li>
      
      </ul>
      </li>   
        <li>
        <a onclick="helpPanel('helpPanel')" href="#"><spring:message code="faq"/></a>
        </li>
     </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-globe"></span> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="?language=en" onClick="enimg()"><spring:message code="english"/> </a></li>
            <li> <a href="?language=es" onClick="esimg()"><spring:message code="spanish"/> </a></li>
          </ul>
        </li>
         <li class="dropdown ">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> <spring:message code="user"/> <span class="caret"></span></a>
          <ul class="dropdown-menu">
          <sec:authorize access="isAuthenticated()"> 
 	<li>		<a href="userView.html"><span class="glyphicon glyphicon-user"></span> <spring:message code="userProfile"/> </a> </li>
<li>  			<a href="j_spring_security_logout"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="logout"/> </a> 
 		 </li>
 		</sec:authorize> 
 		 <sec:authorize access="!isAuthenticated()" > 
               <li><a href="signIn.html"><span class="glyphicon glyphicon-user"></span> <spring:message code="signin"/> </a> </li>
          <li><a data-toggle="modal" data-target="#loginModal"  href="#"><button id="aSubmit" hidden="true"></button><span class="glyphicon glyphicon-log-in"></span> <spring:message code="login"/></a>
          </li>
<li><a href="#" onClick="ingresar()" id="loginbuttonn" style="text-decoration: none" ><i class="fa fa-facebook-square" style="font-size:20px;color:darkblue;"></i> <spring:message code="login"/></a>
</li>
         </sec:authorize>
          </ul>
        </li>
      </ul>

    </div>
  </div>


</nav>

    </div>  
<div class="w3-accordion w3-white" id="float">
<div id="helpPanel" class="w3-accordion-content">
      <div class="w3-container">
  <h2 class="w3-animate-zoom"><spring:message code="faq"/></h2>
  <a href="#p1" class="w3-animate-zoom mc-text-blue" data-toggle="collapse"><spring:message code ="ask1"/></a>
  <div id="p1" class="collapse ">
   <spring:message code="res1"/>
  </div>
   <a href="#p2" class="w3-animate-zoom mc-text-blue" data-toggle="collapse"><spring:message code="ask2"/></a>
  <div id="p2" class="collapse ">
   <spring:message code="res2"/>
  </div>
   <a href="#p3" class="w3-animate-zoom mc-text-blue" data-toggle="collapse"><spring:message code="ask3"/></a>
  <div id="p3" class="collapse ">
   <spring:message code="res3"/>
  </div>
   <a href="#p4" class="w3-animate-zoom mc-text-blue" data-toggle="collapse"><spring:message code="ask4"/></a>
  <div id="p4" class="collapse ">
   <spring:message code="res4"/>
  </div>
   <a href="#p5" class="w3-animate-zoom mc-text-blue" data-toggle="collapse"><spring:message code="ask5"/></a>
  <div id="p5" class="collapse ">
   <spring:message code="res5"/>
  </div>
   <a href="#p6" class="w3-animate-zoom mc-text-blue" data-toggle="collapse"><spring:message code="ask6"/></a>
  <div id="p6" class="collapse ">
   <spring:message code="res6"/>
  </div>
   <a href="#p7" class="w3-animate-zoom mc-text-blue" data-toggle="collapse"><spring:message code="ask7"/></a>
  <div id="p7" class="collapse ">
   <spring:message code="res7"/>
  </div>
  </div><br/>
     <button type="button" class="btn w3-white" onClick="helpPanel('helpPanel')" id="clos"><spring:message code="close"/></button>
      </div>
    </div>

     
<div  class="w3-container" id="divimg">
  <img alt="" src="img/baner.png" class="img-responsive w3-card-12" id="h1img">
  <img alt="" src="img/baner2.png" class="img-responsive w3-card-12" id="h1img2"> 
</div>
<script type="text/javascript">
var c = document.getElementById('clos').innerHTML;
if(c == "Cerrar"){$("#h1img").hide();$("#h1img2").show();
}else{$("#h1img").show();$("#h1img2").hide();}
</script> 


<div> 
<br/>
          <!-- loginModal -->
  <div class="modal fade container w3-animate-zoom" id="loginModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header mc-blue ">
          <button type="button" class="close w3-text-white" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><spring:message code="login"/></h4>
        </div>
        <div class="modal-body">
          <c:if test="${not empty error }">	
<div class="errorblockLogin">
Your login was unsuccessful. <br/>
Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
</div>
</c:if>
		${info}

<div id="form-login" >
		<form class="w3-container formL" action="j_spring_security_check" name="f" method="post" role="form">
             <div class="form-group" >
      <label for="username"><spring:message code="username"/> </label>
      <input type="text" class="w3-input int-color w3-hover-blue"  placeholder='<spring:message code="username"/>' name="j_username" id="inpnick"/>
    </div>
      <div class="form-group" >
      <label for="password"><spring:message code="password"/> </label>
      <input type="password" class="w3-input int-color w3-hover-blue"  placeholder='<spring:message code="password"/>' name="j_password" id="inpcv"/>
    </div>
			
			<input class="btn w3-ligth-gray" type="reset" value="<spring:message code="cancel"/>" />
			 <button type="submit" class="btn mc-blue" id="loginbutton"><spring:message code="login"/>   </button>
			 	</form>
</div>
        </div>
        <div class="modal-footer mc-blue">
        <button type="button" class="btn mc-blue" data-dismiss="modal" data-toggle="modal" data-target="#myModalF"><spring:message code="forgot"/></button>
          <button type="button" class="btn mc-blue" data-dismiss="modal"><spring:message code="close"/></button>
        </div>
      </div>
      
    </div>
  </div>
  
  
    
        
  <!-- modal about memory -->
</div>
<div class="w3-container" >
  <div id="id01" class="w3-modal" ondblclick="aboutMemory('2')" style="z-index:15">
    <div class="w3-modal-content  w3-animate-zoom w3-card-8">
      <header class="w3-container gradblue"> 
        <span onclick="aboutMemory('2')" 
        class="w3-closebtn">&times;</span>
        <h2><spring:message code="technologies"/></h2>
      </header>
      <div class="w3-container">
      <div>
        <h4 class="w3-center">Memory</h4>
        <p><spring:message code="about.p1"/></p>
        <p><spring:message code="about.p2"/></p>
        <p><spring:message code="about.p3"/></p>
        </div>
        <div>
            <table>
             <tr>
               <th>Front-End</th><th>Back-End</th><th>Database</th><th>Spring Framework</th><th><spring:message code="other"/></th>
             </tr>
             <tr>
              <td>HTML</td> <td>Java</td> <td>MySQL</td> <td>Spring MVC</td><td>Json</td>
             </tr>
               <tr>
                <td>CSS</td> <td></td> <td>SQL</td> <td>Spring Security</td> <td>XML</td>
               </tr>              
               <tr>
                 <td>JavaScript</td> <td></td> <td>JPA</td> <td></td><td>Facebook API</td>
               </tr>
               <tr>
                <td>Bootstrap</td> <td></td> <td>Hibernate ORM</td> <td></td><td>Google Maps API</td>
               </tr>
               <tr>
               <td>JQuery</td> 
               </tr>
               <tr>
               <td>AJAX</td>
               </tr>
            </table>
        </div><hr/><br/>
        <div id="blockm" class="blockm">
  <div class="w3-card-12 " >
   <img src="img/estaeh.jpg" alt="car" class=""  style="width:100%">
    <div class="w3-container w3-center">
    </div>
   </div></div>
 <br/>
   <div id="w3-container">
      <p><spring:message code="about.p4"/>
       </p>
         <p><spring:message code="about.p5"/></p>
     </div> </div>
      
      <br/>
      
      <footer class="w3-container gradblue">
     <a type="button" class="" onclick="aboutMemory('2')" style="text-decoration: none;" ><spring:message code="close"/></a>
      </footer>
    </div>
  </div>
</div>


<div class="container">
  <!-- Trigger the modal with a button -->
  <button hidden="true" id="modalb" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalB">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModalB" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header mc-blue">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><spring:message code="thankforjoin"/></h4>
        </div>
        <div class="modal-body gradblue">
          <h5><spring:message code="thankforjoin"/> ${name}</h5>
          <h5><spring:message code="welcome.m1"/> ${email} <spring:message code="welcome.m2"/></h5>
        </div>
        <div class="modal-footer mc-blue">
          <button type="button" class="btn mc-blue" data-dismiss="modal"><spring:message code="close"/></button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<div class="container">
  <!-- Trigger the modal with a button -->
  <button hidden="true" id="modalf" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalF"><spring:message code="forgot"/></button>

  <!-- Modal -->
  <div class="modal fade w3-white" id="myModalF" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header mc-blue">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Memory - <spring:message code="recucv"/></h4>
        </div>
        <div class="modal-body gradblue" id="bodyforgot">
         <label><spring:message code="email"/></label> 
         <input type="email" id="emailforgot" placeholder='<spring:message code="email"/>' class="form-control"  onkeypress="if(event.keyCode == 13) submitform()"/>
         <span id="mforgot" class="w3-text-white w3-center"></span>
         <br/>  <button onclick="submitform()" class="mc-blue btn w3-center"><spring:message code="send"/></button>
        </div>
        <div class="modal-footer mc-blue">
          <button type="button" class="btn mc-blue" data-dismiss="modal"><spring:message code="close"/></button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<div class="container" >
  <button hidden="true" id="modalget" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalgetpassword"><spring:message code="getpassword"/></button>
  <!-- Modal -->
  <div class="modal fade w3-white" id="myModalgetpassword" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header mc-blue">
          <button type="button"  class="close closebutton" data-dismiss="modal">&times;</button>
       <button type="button" onClick="redirecthome()" class="close redirectbutton" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Memory - <spring:message code="newpassword"/></h4>
        </div>
        <div class="modal-body gradblue" id="bodyget">
         <label><spring:message code="password"/></label> 
      <input type="text" id="inpemailget"  hidden="true" class="form-control"  value="${email}"/>
         <input type="password" id="inppasswordget" placeholder="Password" class="form-control"  onkeypress="if(event.keyCode == 13) getnewpassword()"/>
         <span id="mgetpassword" class="w3-text-white w3-center"></span>
       <br/>  <button onclick="getnewpassword()" class="mc-blue btn w3-center"><spring:message code="send"/></button>
        </div>
        <div class="modal-footer mc-blue">
          <button type="button" class="btn mc-blue closebutton" data-dismiss="modal"><spring:message code="close"/></button>
          <button onclick="redirecthome()" type="button" class="btn mc-blue redirectbutton" data-dismiss="modal"><spring:message code="close"/></button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>



<br/>


<div id="map" class="w3-left" >

<!-- todo contenido aqui -->
</div>





<div class="w3-container w3-right" id="divcomment">
  <div class="w3-card-4">
    <div class="w3-container " id="grad4">
      <h3><spring:message code="leavecomm"/> </h3>
    </div>
<br/>
    <form class="w3-container">
    <p class="w3-animate-right" id="pcomment"></p>
      <p>
      <input class="w3-input" id="inpname" type="text"  onfocus="onfo()" placeholder="<spring:message code='name'/>"/>
      <label><spring:message code="name"/> </label></p>
      <p>     
      <textarea class="form-control" rows="2" id="inpm"  onfocus="onfo()" placeholder="<spring:message code='comment'/>"></textarea>
      <label><spring:message code="comment"/> </label></p>
   <p id="buttonComment">    <button onclick="cancelc()" type="reset" class="btn w3-lightgray w3-animate-left"><spring:message code="cancel"/></button>
      <button type="button" class="btn mc-blue w3-animate-right" onClick="sendcomment()"><spring:message code="comment"/></button><br/>
    </p></form>
    <div class="w3-container"  style="width:100%;">
    <hr style="border-top: 3px double #8c8b8b; width: 100%;"/>
     <h4><spring:message code="comments"/> - <span class="w3-badge mc-blue" id="badge"></span></h4>
    <ul class="w3-ul" id="ull">
    
   
  </ul>
  </div>
  </div>
</div>

<br/>



</body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBML-6xh4lLaW609xqimwTb0NI6I8ltoG0&callback=initMap"
    async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="jquery-1.8.3.js"></script> -->
<script type="text/javascript">
var getpassword = ${getpassword} + 1;
var modalVal = ${modalValue} + 1;
var modal = ${modal} + 1;

window.onload = function(){
	if(modalVal == 2){ $('#aSubmit').click(); }
	if(modal == 2){	$('#modalb').click();}
	if(getpassword == 2){$(".redirectbutton").hide();$('#modalget').click();}

	 $.ajaxSetup({ cache: true });
	  $.getScript('//connect.facebook.net/en_US/sdk.js', function(){
	    FB.init({
	      appId: '1715509435427206',
	      version: 'v2.7' // or v2.1, v2.2, v2.3, ...
	    });     
	    FB.getLoginStatus(updateStatusCallback);
	  });
		
	
	
	 $.get("comment.html", function(data, status){
		   var comments = JSON.parse(data);
		   document.getElementById("ull").innerHTML="";
		   document.getElementById("badge").innerHTML = comments.length;
		   var x =8;
		   for(var i =comments.length; i <= comments.length; i--){
			 
		   document.getElementById("ull").innerHTML +="<li class=''><h6 class='mc-text-blue '>"+comments[i-1].name+"</h6><p class='small' >"+comments[i-1].message+"</p></li>"; 	     
		   }
	 });
}

function initMap() {	
    var map = new google.maps.Map(document.getElementById('map'),{
      center: {lat: 18.484271, lng: -69.930178},
     scrollwheel: true,
      zoom: 11,
      scaleControl:true
      
    });   
  }	

function ingresar() {  
    FB.login(function(response){  
        validarUsuario();  
    }, {scope: 'public_profile, email'});  
}  

function validarUsuario() {  
    FB.getLoginStatus(function(response) {  
        if(response.status == 'connected') {  
            FB.api('/me?fields=id,name,email,permissions', function(response) {  
              
                $.post("fblogin.html",
                		{
                	  name: response.name, email: response.email, nick: response.id, cv: response.id
                		}, function(data,status){
                			var obj = JSON.parse(data);
                            document.getElementById("inpnick").value = obj.nick;
                            document.getElementById("inpcv").value = obj.cv;
                            $("#loginbutton").click();
                		});
            });  
        } else if(response.status == 'not_authorized') {  
            alert('<spring:message code="auth.m1"/>');  
        } else {  
            alert('<spring:message code="auth.m2"/>');  
        }  
    });  
} 

function redirecthome(){
	location.href = "home.html";
}

function getnewpassword(){
	var email = document.getElementById("inpemailget").value;
	var password = document.getElementById("inppasswordget").value;
	if(password == ""){
		document.getElementById("mgetpassword").innerHTML = "<spring:message code='empty.m1'/>";
	}
	else{
		$.post("get-new-password.html",
				{
			email: email,
			password: password
				},
				function(data,status){
					  $(".closebutton").hide();
					   $(".redirectbutton").show();
					document.getElementById("bodyget").innerHTML = "<h5 class='w3-text-white'><spring:message code='getcv.m1'/></h5>";
			            		
				});
	}
}

function submitform(){
	
	var email = document.getElementById("emailforgot").value;
	if(email == ""){
		document.getElementById("mforgot").innerHTML = "<spring:message code='empty.m1'/>";
	}
	else{	$.post("forgot.html",
			{email: email},
			function(data,status){
              if(data == "true"){
            	  document.getElementById("bodyforgot").innerHTML = "<h5 class='w3-text-white'><spring:message code='forgot.m1'/> <i class='w3-text-green'>"+email+"</i> <spring:message code='forgot.m2'/></h5>";
              }else{
            	  document.getElementById("mforgot").innerHTML = "<spring:message code='email'/> "+email+" <spring:message code='exist'/>";
              }
			});
	}
}




function sendcomment(){
	var name = document.getElementById("inpname").value;
	var message = document.getElementById("inpm").value;
	if(name =="" || message == ""){
		$("#pcomment").show();
		document.getElementById("pcomment").innerHTML = "<spring:message code='bothfields'/>";
	}else{
	$.post("comment.html",
			{
		name: name,
		message: message
			},
			function(data,status){
				document.getElementById("inpname").value="";
			    document.getElementById("inpm").value="";
			    $("#buttonComment").hide(100);
			    $("#pcomment").hide();
			   var comments = JSON.parse(data);
			   document.getElementById("ull").innerHTML="";
			   document.getElementById("badge").innerHTML = comments.length;
			   var x =8;
			   for(var i =comments.length; i <= comments.length; i--){
			   document.getElementById("ull").innerHTML +="<li class=''><h6 class='mc-text-blue '>"+comments[i-1].name+"</h6><p class='class='small''>"+comments[i-1].message+"</p></li>"; 	     
			   }
		       });
	}
}

function onfo(){
$("#buttonComment").show(300);
}

function cancelc(){
	$("#pcomment").hide();
	  document.getElementById("inpname").value ="";
	  document.getElementById("inpm").value= "";
	$("#buttonComment").hide();
}


	
	function aboutMemory(num){
		
		if(num == 1){
			document.getElementById("id01").style.display="block";
		}else{
			document.getElementById("id01").style.display="none";
		}
	}
	
	//estudiar esta function
	function helpPanel(id) {
		var x = document.getElementById(id);
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	    }
	}
	

	
</script>

</html>
