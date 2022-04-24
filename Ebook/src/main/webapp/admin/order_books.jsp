<%@page import="com.DAO.BookOrderImpi"%>
<%@page import="com.entity.BookOrder"%>
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
<title>Order</title>
<%@include file="allcss.jsp" %>
</head>
<body>

<c:if test="${empty userobj }">
<c:redirect url="Login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>
<h3 class="text-center">Hello Admin</h3>

<table class="table table-striped">
  <thead class="bg-prmary ">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">ph no</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment type</th>
    </tr>
  </thead>
  <tbody>
  <%
 BookOrderImpi dao=new BookOrderImpi(DBConnet.getCon());
 List<BookOrder> blist=dao.getAllBookOrder();
 for(BookOrder b:blist){%>
  
    <tr>
      <th scope="row"><%=b.getOrderid() %></th>
      <td><%=b.getUsername() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFulladd() %></td>
      <td><%=b.getPhone() %></td>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
       <td><%=b.getPrice() %></td> 
     <%-- <td><%=b.getPriceAfterDiscount() %>--%>
      <td><%=b.getPayment() %></td>
      
      
    </tr>
    <%} %>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>Mark</td>
      <td>Otto</td>
      
      
    </tr>
   
  </tbody>
</table>
<div style="margin-top:250px;">
<%@include file="footer.jsp" %>
</div>
</body>
</html>