<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Welcome to Charectro</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
  
  <!-- Vendor CSS Files -->
  <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/vendor/bootstrap-icons/bootstrap-icons.css" />" rel="stylesheet">
  <!-- Template Main CSS File -->
  
  <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">

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
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">About Us</a></li>
          <li><a class="nav-link scrollto" href="#team">Team</a></li>      
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- #header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="clearfix">
    <div class="container" data-aos="fade-up">

      <div class="hero-img" data-aos="zoom-out" data-aos-delay="200">
        <img src="<c:url value="/resources/img/hero-img.svg" />" alt="" class="img-fluid">
      </div>

      <div class="hero-info" data-aos="zoom-in" data-aos-delay="100">
        <h2>Start Shopping Journey<br><span>Charectro !!!</span><br>Online Shopping Site</h2>
        <div>
          <a href="login" class="btn-get-started scrollto">Login</a>
          <a href="signup" class="btn-get-started scrollto">New User</a>
          <a href="admin" class="btn-get-started scrollto">Admin Login</a>
        </div>
      </div>

    </div>
  </section><!-- End Hero Section -->

  <main id="main">


    <!-- ======= About Us Section ======= -->
    <section id="about" class="section-bg">
      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h3>About Us</h3>
          <p>Charectro is an Indian E-Commerce Company. Our company continuously keep updating the site as per the need of new trends. Start your journey of Shopping with us. We ensure you that it will be enjoyable.</p>
        </header>

        <div class="row justify-content-center">

          <div class="col-md-6 col-lg-5" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <div class="icon"><i class="bi bi-briefcase" style="color: #ff689b;"></i></div>
              <h4 class="title"><a href="">24X7 Customer Care Support</a></h4>
              <p class="description">The support executive will ensure speedy assistance so that your shopping experience is positive and enjoyable. </p>
            </div>
          </div>

          <div class="col-md-6 col-lg-5" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <div class="icon"><i class="bi bi-bar-chart" style="color: #3fcdc7;"></i></div>
              <h4 class="title"><a href="">SWIFT Delivery</a></h4>
              <p class="description"> Have you see our fastest delivery services? Log in to Charectro and Order now and Get the Fastest Delivery.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-5" data-aos="zoom-in" data-aos-delay="200">
            <div class="box">
              <div class="icon"><i class="bi bi-card-checklist" style="color: #e9bf06;"></i></div>
              <h4 class="title"><a href="">Offers</a></h4>
              <p class="description">  Dear Customer, You can shop during festive sales to get your hands on some unbelievable deals online. Login in now and save your handsome money.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-5" data-aos="zoom-in" data-aos-delay="200">
            <div class="box">
              <div class="icon"><i class="bi bi-binoculars" style="color:#41cf2e;"></i></div>
              <h4 class="title"><a href="">Easy Cancellation</a></h4>
              <p class="description">We know how the human mindset and choices changes from product to product. Don't worry here easy cancellation is available without any charges.</p>
            </div>
          </div>

        </div>

      </div>
    </section>
    <!-- End About Us Section -->

    <!-- ======= Team Section ======= -->
    <section id="team">
      <div class="container" data-aos="fade-up">
        <div class="section-header">
          <h3>Team</h3>
          <p>Meet some of our people as they share their interesting journey of growth and development of this site.</p>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6" data-aos="zoom-out" data-aos-delay="100">
            <div class="member">
              <img src="<c:url value="/resources/img/image.jpg" />" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>CE079</h4>
                  <h4>Preet Nandasana</h4>
                  <div class="social">
                    <a href=""><i class="bi bi-twitter"></i></a>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6" data-aos="zoom-out" data-aos-delay="200">
            <div class="member">
              <img src="<c:url value="/resources/img/image.jpg" />" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>CE095</h4>
                  <h4>Dhrasti Patel</h4>
                  <div class="social">
                    <a href=""><i class="bi bi-twitter"></i></a>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6" data-aos="zoom-out" data-aos-delay="300">
            <div class="member">
              <img src="<c:url value="/resources/img/image.jpg" />" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>CE111</h4>
                  <h4>Harsh Patelwala</h4>
                  <div class="social">
                    <a href=""><i class="bi bi-twitter"></i></a>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>

    </section>
    <!-- End Team Section -->

  </main>
  <!-- End #main -->

  <!-- Vendor JS Files -->
   <script src="<c:url value="/resources/vendor/aos/aos.js"/>"></script>  
  <script src="<c:url value="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
  
   <!-- Template Main JS File -->
  <script src="<c:url value="/resources/js/main.js"/>"></script>


</body>

</html>