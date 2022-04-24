<%@page import="com.entity.PBookDetails"%>
<%@page import="com.DAO.PBookDAOImpli"%>
<%@page import="com.entity.PUser"%>
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
<title>publisher book</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f1f2f3;">
	<%@include file="navbar.jsp"%>

  

	<div class="container p-1">
		<h4 class="text-center text-success">Your sell Order</h4>
		
		<c:if test="${not empty suc }">
		 <p class="text-center text-succes">${suc}</p>
		 <c:remove var="suc" scope="session"/>
		 </c:if>
		 <c:if test="${not empty suc6 }">
		 <p class="text-center text-succes">${suc6}</p>
		 <c:remove var="suc6" scope="session"/>
		 </c:if>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>

					<th scope="col">Book id</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Language</th>
					<th scope="col">ISBN No</th>
					<th scope="col">Price</th>
					<th scope="col">Discount</th>
					<th scope="col">page</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			
			<tbody>
			
			
			<%
			PUser pu=(PUser)session.getAttribute("puserobj");
			String pnumber=pu.getPno();
			PBookDAOImpli dao3=new PBookDAOImpli(DBConnet.getCon());
			List<PBookDetails>list=dao3.getBookBySell(pnumber);
			
			for(PBookDetails b:list){%>
			
			<tr>
				<td ><%=b.getpId() %></td>
				<td><%=b.getpBookName() %></td>
				<td><%=b.getpAuthorName() %></td>
				<td><%=b.getpBookLanguage() %></td>
				<td><%=b.getpBookIsbn() %></td>
				<td><%=b.getpPrice() %></td>
				<td><%=b.getpDiscount() %></td>
				<td><%=b.getpPage() %>
				<td><a href="peditbook.jsp?pid1=<%=b.getpId() %>" class="btn btn-sm btn-warning">Edit</a>
				<a href="../pdeletebook?preg=<%=pnumber %>&&id1=<%=b.getpId() %>" class="btn btn-sm btn-danger">Delete</a></td>


			</tr>
			
				
			<%} %>
			
		
			
			</tbody>
		</table>
	</div>


</body>
</html>