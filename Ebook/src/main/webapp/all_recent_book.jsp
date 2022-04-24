<%@page import="com.entity.PBookDetails"%>
<%@page import="com.DAO.PBookDAOImpli"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnet"%>
<%@page import="com.DAO.BookDAOImpi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recent Book</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
<%
User u=(User)session.getAttribute("userobj");

%>

<%@ include file="all_component/navbar.jsp" %>
<%--
	<div class="container-fluid">
		<div class="row p-3">
		
<%-- 		
		 <%
		BookDAOImpi dao1=new BookDAOImpi(DBConnet.getCon());
		 List<BookDetails> list6=dao1.getAllRecentBook();
		 for(BookDetails b1:list6){
		%>
		
		<div class="col-md-3 mt-2">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b1.getPhotoName() %>"
							style="width: 50px; height: 80px" class="img-thumbnail">
						<p><%=b1.getBookName() %></p>
						<p>Author: <%=b1.getAuthor() %></p>
						
						<%
						if(b1.getBookCategory().equals("Old")){ %>
							
						<p>Categories: <%=b1.getBookCategory() %></p>
						<div class="row">
							<!--  <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> -->    
							 <a href="viewbook.jsp?bid=<%=b1.getBookId() %>" class=" btn btn-success btn-sm ml-2">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1 "><%=b1.getPrice() %></a>

						</div>
					
						<%}
						else{ %>
						
					
						
						<p>Categories: <%=b1.getBookCategory() %></p>
						<div class="row">
							<!--  <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     -->
							<%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
						    <%}else{ %>
							 
							 <a href="cartSer?bid=<%=b1.getBookId()%>&&uid=<%=u.getUid()%>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 <%} %>
							 <a href="viewbook.jsp?bid=<%=b1.getBookId() %>" class=" btn btn-success btn-sm ">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm "><%=b1.getPrice() %></a>
                     <%} %> 
						
				</div>
			</div>
		
		       <% } %>
		 
		</div>
		</div> --%>
		
	<div class="container-fluid ">
	<div class="row p-3">
	
		<%

		
		PBookDAOImpli dao2=new PBookDAOImpli(DBConnet.getCon());
		 List<PBookDetails> list5=dao2.getPAllRecentBook();
		 for(PBookDetails pb1:list5){
		%>
		
		<div class="col-md-3 mt-2">
				<div class="card crd-ho">
					<div class="card-body text-center">
						
						<img alt="SomeWrong" src="Book/<%=pb1.getpPhoto() %>"
							style="width: 90px; height: 100px" class="img-thumbnail">
						<p><%=pb1.getpBookName() %></p>
						<p>Author: <%=pb1.getpAuthorName() %></p>
						
						<%
						if("NEW".equals("Old")){ %>
							
						<p>Language: <%=pb1.getpBookLanguage() %></p>
						<div class="row">
							<!--  <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> -->    
							 <a href="viewbook.jsp?bid=<%=pb1.getpId() %>" class=" btn btn-success btn-sm ml-2">View Details</a> 
							 <%-- <a	href="#" class="btn btn-danger btn-sm ml-1 "><%=b1.getPrice() %></a> --%>

						</div>
					
						<%}else{ %>
						
					
						
						<p>Language: <%=pb1.getpBookLanguage() %></p> 
						<div class="row ml-5" >
						 <p class="text-center">price:&nbsp;<span><%=pb1.getPriceAfterDiscount() %></span>&nbsp;&nbsp;<span><del><%=pb1.getpPrice() %></del></span>&nbsp; <span><%=pb1.getAdminDiscount() %>%</span></p>
						   </div>
						<div class="row">
							<!--  <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     -->
							<%-- <%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
						    <%}else{ %>
							 <a href="pcartorder?bid=<%=pb1.getpId()%>&&uid=<%=u.getUid()%>&&puserid=<%=pb1.getpRegNo() %>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> 
							 <a href="cartSer?bid=<%=pb1.getpId()%>&&uid=<%=u.getUid()%>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 <%} %>
							 <a href="viewbook.jsp?bid=<%=pb1.getpId() %>" class=" btn btn-success btn-sm ">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm "><%=b1.getPrice() %></a>
 --%>
                           
                           <%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> 
						    <a href="Login.jsp" class="btn btn-success btn-sm">View Details</a>    
						    <%}else{ %>
							 <a href="pcartorder?bid=<%=pb1.getpId()%>&&uid=<%=u.getUid()%>&&puserid=<%=pb1.getpRegNo() %>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> 
							 <%-- <a href="cartSer?bid=<%=pb1.getpId()%>&&uid=<%=u.getUid()%>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>      --%>
							  <a href="newviewbook.jsp?bid=<%=pb1.getpId() %>" class=" btn btn-success btn-sm ">View Details</a>
							 <%} %>
						</div>
						<%} %>
					</div>
				</div>
			</div>
		
		
		<% } %>
		 
		<!-- </div>
		</div> -->
		
		<!-- old book display -->
		<!-- <div class="container-fluid"> -->
		<!-- <h3 class="text-center">Old Book</h3> -->
		<!-- <div class="row"> -->
		
		 <%
			 BookDAOImpi dao3=new BookDAOImpi(DBConnet.getCon());
			/*  List<BookDetails> list4=dao3.getOldBook(); */
			List<BookDetails>list4=dao3.getAllOldBook();
			 for(BookDetails b3 : list4){
				%>
		
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b3.getPhotoName() %>"
							style="width: 90px; height: 100px" class="img-thumbnail">
						<p><%=b3.getBookName()%></p>
						<p>Author:<%=b3.getAuthor() %></p>
						<p>Categories:<%=b3.getBookCategory() %></p>
						<div class="row ">
							 
							 <a href="viewbook.jsp?bid=<%=b3.getBookId() %>" class="ml-5 btn btn-success btn-sm ml-1">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1">299</a>
								
						</div>
					</div>
				</div>
			</div>
      <%} %>
			
		</div>
		
		
		
		</div>
	


</body>
</html>