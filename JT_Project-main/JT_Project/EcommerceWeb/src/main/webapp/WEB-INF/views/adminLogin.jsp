<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
	 <link href="https://fonts.googleapis.com/css2?family=Lobster+Two&family=Raleway:wght@100&family=Ubuntu:wght@300&display=swap" rel="stylesheet">
	 <style>
	 
        body {
            background-color: whitesmoke;
            box-sizing: border-box;
        }

        .login {
            box-shadow: -2px 5px 30px 0.5px rgb(168, 168, 168);
            border-radius: 5%;
            width: 50%;
            margin-top: 9%;
            display: flex;
            flex-direction: row;
            align-items: center;
            border: none;
            margin-left: 25%;
            align-items: center;

        }

        

        .login-form {
            padding-top: 15vh;
            height: 50vh;

            width: 45vw;
            background-color: white;
            align-self: flex-end;
            border: none;
            font-family: 'Lobster Two', cursive;
            font-family: 'Raleway', sans-serif;
            font-family: 'Ubuntu', sans-serif;
            color: black;
        }

        table {
            padding-top: 0vh;
        }

        tr {
            line-height: 3vh;
        }

        input[type=text],
        input[type=password] {
            border: none;
            border-bottom: 0.5px solid black;
        }

        input[type=submit] {
            margin-top: 5vh;
            padding: 1vh 2vh;
            background-color: rgb(52, 152, 219);
            border: none;
            color: white;
            border-radius: 0.5vh;
        }
        a
        {
            text-decoration: none;
            font-size: small;
        }
        .imgs {
           font-family: 'Lobster Two', cursive;
            font-family: 'Raleway', sans-serif;
            font-family: 'Ubuntu', sans-serif;
			font-size:50px;
			background-color:orange;
			height:65vh;
			line-height:65vh;
			border-radius:5px;
			width:30vw;
        }
        
    </style>
	
</head>
<body>
	<div align="center" class="login">
		<div class="imgs" >Charectro</div>
        <div class="login-form">
        Admin Login<br><br><br>
        <form:form action="admin/login" method="post" modelAttribute="admin">
        <table>
            <tr>
                <td>Email:</td>
                
            </tr>
            <tr>
            	<td><form:input path="email" required="required"/></td>
            </tr>
            <tr>
            	<td><br></td>
            </tr>
            <tr class="pass">
                <td>Password:</td>
            </tr>
            <tr>
            	<td><form:input path="password" type="password" required="required"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Login"></td>
            </tr>
        </table>
        </form:form>
        	 <%	if(request.getAttribute("message")!=null)
        	 		out.write(""+request.getAttribute("message"));
        	 %>
        </div>
    </div>
</body>
</html>