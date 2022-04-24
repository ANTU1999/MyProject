<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Publisher setting page</title>

<%@include file="allcss.jsp" %>
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

<c:if test="${empty puserobj }">
<c:redirect url="../PLogin.jsp">
</c:redirect>
</c:if>
<%@include file="navbar.jsp" %>



<div class="container">

<c:if test="${not empty puserobj }">

<h3 class="text-center">Hello ${puserobj.pname }</h3>
</c:if>
<div class="row pl-5">


               <div class="col-md-4">
				<a href="PAddBook.jsp">
					<div class="card">
						<div class="card-body text-center">
						<i class="fas fa-edit fa-3x"></i>
						<h4>Add Book</h4>
						</div>
					</div>
				</a>

			</div>
<div class="col-md-4">
				<a href="allpublishbook.jsp">
					<div class="card">
						<div class="card-body text-center">
					   <div class="text-warning">
						<i class="fas fa-book-open fa-3x"></i>
						</div>
						<h4>All publish book</h4>
						</div>
					</div>
				</a>

			</div>
			
			
			
			
			<div class="col-md-4">
				<a href="peditprofile.jsp">
					<div class="card">
						<div class="card-body text-center">
						<i class="fas fa-edit fa-3x"></i>
						<h4>Edit Profile</h4>
						</div>
					</div>
				</a>

			</div>
			
			<!-- 
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
			-->
			<div class="col-md-4 mt-3">
				<a href="publisherseeorder.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-danger">
						<i class="fas fa-box-open fa-3x"></i>
						</div>
						<h4> Order details</h4>
						<p>see order details</p>
						</div>
					</div>
				</a>

			</div>
			
			<div class="col-md-4 mt-3">
				<a href="../helpline.jsp">
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
			
					<div class="col-md-4 mt-3">
				<a href="logout.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-primary">
						<i class="fas fa-user-circle fa-3x"></i>
						</div>
						<h4>Logout </h4>
						<p>-------------</p>
						</div>
					</div>
				</a>

			</div>
</div>
</div>

<br><br><br><br><br><br><br>
<%@ include file="footer.jsp" %>
</body>
</html>