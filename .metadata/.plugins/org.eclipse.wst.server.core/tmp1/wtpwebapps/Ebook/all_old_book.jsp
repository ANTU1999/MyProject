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
<title>Old Book</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
<%@ include file="all_component/navbar.jsp" %>
<div class="container-fluid">
		<div class="row">
	
	 <%
			 BookDAOImpi dao3=new BookDAOImpi(DBConnet.getCon());
			 List<BookDetails> list5=dao3.getAllOldBook();
			 for(BookDetails b3 : list5){
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
							 
							  <a href="viewbook.jsp?bid=<%=b3.getBookId() %>"class="ml-5 btn btn-success btn-sm ml-1">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1"><%=b3.getPrice() %></a>
								
						</div>
					</div>
				</div>
			</div>
      <%} %>
			
	
	
	</div>
	</div>


</body>
</html>