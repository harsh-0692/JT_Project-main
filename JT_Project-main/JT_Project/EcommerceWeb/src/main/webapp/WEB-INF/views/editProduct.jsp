<%@page import="project.models.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List"
 %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page isELIgnored="false" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Form</title>
</head>
	<link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	
	

<link href="<c:url value="/resources/css/style2.css"/>" rel="stylesheet">


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
       <%
		response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
		String mail = (String)session.getAttribute("email");
		if(mail==null)
		{
			response.sendRedirect("");
		}
		
	%>
		<h3 id="name">
    	<i class="fas fa-user"></i><b><%out.write("  Hello "+mail); %></b>  
	    </h3>
	    <br>
  
      <center> 
    <form action="updateproduct" method="post">
    
		<table>
		<tr>
		<td>Name</td> <td><input type="text" name="pname" value="${product.pname}"/></td>
		</tr>
		
		<tr>
		<td>Description</td> <td><input type="text" name="description" value="${product.description}"/></td>
		</tr>
		
		<tr>
		<td>Image: </td><td><input type="text" name="image" value="${product.photo}"/></td>
		</tr>
		
		<tr>
		<td>Mrp: </td><td><input type="text" name="mrp" value="${product.mrp}"/></td>
		</tr>
		
		<tr>
		<td>Price: </td><td><input type="text" name="price" value="${product.price}"/></td>
		</tr>
		
		<tr>
		<td>Quantity: </td><td><input type="text" name="quantity" value="${product.quantity}"/></td>
		</tr>
		
		<tr>
		<td>Discount: </td><td><input type="text" name="discount" value="${product.discount}"/></td>
		</tr>
			<tr>
	<td><input type="text" name="pid" value="${product.pid}" hidden/></td>
		</tr>
		<br>
		<br>
		
		<tr>
		<td>Description</td>
		<% 
				Object category = session.getAttribute("categories");
				List<Category> cat;					
				cat=(List<Category>)category;
		%>
				<td><select name="category">
				<%
				for(Category c :cat)
				{
				%>
				
					<option value="<%= c.getName() %>"><%= c.getName() %></option>
				
		<%
				}
				
				
		%>
				</select></td>	
		</tr>
		
		<tr colspan="2">
		<td>
		<input type="submit" value="Submit" />
		</td>
		<td>
		</td>
		</tr>
	</form>
	</table>
        
       
    </section>
    
    
	
	</center> 
	
	
	
</body>
</html>