<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>setting page</title>

<%@include file="all_component/allcss.jsp" %>
<style type="text/css">
a{
text-decoration: none;
color: black;
}
a:hover{
text-decoration: none;
}
</style>


</head>
<body style="background-color:#f7f7f7;">

<c:if test="${empty userobj }">
<c:redirect url="Login.jsp">
</c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %>



<div class="container">
<c:if test="${not empty userobj }">

<h3 class="text-center">Hello ${userobj.name }</h3>
</c:if>
<div class="row pl-5">
<div class="col-md-4">
				<a href="sellbook.jsp">
					<div class="card">
						<div class="card-body text-center">
					   <div class="text-warning">
						<i class="fas fa-book-open fa-3x"></i>
						</div>
						<h4>Sell old book</h4>
						</div>
					</div>
				</a>

			</div>
			
			
			<div class="col-md-4">
				<a href="oldbooksellsetting.jsp">
					<div class="card">
						<div class="card-body text-center">
					   <div class="text-warning">
						<i class="fas fa-book-open fa-3x"></i>
						</div>
						<h4>old book</h4>
						</div>
					</div>
				</a>

			</div>
			
			<div class="col-md-4">
				<a href="editprofile.jsp">
					<div class="card">
						<div class="card-body text-center">
						<i class="fas fa-edit fa-3x"></i>
						<h4>Edit Profile</h4>
						</div>
					</div>
				</a>

			</div>
			
			
			<div class="col-md-4 mt-3">
				<a href="useraddress.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-primary">
						<i class="fas fa-map-marker-alt fa-3x"></i>
						</div>
						<h4>Address</h4>
						<p>Edit Address</p>
						</div>
					</div>
				</a>

			</div>
			
			<div class="col-md-4 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-danger">
						<i class="fas fa-box-open fa-3x"></i>
						</div>
						<h4>My Order</h4>
						<p>Track your order</p>
						</div>
					</div>
				</a>

			</div>
			
			<div class="col-md-4 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-primary">
						<i class="fas fa-user-circle fa-3x"></i>
						</div>
						<h4>Help </h4>
						<p>24*7 service</p>
						</div>
					</div>
				</a>

			</div>
</div>
</div>

<br><br><br><br><br><br><br>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>