<%@page import="com.entity.User"%>
<%@page import="com.entity.PBookDetails"%>
<%@page import="com.DAO.PBookDAOImpli"%>
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
<!--  <h1>user class object</h1> -->
<%
User u=(User)session.getAttribute("userobj");

%>
<%
  int pbid=Integer.parseInt(request.getParameter("bid"));
   PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
   PBookDetails b6=dao.getPBookByViewId(pbid);
%>



	<div class="container p-3">

		<div class="row ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="Book/<%=b6.getpPhoto() %>" style="height: 100px; width: 100px"><br>
				<h4 class="ml-3">Book Name:<span class="text-success"><%=b6.getpBookName() %></span></h4>
				<h4>Author Name: <span class="text-success"><%=b6.getpAuthorName() %></span></h4>
				<h4>Book Language:<span class="text-success"><%=b6.getpBookLanguage() %></span> </h4>
				<h4><span class="text-success"><%=b6.getpBookDescription() %></span></h4>

			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h4>Book Name: <%=b6.getpBookName() %></h4>
				
				<h5 class="text-success"> Best site for purchase book</h5>
				<h5 class="text-primary"><i class="far fa-envelope"></i>Email:<%=b6.getpEmail() %></h5>
			
			
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
				
				
				
				
				
				<div class="text-center">
				<!-- <a href="pcartorder" class="btn btn-success"><i class="fas fa-cart-plus"></i>Add Cart</a> -->
				<a href="pcartorder?bid=<%=b6.getpId()%>&&uid=<%=u.getUid()%>&&puserid=<%=b6.getpRegNo() %>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> 
				<a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>
				</div>
				
			</div>

		</div>
	</div>

</body>
</html>