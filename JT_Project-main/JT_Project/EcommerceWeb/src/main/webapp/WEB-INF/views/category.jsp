  <%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products List</title>

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
                            <span class="text nav-text">Category</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="product">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">Product</span>
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
  
		
      
    <div align="left">
		<h1>Category List</h1>
		
		<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
        </tr>
			<c:forEach var="category" items="${categorylist}">
				<tr>
				<td>${category.catId}</td>

					<td>${category.name}</td>
					
					<td><a href="editcategory?catid=${category.catId}">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="deletecategory?catid=${category.catId}">Delete</a></td>

				</tr>
			</c:forEach>
		</table>
		<h4>
			Add New Category <a href="addcategory">here</a>
		</h4>
	</div>
        
       
    </section>

</body>
</html>