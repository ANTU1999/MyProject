<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>

<%@page import="com.entity.User"%>
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
<title>User Old Book Setting</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f1f2f3;">
	<%@include file="all_component/navbar.jsp"%>

  

	<div class="container p-1">
		<h4 class="text-center text-success">Your sell Order</h4>
		
		<c:if test="${not empty suc }">
		 <p class="text-center text-succes">${suc}</p>
		 <c:remove var="suc" scope="session"/>
		 </c:if>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>

					<th scope="col">Book id</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			
			<tbody>
			<%
			User u=(User)session.getAttribute("userobj");
			String email=u.getEmail();
			BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
			List<BookDetails>list=dao.getBookByOldSell("Old",email);
			
			for(BookDetails b:list){%>
			
			<tr>
				<td ><%=b.getBookId() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getBookCategory() %>
				<td><a href="delete_old_book?ema=<%=email %>&&id1=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>


			</tr>
			
				
			<%} %>
			
			
			
			</tbody>
		</table>
	</div>


</body>
</html>