<%@page import="project.models.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shop Now</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>

<!-- Vendor CSS Files -->
<link
	href="<c:url value="resources/vendor/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="resources/vendor/bootstrap-icons/bootstrap-icons.css"/>"
	rel="stylesheet">
<!-- Template Main CSS File -->
<link href="<c:url value="resources/css/shop_style.css"/>"
	rel="stylesheet">

</head>

<body>
	<%
	response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
	user User = (user) session.getAttribute("User");
	if (User == null) {
		response.sendRedirect("login");
	}
	%>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center">
		<div class="container d-flex justify-content-between">

			<div class="logo">
				<h1>
					<a href="index.html">Charectro</a>
				</h1>
			</div>

			<nav id="navbar" class="navbar">
				<ul>
					<li><i class="fas fa-user"></i><b> Hello, ${user.name} !! </b></li>
					<li><a class="nav-link scrollto active" href="home">Home</a></li>
					<li><a class="nav-link scrollto" href="Logout">Log Out</a></li>
					<li><a class="nav-link scrollto" href="cart?cid=${cid}">Cart</a></li>

				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>

	<div class="container mt-5 py-5">
		<div class="slider">
			<img src="<c:url value="resources/img/cartoons.jpg"/>"
				alt="">
		</div>
	</div>

	<section id="featured" class="my-5 pb-5">
		<div class="container text-center mt-5 py-5">
			<h2>Our Products</h2>
			<hr class="mx-auto">
			<p>Here you can check out our new products with fair price.</p>
		</div>	

		<div class="row mx-auto container-fluid">
			<c:forEach var="info" items="${products}">
				<div
					onclick="window.location.href='product?pid=${info.pid}&cid=${cid}';"
					class="product text-center col-lg-3 col-md-4 col-12">

					<img src="<c:url value="${info.photo}"/>" width="200px"
						height="200px" />
					<h5 class="p-name">${info.pname}</h5>
					<h4 class="p-price">${info.price}</h4>
					<button class="buy-btn" href="product?pid=${info.pid}&cid=${cid}">Buy
						Now</button>
				</div>
			</c:forEach>
		</div>
	</section>

	<!-- Vendor JS Files -->
	<script src="<c:url value="resources/vendor/aos/aos.js"/>"></script>
	<script
		src="<c:url value="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>


	<!-- Template Main JS File -->
	<script src="<c:url value="resources/js/main.js"/>"></script>
</body>

</html>