<%@page import="com.entity.PBookDetails"%>

<%@page import="com.entity.PCart"%>

<%@page import="com.DAO.PCartDAOImpli"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnet"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
 <%@ include file="all_component/navbar.jsp"%>
 
 <c:if test="${empty userobj }">
 <c:redirect url="Login.jsp"></c:redirect>
 </c:if>
 
 <c:if test="${not empty suc}">
 <div class="alert alert-danger" role="alert">
  ${suc}
</div>
<c:remove var="suc" scope="session" />
 </c:if>
 <c:if test="${not empty failed}">
 <div class="alert alert-danger" role="alert">
  ${failed }
</div>
<c:remove var="failed" scope="session" />
 </c:if>
  <c:if test="${not empty failed12}">
 <div class="alert alert-danger text-center" role="alert">
  ${failed12 }
</div>
<c:remove var="failed12" scope="session" />
 </c:if>
  <c:if test="${not empty failed123}">
 <div class="alert alert-danger text-center" role="alert">
  ${failed123 }
</div>
<c:remove var="failed123" scope="session" />
 </c:if>
 
 <c:if test="${not empty failed1234}">
 <div class="alert alert-danger text-center" role="alert">
  ${failed1234 }
</div>
<c:remove var="failed1234" scope="session" />
 </c:if>
 
 <div class="container">
 <div class="row ">
 <div class="col-md-6">
 
 
 <!-- Add to cart table  -->
 <div class="card bg-white">
 <div class="card-body">
 
 <h3 class="text-center text-success">Your Selected Item</h3>
 
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">BookName</th>
      <!-- <th scope="col">PregNo</th> -->
      <th scope="col">Author</th> 
     <!--  <th scope="col">OrPrice</th> -->
     <!--  <th scope="col">pubPrice</th> -->
      <th scope="col">BookPrice</th> 
      <!-- <th scope="col">AdminDiscount</th>  -->
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
 <%--  <%
  User u=(User)session.getAttribute("userobj");
  CartDAOImpl dao=new CartDAOImpl(DBConnet.getCon());
 List<Cart> cart= dao.getBookByUser(u.getUid());
 Double totalprice=0.0;
 
 for(Cart c:cart){
 totalprice=c.getTotalPrice();
 %>
 <tr>
      <th scope="row"><%=c.getBid()%></th>
      <td><%=c.getBookName() %></td>
      <td><%=c.getAuthor() %></td>
      <td><%=c.getPrice()%></td>
      <td>
      <a href="remove_book?cid=<%=c.getCid() %>&&bid=<%=c.getBid() %>&&uid=<%=c.getUserId() %>" class="btn btn-danger">Delete</a>
      </td>
    </tr>
 
 
 
 <%} %> --%>
    <%
   
  User u=(User)session.getAttribute("userobj");
  PCartDAOImpli dao=new PCartDAOImpli(DBConnet.getCon());
  
 List<PCart> pcart1= dao.getPBookByUser(u.getUid());
 Double totalprice=0.0;
 PBookDetails pb=new  PBookDetails();
 /*out.println(pb.getPricePublisherDiscount()); */
 for(PCart c:pcart1){
 totalprice=c.getpTotalPrice();
 /*  PBookDetails pb=new  PBookDetails(); 
  out.println(pb.getPriceAfterDiscount1()); */
 %>
 <tr>
      <td><%=c.getPbid() %> </td>
      <td><%=c.getpBookName() %></td> 
       <%-- <td><%=c.getPregNo() %></td>  --%>
      <td><%=c.getpAuthor() %></td>
      <%-- <td><%=c.getOriginalPrice() %> --%>
      <%-- <td><%=c.getpPrice() %></td>  --%>
    <%--  <td><%=pb.getPricePublisherDiscount() %></td>  --%>
      
       <%-- <td><%=c.getaDiscount() %> --%>  
       <td><%=c.getPriceAfterDiscount3() %></td> 
      <%--  <td><%=pb.getPriceAfterDiscount() %></td>  --%>
      <%-- <td><%=c.getCartPriceAfterDiscount() %></td>  --%>
      <td>
      <a href="remove_book?cid=<%=c.getPcid() %>&&bid=<%=c.getPbid() %>&&uid=<%=c.getUuserId() %>" class="btn btn-danger">Delete</a> 
      </td>
    </tr>
 
 
 
 <%} %> 
    <tr>
    <td>Total Price</td>
    <td></td>
    <td></td>
    <td></td>
    <td><%=totalprice %></td>
    </tr>
   
  </tbody>
</table>
 
 </div>
 
 </div>
 
 </div>
 

 
 <div class="col-md-6">
 <div class="card">
 
 <div class="card-body">
 <h1 class="text-center">Your details order</h1>
 
 <form action="order" method="post">
  <input type="hidden" value="${userobj.uid }" name="oid">
 <%--  <input type="text" value="${PCart.pregNo }" name="pregno"> --%>
 
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4" name="oname" value="<%=u.getName()%>"readonly="readonly">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">email</label>
      <input type="email" class="form-control" id="inputPassword4" name="oemail" value="<%=u.getEmail() %>" readonly="readonly" >
    </div>
  </div>
 
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Phone Number*</label>
      <input type="number" class="form-control" id="inputEmail4" required name="ophone" value="<%=u.getPhone() %>">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Address*</label>
      <input type="text" class="form-control" id="inputPassword4" name="oaddress" required >
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">LandMark*</label>
      <input type="text" class="form-control" id="inputEmail4" name="olandmark" required >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">city*</label>
      <input type="text" class="form-control" id="inputPassword4" name="ocity" required >
    </div>
  </div>

  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">state*</label>
      <input type="text" class="form-control" id="inputEmail4" placeholder="State" name="ostate" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Pin*</label>
      <input type="number" class="form-control" id="inputPassword4" name="opin" required>
    </div>
  </div>
  
  <div class="form-group">
  <label>Payment Mode</label>
  <select class="form-control" name="payment">
  <option value="noselect">select</option>
  <option value="COD">Cash On Delivery</option>
  <option value="CARD">BY Card </option>
  </select>
  
  </div>
  <div class="text-center">
  <button class="btn btn-warning">Order Now</button>
  <a href="index.jsp" class="btn btn-danger">Continue Shoping</a>
  </div>
  </form>
 
 </div>
 </div>
 
 </div>
 
 </div>
 </div>
 
 
</body>
</html>