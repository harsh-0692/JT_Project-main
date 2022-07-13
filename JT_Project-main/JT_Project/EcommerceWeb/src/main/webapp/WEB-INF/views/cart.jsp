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
    <title>Cart</title>
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


</head>

<body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center">
        <div class="container d-flex justify-content-between">

            <div class="logo">
                <!-- Uncomment below if you prefer to use an text logo -->
                <h1><a href="index.html">Spring</a></h1>
            </div>

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link scrollto active" href="/">Home</a></li>
                    <li><a class="nav-link scrollto" href="home">Shop</a></li>
                    <li><a class="nav-link scrollto" href="Logout">Log Out</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>

        </div>
    </header>
    <!-- #header -->

    <section id="featured" class="pt-5 mt-5 container">
        <h3 class="font-weight-bold pt-5">Shopping Cart</h3>
        <hr>
        <!-- <p>Here you can check out our new productss with fair price.</p> -->
    </section>

    <section id="cart-container" class="container my-5">
        <table width="100%">
            <thead>
                <tr>
                    
                    <td>Product</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Total</td>
                    <td>Remove</td>
                </tr>
            </thead>
            <tbody>
             <c:forEach var="item" items="${itemslist}">
                <tr>
                    
                    <td><h5>${item.pname}</h5></td>
                    <td><h5>${item.price}</h5></td>
                    <td>${item.quantity}</td>
                    <td><h5>${item.total}</h5></td>
                    <td><a href="deleteItem?SrNo=${item.srNo}&cid=${item.cid}&pid=${item.pid}"><i class="fas fa-trash-alt">delete</i></a></td>
                </tr>
              </c:forEach>
            </tbody>
        </table>
    </section>


    <section id="cart-bottom" class="container">
        <div class="row">
            <div class="total col-lg-6 col-md-6 col-12">
                <div>
                    <h5>CART TOTAL</h5>
                    <div class="d-flex justify-content-between">
                        <h6>Total</h6>
                        <p>${usercart.total}</p>
                    </div>
                    
                    <a href="bill?cid=${usercart.cid}"><button class="ml-auto">Place Order</button></a>
                </div>
            </div>
        </div>
    </section>








    <!-- Vendor JS Files -->
    <script src="<c:url value="resources/vendor/aos/aos.js"/>"></script>
    <script src="<c:url value="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Template Main JS File -->
    <script src="<c:url value="resources/js/main.js"/>"></script>
</body>

</html>