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

	<div class="container-fluid">
		<div class="row p-3">
		
		<%
		String ch2=request.getParameter("ch");
		BookDAOImpi dao1=new BookDAOImpi(DBConnet.getCon());
		 List<BookDetails> list4=dao1.getBookBySearch(ch2);
		 for(BookDetails b1:list4){
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
					
						<%}else{ %>
						
					
						
						<p>Categories: <%=b1.getBookCategory() %></p>
						<div class="row">
							<!--   <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> -->
							<%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
						    <%}else{ %>
							 
							 <a href="cartSer?bid=<%=b1.getBookId()%>&&uid=<%=u.getUid()%>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 <%} %>    
							 <a href="viewbook.jsp?bid=<%=b1.getBookId() %>" class=" btn btn-success btn-sm ">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm "><%=b1.getPrice() %></a>

						</div>
						<%} %>
					</div>
				</div>
			</div>
		
		
		<%} %>
		
		
		
		</div>
	</div>


</body>
</html>