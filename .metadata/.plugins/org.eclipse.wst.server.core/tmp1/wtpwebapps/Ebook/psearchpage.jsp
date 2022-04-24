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
<title>Search Book</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
<%
User u=(User)session.getAttribute("userobj");

%>

<%@ include file="all_component/navbar.jsp" %>

	<div class="container-fluid">
		<div class="row p-3">
		
		<%
		String ch7=request.getParameter("puuser");
		if(ch7.equals("user")){%>
		<%
		String ch8=request.getParameter("ch");
		BookDAOImpi dao5=new BookDAOImpi(DBConnet.getCon());
		 List<BookDetails> list8=dao5.getBookBySearch(ch8);
		 for(BookDetails b8:list8){
		%>
		
		<div class="col-md-3 mt-2">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b8.getPhotoName() %>"
							style="width: 50px; height: 80px" class="img-thumbnail">
						<p><%=b8.getBookName() %></p>
						<p>Author: <%=b8.getAuthor() %></p>
						
						<%
						if(b8.getBookCategory().equals("Old")){ %>
							
						<p>Categories: <%=b8.getBookCategory() %></p>
						<div class="row">
							<!--  <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> -->    
							 <a href="viewbook.jsp?bid=<%=b8.getBookId() %>" class=" btn btn-success btn-sm ml-2">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1 "><%=b8.getPrice() %></a>

						</div>
					
						<%}else{ %>
						
					
						
						<p>Categories: <%=b8.getBookCategory() %></p>
						<div class="row">
							<!--   <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> -->
							<%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
						    <%}else{ %>
							 
							 <a href="cartSer?bid=<%=b8.getBookId()%>&&uid=<%=u.getUid()%>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 <%} %>    
							 <a href="viewbook.jsp?bid=<%=b8.getBookId() %>" class=" btn btn-success btn-sm ">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm "><%=b8.getPrice() %></a>

						</div>
						<%} %>
					</div>
				</div>
			</div>
		
		
		<%} %>
		<%}else{ %>
		
		<%
		//String ch3=request.getParameter("puuser");
	   // String ch5=request.getParameter("puuser");
	   // out.println(ch5);
		String ch2=request.getParameter("ch");
		
		PBookDAOImpli dao1=new PBookDAOImpli(DBConnet.getCon());
		 List<PBookDetails> list4=dao1.getPBookBySearch(ch2);
		 for(PBookDetails b1:list4){
		%>
		
		<div class="col-md-3 mt-2">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b1.getpPhoto() %>"
							style="width: 50px; height: 80px" class="img-thumbnail">
						<p><%=b1.getpBookName() %></p>
						<p>Author: <%=b1.getpAuthorName() %></p>
						
					   <p>Language:<%=b1.getpBookLanguage() %></p>
						<div class="row ml-5" >
						 <p class="text-center">price:&nbsp;<span><%=b1.getPriceAfterDiscount() %></span>&nbsp;&nbsp;<span><del><%=b1.getpPrice() %></del></span>&nbsp; <span><%=b1.getAdminDiscount() %>%</span></p>
						   </div>
						    <%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>   
						     <a href="Login.jsp" class="btn btn-success btn-sm">View Details</a> 
						    <%}else{ %>
							 
							 <a href="pcartorder?bid=<%=b1.getpId()%>&&uid=<%=u.getUid()%>&&puserid=<%=b1.getpRegNo() %>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 
							 <a href="newviewbook.jsp?bid=<%=b1.getpId() %>" class=" btn btn-success btn-sm ">View Details</a> 
							 <%} %>
					</div>
				</div>
			</div>
		
		
	 <% } %> 
		
	<%} %>	
		
		
		</div>
	</div>


</body>
</html>