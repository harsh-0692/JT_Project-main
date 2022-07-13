<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page isELIgnored="false" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New/Edit Category</title>

<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>


<link href="<c:url value="/resources/css/style2.css"/>" rel="stylesheet">
	

</head>
<body>
	<nav class="sidebar close">
        <header>
            <div class="image-text">
                <span class="image">
                    <img src="<c:url value="resources/img/logo.png"/>" alt="">
                </span>

                <div class="text logo-text">
                    <span class="name" style="color:orange;font-size:30px;">Charectro</span>
                    
                </div>
            </div>

            <i class='toggle'></i>
        </header>

        <div class="menu-bar">
            <div class="menu">

              

                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="category">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">Categories</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="product">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">Products</span>
                        </a>
                    </li>
                     <li class="nav-link">
                        <a href="Users">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">Users</span>
                        </a>
                    </li>

                    

                    
                </ul>
            </div>

            <div class="bottom-content">
                <li class="">
                    <a href="logout">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>

                
                
            </div>
        </div>

    </nav>

    <section class="home">
     
      <div align="center">
        <h1>New/Edit Category</h1>
        <form action="savecategory" method="post">
        <table>
            
            <tr>
                <td>Name:</td>
                <td><input name="name" /></td>
              
            </tr>
            
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        </table>
        </form>
    </div>
   
       
    </section>
    
    

</body>
</html>