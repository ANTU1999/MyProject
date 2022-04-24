<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OrderSuccessPage</title>
<%@include file="all_component/allcss.jsp" %> 
</head>
<body style="background-color:#f7f7f7;">
<%@include file="all_component/navbar.jsp" %> 

<div class="container text-center mt-3">
<i class="fas fa-check-circle fa-5x text-success"></i>
<h1>Thank You</h1>
<h2>Your Order Successfully Done</h2>
<h4>As Soon As Possible Your Product will be delivered in Your Address </h4>
<a href="index.jsp" class="btn btn-warning mt-3">Home</a>
<a href="order.jsp" class="btn btn-success mt-3">ViewOrder</a>
</div>

</body>
</html>