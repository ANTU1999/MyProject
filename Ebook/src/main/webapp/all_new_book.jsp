<%@page import="com.entity.PBookDetails"%>
<%@page import="com.DAO.PBookDAOImpli"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnet"%>
<%@page import="com.DAO.BookDAOImpi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Book</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
<%
User u=(User)session.getAttribute("userobj");

%>
<%@ include file="all_component/navbar.jsp" %>

<c:if test="${not empty sucMsg }">
<p class="text-center text-success">${sucMsg}</p>	
	<c:remove var="sucMsg" scope="session"/>
	</c:if>
		<c:if test="${not empty failed }">
				<p class="text-center text-danger">${failed}</p>	
					<c:remove var="failed" scope="session"/>
				</c:if>

<div class="container-fluid">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			
			 <%
			 PBookDAOImpli da=new PBookDAOImpli(DBConnet.getCon());
			 List<PBookDetails> list5=da.getPAllNewBook();
			 // BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
			 //List<BookDetails> list3=dao.getNewBook();
			// for(BookDetails b : list3){
				for(PBookDetails b:list5)
				
				{
				
					
				%>
				<div class="col-md-3">
				 <div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="SomeWrong" src="Book/<%=b.getpPhoto() %>"
							style="width: 90px; height: 100px" class="img-thumbnail">
						<p><%=b.getpBookName() %></p>
						<p>Author: <%=b.getpAuthorName() %></p>
						<p>Language:<%=b.getpBookLanguage() %></p>
						<div class="row ml-5" >
						 <p class="text-center">price:&nbsp;<span><%=b.getPriceAfterDiscount() %></span>&nbsp;&nbsp;<span><del><%=b.getpPrice() %></del></span>&nbsp; <span><%=b.getAdminDiscount() %>%</span></p>
						   </div>
						    <%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>   
						     <a href="Login.jsp" class="btn btn-success btn-sm">View Details</a> 
						    <%}else{ %>
							 
							 <a href="pcartorder?bid=<%=b.getpId()%>&&uid=<%=u.getUid()%>&&puserid=<%=b.getpRegNo() %>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 
							 <a href="newviewbook.jsp?bid=<%=b.getpId() %>" class=" btn btn-success btn-sm ">View Details</a> 
							 <%} %>
							 <!-- <a href="#" class="btn btn-danger btn-sm "><i class="fas fa-rupee-sign"></i> <%=b.getpPrice() %></a> -->

						
					</div>
				</div>
				 
				</div>
				 
			<%
			} 
			%>			 

</div>
</div>

 
<%-- <div class="container-fluid">
		<div class="row">
		  <%
			 BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
			 List<BookDetails> list3=dao.getAllNewBook();
			 for(BookDetails b : list3){
				%>
				<div class="col-md-3">
				 <div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="SomeWrong" src="Book/<%=b.getPhotoName() %>"
							style="width: 50px; height: 100px" class="img-thumbnail">
						<p><%=b.getBookName() %></p>
						<p>Author: <%= b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
						<div class="row">
						
						<%if(u==null){ %>
						    
						    <a href="Login.jsp" class="  btn btn-danger btn-sm ml-4 "><i class="fas fa-cart-plus"></i>Add Cart</a>     
						    <%}else{ %>
							 
							 <a href="cartSer?bid=<%=b.getBookId()%>&&uid=<%=u.getUid()%>"  class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 <%} %>
						 
							<a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>    
							 <a href="viewbook.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ">View Details</a> 
							 </div>
							 <a	href="#" class="btn btn-danger btn-sm "><i class="fas fa-rupee-sign"></i> <%=b.getPrice() %></a>

						
					</div>
				</div>
				 
				</div> 
				 
			<%
			} 
			%>			 
		
		
		</div>
		</div> --%>
	

</body>
</html>