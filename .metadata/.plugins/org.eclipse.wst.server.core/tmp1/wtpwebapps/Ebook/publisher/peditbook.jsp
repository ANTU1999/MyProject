<%@page import="com.DB.DBConnet"%>
<%@page import="com.DAO.PBookDAOImpli"%>
<%@page import="com.entity.PBookDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile Page</title>
<%@include file="allcss.jsp" %>

</head>
<body style="background-color:#f7f7f7;">
<c:if test="${empty puserobj }">
<c:redirect url="PLogin.jsp">
</c:redirect>
</c:if>

<%@include file="navbar.jsp" %>

<div class="container">
<c:if test="${not empty puserobj }">

<!-- <h3 class="text-center">Hello ${userobj.name }</h3> -->
</c:if>
<div class="row mt-3">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h5 class="text-center text-primary">Edit Profile page</h5>

	

                    <% 
						//System.out.println(request.getParameter("pid1"));
						int id1=Integer.parseInt(request.getParameter("pid1"));
						PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
						PBookDetails b=dao.getBookById(id1);
						//System.out.println(b);
						
								
						%>


<form action="../peditprofile" method="post">
                              <input type="hidden" name="pid2" value="<%=b.getpId() %>">
                               <div class="form-gruop">
								<label for="exampleInputEmial1">Book Name</label> <input
									name="pbname2"value="<%=b.getpBookName() %>" type="text" class="form-control"
									id="exampleInputEmail1"required="required" aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Author Name</label> <input
									name="pauthor2" value="<%=b.getpAuthorName() %>" type="text" class="form-control"
									id="exampleInputEmail1" required="required"
									aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Book Language</label> <input
									name="pblan2" value="<%=b.getpBookLanguage() %>" type="text" class="form-control"
									id="exampleInputEmail1" required="required"
									aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Publish Year</label> <input
									name="pyear2" value="<%=b.getpBookYear() %>" type="text" class="form-control"
									id="exampleInputEmail1" required="required"
									aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Price</label> <input
									name="pprice2" value="<%=b.getpPrice() %>" type="number" class="form-control"
									id="exampleInputPassword1"required="required" aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Discount Price(%)</label> <input
									name="pdprice2" value="<%=b.getpDiscount() %>" type="number" class="form-control"
									id="exampleInputPassword1"required="required" aria-describedby="emailHelp" placeholder="not use % sign">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Book Page</label> <input
									name="ppage2" value="<%=b.getpPage() %>" type="number" class="form-control"
									id="exampleInputPassword1"required="required" aria-describedby="emailHelp">
							</div>
							<br>
							<button type="submit" class="btn btn-primary">Update</button>
							<button type="reset" class="btn btn-warning">Clear</button>
               
               </form>
						
						</div>
</div>
</div>
</div>
</div>
<br><br><br><br>
<%@ include file="footer.jsp" %>
</body>
</html>	




