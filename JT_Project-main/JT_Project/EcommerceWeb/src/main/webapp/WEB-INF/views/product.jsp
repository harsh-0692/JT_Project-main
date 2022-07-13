<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,700"
        rel="stylesheet">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <!-- Vendor CSS Files -->
    <link href="<c:url value="resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="resources/vendor/bootstrap-icons/bootstrap-icons.css"/>" rel="stylesheet">
    <!-- Template Main CSS File -->
    <link href="<c:url value="resources/css/shop_style.css"/>" rel="stylesheet">

    <style>
        .sproduct input {
            width: 50px;
            height: 40px;
            padding-left: 10px;
            font-size: 16px;
            margin-right: 10px;
        }

        .sproduct input:focus {
            outline: none;
        }

        .buy-btn {
            background: #e4760f;
            opacity: 1;
            transition: 0.3s all;
        }
    </style>
</head>

<body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center">
        <div class="container d-flex justify-content-between">

            <div class="logo">
                <!-- Uncomment below if you prefer to use an text logo -->
                <h1><a href="index.html">Charectro</a></h1>
            </div>

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link scrollto active" href="index">Home</a></li>
                    <li><a class="nav-link scrollto" href="Logout">Log Out</a></li>
                    <li><a class="nav-link scrollto" href="cart?cid=${cid}">Cart</a></li></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->

        </div>
    </header>
    <!-- #header -->

    <section class="container sproduct my-5 pt-5">
    <form action="addTocart?pid=${product.pid}" method="post">
        <div class="row mt-5">
            <div class="col-lg-5 col-md-12 col-12">
                <img class="img-fluid w-100" src="<c:url value="${product.photo}"/>" alt="">
            </div>
            <div class="col-lg-5 col-md-12 col-12">
                <h6>Character</h6>
                <h3 class="py-4"><b>${product.pname}</b></h3>
                <h2>${product.price}</h2>
                <input type="number" value="1" name="qty">
                <input type=submit value="Add to Cart" class="buy-btn">
                <h4 class="mt-5 mb-5"><b>${product.description}</b></h4>
            </div>
        </div>
        </form>
    </section>

    <section id="featured" class="my-5 pb-5">
        <div class="container text-center mt-5 py-5">
            <h3>Other Products</h3>
            <hr class="mx-auto">
            <!-- <p>Here you can check out our new productss with fair price.</p> -->
        </div>
        <div class="row mx-auto container-fluid">
        <c:forEach var="info" items="${products}">
        
            <div class="product text-center col-lg-3 col-md-4 col-12">
                <img class="img-fluid mb-3" src="<c:url value="${info.photo}"/>" alt="">
                <h5 class="p-name">${info.pname}</h5>
                <h4 class="p-price">${info.price}</h4>
                <a href="product?pid=${info.pid}&cid=${cid}"><button class="buy-btn" >Buy Now</button></a>
            </div>
          </c:forEach> 
        </div>
    </section>



    <!-- Vendor JS Files -->
    <script src="<c:url value="resources/vendor/aos/aos.js"/>"></script>
    <script src="<c:url value="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Template Main JS File -->
  <script src="<c:url value="resources/js/main.js"/>"></script>

</body>

</html>