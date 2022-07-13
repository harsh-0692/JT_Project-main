<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>



<link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>


<link href="<c:url value="/resources/css/style2.css"/>" rel="stylesheet">

</head>
<body>


	<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image"> <img
					src="<c:url value="resources/img/logo.png"/>" alt="">
				</span>

				<div class="text logo-text">
					<span class="name" style="color:orange;font-size:30px">Charectro</span>

				</div>
			</div>

			<i class='toggle'></i>
		</header>

		<div class="menu-bar">
			<div class="menu">



				<ul class="menu-links">
					<li class="nav-link"><a href="category"> <i
							class='bx bx-home-alt icon'></i> <span class="text nav-text">Categories</span>
					</a></li>

					<li class="nav-link"><a href="product"> <i
							class='bx bx-bar-chart-alt-2 icon'></i> <span
							class="text nav-text">Products</span>
					</a></li>
					<li class="nav-link"><a href="Users"> <i
							class='bx bx-home-alt icon'></i> <span class="text nav-text">Users</span>
					</a></li>




				</ul>
			</div>

			<div class="bottom-content">
				<li class=""><a href="logout"> <i
						class='bx bx-log-out icon'></i> <span class="text nav-text">Logout</span>
				</a></li>


			</div>
		</div>

	</nav>

	<section class="home">
		<%
		response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
		String mail = (String) session.getAttribute("email");
		if (mail == null) {
			response.sendRedirect("");
		}
		%>
		<div style="align-items:left">
		<h3 id="name" style="text-align:left">
			<i class="fas fa-user"></i><b> <%
 out.write("  Hello " + mail);
 %>
			</b>
		</h3>
		</div>
		<p id="date">
			<%
			Date dNow = new Date();
			SimpleDateFormat ft = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm a zzz");
			out.print("<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
			%>

		</p>
		<p id="welcome" style="color:orange;font-size:80px;">Welcome To Charectro</p>
	</section>

	<script src="<c:url value="/resources/js/main.js" />"></script>

</body>
</html>