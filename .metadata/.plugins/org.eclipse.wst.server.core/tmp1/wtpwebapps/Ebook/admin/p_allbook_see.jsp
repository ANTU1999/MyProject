<%@page import="com.entity.PBookDetails"%>
<%@page import="com.DAO.PBookDAOImpli"%>

<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>publisher All Books</title>
<%@include file="allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"/>
    </c:if>
<h3 class="text-center">Hello Admin</h3>
<c:if test="${not empty suc8 }">
				<p class="text-center text-success">${suc8 }</p>
				<c:remove var="suc8" scope="session"/>
				</c:if>
				<c:if test="${not empty suc9 }">
				<p class="text-center text-success">${suc9 }</p>
				<c:remove var="suc9" scope="session"/>
				</c:if> 

<table class="table table-striped">
  <thead class="bg-prmary">
    <tr>
      <th scope="col">BookId</th>
      <th scope="col">RegNo</th>
      <%--<th scope="col">Email</th> --%>
      <th scope="col">BookName</th>
      <th scope="col">photo</th>
      <th scope="col">Author</th>
      <th scope="col">ISBN_No</th>
      <th scope="col">Price</th>
      <th scope="col">Discount</th>
      <th scope="col">PAmount</th>
      <th scope="col">ADiscount</th>
      <th scope="col">AdminAmount</th>
      <th scope="col">Avalable</th>
      <th scope="col">Status</th>
      <th></th>
      
      <th scope="col">Action</th>
     
    </tr>
  </thead>
  <tbody>
  
  <% 
  PBookDAOImpli dao= new PBookDAOImpli(DBConnet.getCon());
  List<PBookDetails> list=dao.getAllBooks();
  for(PBookDetails b: list){
  %>
  
   
  <tr>
   
      <td><%=b.getpId() %></td>
      <td><%=b.getpRegNo() %></td>
     <%-- <td><%=b.getpEmail() %></td>--%> 
      <td><%=b.getpBookName() %></td>
      <td><img src="../Book/<%=b.getpPhoto()%>" 
      style="width:50px;height:50px;"></td>
      <!-- <td><%=b.getpPhoto() %></td> -->
      <td><%=b.getpAuthorName() %></td>
      <td><%=b.getpBookIsbn() %></td>
      <td><%=b.getpPrice() %></td>
      <td><%=b.getpDiscount() %></td>
      <td><%=b.getPricePublisherDiscount() %></td>
      <td><%=b.getAdminDiscount() %></td>
       <%-- uses for admin after discount bookprice so call getPriceAfterDiscount() in pBookDetails.java  --%>
      <td><%=b.getPriceAfterDiscount() %> 
      <td>#</td>
      <td><%=b.getpBookStatus() %></td>
     
          
      <td>
          <td><a href="PEditBook.jsp?pid1=<%=b.getpId() %>" class="btn btn-sm btn-warning">Edit</a>
     
      <%--   <a href="PEditBook.jsp?id12<%=b.getpId() %>"  class="btn btn-sm btn-warning"><i class="fas fa-edit"></i>Edit</a> --%>
      
      </td>
      <td>
       <a href="../pADeleteBook?id=<%=b.getpId() %>" class="btn btn-sm btn-danger"><i class ="fas fa-trash-alt"></i>Delete</a>
      </td>
      
    </tr>
    
  
  
  <% 
  }
  %>
  
 
  
    
    
  </tbody>
</table>

<div style="margin-top:250px;">
<%@include file="footer.jsp" %>
</div>
</body>
</html>