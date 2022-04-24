<%@page import="com.entity.PUser"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnet"%>
<%@page import="com.DAO.PUserDAOimpli"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>see All publisher</title>
<%@include file="allcss.jsp" %>
</head>
<body>

<%@include file="navbar.jsp" %>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">PRegNo</th>
      <th scope="col">PName</th>
      <th scope="col">PEmail</th>
      <th scope="col">PPhone</th>
      <th scope="col">pState</th>
      <th scope="col">PPin</th>
    </tr>
  </thead>
  <tbody>
  <% 
 PUserDAOimpli dao=new PUserDAOimpli(DBConnet.getCon());
  List<PUser> list3=dao.getAllPublisher();
  for(PUser p: list3){
  %>
  
  <tr>
      <td ><%=p.getPno() %></td>
      <td ><%=p.getPname() %></td>
      <td> <%=p.getPemail() %></td>
      <td> <%=p.getPphone() %></td>
      <td> <%=p.getPstate() %></td>
      <td> <%=p.getPpin() %></td>
      
      <td>
      <%-- <a href="../editbooks.jsp?id=<%=b.getBookId() %>"  class="btn btn-sm btn-warning"><i class="fas fa-edit"></i>Edit</a> --%>
      <a href="../deletebook?id=<%=p.getPno() %>" class="btn btn-sm btn-danger"><i class ="fas fa-trash-alt"></i>Delete</a>
      </td>
    </tr>
  
  
  <% 
  }
  %>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    
  </tbody>
</table>
</body>
</html>