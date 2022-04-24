<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:HOme</title>
<%@include file="allcss.jsp" %>
<style type="text/css">
a{
text-decoration:none;
color:green;
}
a:hover{
text-decoration:none;
color:black;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

    <c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"/>
    </c:if>
    
    
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
			<a href="add_books.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa fa-plus-square fa-3x text-primary" aria-hidden="true"></i><br>
						<h4>Add Book</h4>

					</div>
				</div>
				</a>
			</div>
			<!-- .............. -->
			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					    <div class="card-body text-center text-danger">
						<i class="fas fa-book-open fa-3x" aria-hidden="true"></i><br>
						<h4>All Book</h4>
   
					</div>
				</div>
				</a>
			</div>
			<!-- .............. -->
			<div class="col-md-3">
			<a href="order_books.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-cart-arrow-down fa-3x text-warning" aria-hidden="true"></i><br>
						<h4>OrderBook</h4>

					</div>
				</div>
				</a>
			</div>
			<!-- .............. -->
			<div class="col-md-3">
			<a href="p_allbook_see.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-sign-out-alt fa-3x" aria-hidden="true"></i><br>
						<h4>PAllBooks</h4>
                          
					</div>
				</div>
				</a>
			</div>
			
			<!-- .............. -->
			
			<div class="col-md-3 p-3">
			<a href="palluser.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-sign-out-alt fa-3x" aria-hidden="true"></i><br>
						<h4>AllPublisher</h4>
                          
					</div>
				</div>
				</a>
			</div>
			
		</div>
	</div>
	
	
		

  	
	



</body>
</html>