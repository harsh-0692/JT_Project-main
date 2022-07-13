<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
	<title>Animated Login Form</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="resources/css/login_style.css" />">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<img class="login-bg" src="resources/img/login-bg.png">
	<div class="container">
		<div class="img">
			<img src="<c:url value="resources/img/login.png" />">
		</div>
		<div class="login-content">
		<span style="color:red; font-size:12px;">${error }</span>
			<form action="loguser" method="post">
				<img src="<c:url value="resources/img/avatar.png" />">
				<h2 class="title">Welcome</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Email</h5>
           		   		<input type="email" class="input" name="email">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i">
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Password</h5>
           		    	<input type="password" class="input" name="password">
            	   </div>
            	</div>
				<div class="new">
					<p>Not having account? <a href="signup">New User</a></p>
					
				</div>
            	<input type="submit" class="btn" value="Login">
            </form>
        </div>
    </div>
    <script type="text/javascript" src="<c:url value="assets/js/main.js" />"></script>
  <script src="<c:url value="/resources/js/login_main.js"/>"></script>
</body>
</html>
