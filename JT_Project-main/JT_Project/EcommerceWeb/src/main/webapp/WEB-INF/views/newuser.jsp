<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html>

<head>
        <title>Registration Form</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="resources/css/login_style.css" />">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
        <img class="login-bg" src="<c:url value="resources/img/login-bg.png" />">
        <span style="color:red; font-size:12px;">${error }</span>
        <div class="container">
                <div class="img">
                        <img src="<c:url value="resources/img/login.png" />">
                </div>
                <div class="login-content">
                        <form action="register" method="post">
                                <!-- <img src="<c:url value="resources/img/avatar.png" />"> -->
                                <h2 class="title">Welcome</h2>
                                <div class="input-div one">
                                        <div class="i">
                                                <i class="fas fa-user"></i>
                                        </div>
                                        <div class="div">
                                                <h5>Name</h5>
                                                <input type="text" class="input" name="name">
                                        </div>
                                </div>
                                <div class="input-div mobile">
                                        <div class="i">
                                                <i class="fas fa-phone-alt"></i>
                                        </div>
                                        <div class="div">
                                                <h5>Mobile No.</h5>
                                                <input type="text" class="input" name="mobile">
                                        </div>
                                </div>
                                <div class="input-div email">
                                        <div class="i">
                                                <i class="fas fa-envelope-open"></i>
                                        </div>
                                        <div class="div">
                                                <h5>Email Address</h5>
                                                <input type="text" class="input" name="email">
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
                                 <div class="input-div one">
                                        <div class="i">
                                                <i class="fas fa-user"></i>
                                        </div>
                                        <div class="div">
                                                <h5>Address</h5>
                                                <input type="text" class="input" name="address">
                                        </div>
                                </div>
                                <div class="input-div one">
                                        <div class="i">
                                                <i class="fas fa-user"></i>
                                        </div>
                                        <div class="div">
                                                <h5>Shipping Address</h5>
                                                <input type="text" class="input" name="shipping_address">
                                        </div>
                                </div>
                                
                                <div class="new">
					<p>Already have account? <a href="login">Login</a></p>
				</div>
                                <input type="submit" class="btn" value="Submit">
                        </form>
                </div>
        </div>
        <script type="text/javascript" src="<c:url value="/resources/js/main.js" />"></script>
        <script src="<c:url value="/resources/js/login_main.js"/>"></script>
</body>

</html>