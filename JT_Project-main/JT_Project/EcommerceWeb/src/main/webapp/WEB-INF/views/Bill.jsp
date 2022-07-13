<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill Details</title>
<link href='http://fonts.googleapis.com/css?family=Ubuntu'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed'
	rel='stylesheet' type='text/css'>
<style>
.headerFont {
	font-family: 'Ubuntu', sans-serif;
	font-size: 24px;
}

.subFont {
	font-family: 'Raleway', sans-serif;
	font-size: 14px;
}

.specialHead {
	font-family: 'Oswald', sans-serif;
}

.normalFont {
	font-family: 'Roboto Condensed', sans-serif;
}

body {
	background-color: rgb(223, 222, 222);
}
</style>
</head>
<body>
<a class="nav-link scrollto" href="Logout">Log Out</a>
	<form id="form1">
		<div class="form-group">
			<table border="1" align=center>
				<tr>
					<td colspan="10">
						<h2 class="specialHead" align=center>
							Charectro
							</h1>
					</td>
				</tr>
				<tr>
					<td colspan="10">
						<p class="normalFont" align=center>
							<b>*****Thank You.. Visit Again*****</b>
						</p>
					</td>
				</tr>
				<tr>
					<td><label><strong>ID :</strong></label></td>
					<td colspan="3">${user.id}</td>
				</tr>
				<tr>
					<td><label><strong>Name :</strong></label></td>
					<td colspan="3">${user.name}</td>
				</tr>
				<tr>
					<td><label><strong>Email :</strong></label></td>
					<td colspan="3">${user.email}</td>
				</tr>
				<tr>
					<td><label><strong>Mobile Number :</strong></label></td>
					<td colspan="3">${user.mobile}</td>
				</tr>
				<tr>
					<td><label><strong>Address :</strong></label></td>
					<td colspan="3">${user.address}</td>
				</tr>
				<tr>
					<td><label><strong>Shipping Address :</strong></label></td>
					<td colspan="3">${user.shipping_address}</td>
				</tr>
				<tr>
					<td><label><strong>Registration Date :</strong></label></td>
					<td colspan="3">${user.lastlogin}</td>
				</tr>



				<tr>
					<td colspan="10">
						<h3 class="normalFont">Product Details</h3>


						<table>
							<thead>
								<tr>

									<th>Product</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${itemslist}">
									<tr>

										<td><center>
												<h5>${item.pname}</h5>
											</center></td>
										<td><center>
												<h5>${item.price}</h5>
											</center></td>
										<td><center>${item.quantity}</center></td>
										<td><center>
												<h5>${item.total}</h5>
											</center></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td><label><strong>Total Amount :</strong></label></td>
					<td colspan="3">${cart.total}</td>
					<td>
                        <center><button class="normalFont" type="button" onClick="window.print()"><strong>Print</strong></button>
                        </center>
                    </td>
				</tr>

			</table>
		</div>
	</form>
	
</body>
</html>