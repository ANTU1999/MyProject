<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnet"%>
<%@page import="com.DAO.BookDAOImpi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewDetailsBook</title>
<%@ include file="all_component/allcss.jsp" %>

</head>
<body style="background-color:#f0f1f2">
<%@ include file="all_component/navbar.jsp" %>
<%
  int bid=Integer.parseInt(request.getParameter("bid"));
   BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
   BookDetails b5=dao.getBookByViewId(bid);
%>



	<div class="container p-3">

		<div class="row ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="Book/<%=b5.getPhotoName() %>" style="height: 100px; width: 100px"><br>
				<h4 class="ml-3">Book Name:<span class="text-success"><%=b5.getBookName() %></span></h4>
				<h4>Author Name: <span class="text-success"><%=b5.getAuthor() %></span></h4>
				<h4>Category :<span class="text-success"><%=b5.getBookCategory() %></span> </h4>

			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h4>Name: <%=b5.getBookName() %></h4>
				<% if("Old".equals(b5.getBookCategory())) 
				{%>
				<h5 class="text-success"> contact To Seller</h5>
				<h5 class="text-primary"><i class="far fa-envelope"></i>Email:<%=b5.getEmail() %></h5>
				<h4 class="text-primary">BookCondition:<%=b5.getBookCondition() %></h4>
				<%} %>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave-alt fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Book</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck fa-2x"></i>
						<p>Free Delevery</p>
					</div>

				</div>
				
				<% if("Old".equals(b5.getBookCategory())) 
				{%>
				 <div class="text-center">
				<a href="index.jsp" class="btn btn-warning"><i class="fas fa-cart-plus"></i>Shopping</a>
				<a href="#" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>
				</div>
				
				<%}else{ %>
				
				
				
				<div class="text-center">
				<a href="#" class="btn btn-success"><i class="fas fa-cart-plus"></i>Add Cart</a>
				<a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>
				</div>
				<%} %>
			</div>

		</div>
	</div>

</body>
</html>