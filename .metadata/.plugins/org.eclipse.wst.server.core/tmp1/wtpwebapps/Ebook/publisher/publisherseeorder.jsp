<%@page import="com.DAO.PuBookOrderDAOImpli"%>
<%@page import="com.entity.PUser"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnet"%>
<%@page import="com.DAO.BookOrderImpi"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Page</title>
<%@ include file="allcss.jsp" %>
</head>
<body style="background-color:#fof1f2;">


<%@ include file="navbar.jsp"%>

<div class="container p-1">
<h4 class="text-center text-success">Your Order </h4>
<table class="table table-striped mt-3">
<thead class="bg-primary text-white">
<tr>
<th scope="col">Order id</th>
<th scope="col">Name</th>
<th scope="col">Book Name</th>
<th scope="col">Author</th>
<th scope="col">Price</th>
<th scope="col">Payment Type</th>

</tr>
</thead>

<%
PUser pu=(PUser)session.getAttribute("puserobj");
PuBookOrderDAOImpli dao=new PuBookOrderDAOImpli(DBConnet.getCon());
List<BookOrder> blist=dao.pGetBook(pu.getPno());
for(BookOrder b:blist)
{%>


<tr>
<th scope="row"><%=b.getOrderid() %></th>
<th><%=b.getUsername() %></th>
<th><%=b.getBookname() %></th>
<th><%=b.getAuthor() %></th>
<th><%=b.getPrice() %></th> 

<th><%=b.getPayment() %></th>

</tr>
<%} %>
</table>
</div>

</body>
</html>