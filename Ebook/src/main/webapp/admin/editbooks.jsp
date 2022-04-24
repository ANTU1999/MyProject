<%@page import="com.sun.org.apache.xml.internal.security.algorithms.implementations.IntegrityHmac.IntegrityHmacRIPEMD160"%>
<%@page import="com.entity.BookDetails"%>
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
<title>EditBook Page</title>
<%@include file="allcss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="navbar.jsp" %>
<br>
<br>
	<div class="container ">
		<div class="row ">
			<div class="col-md-4 offset-md-4 ">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>
						
						
						
						
						<% 
						System.out.println(request.getParameter("id"));
						int id=Integer.parseInt(request.getParameter("id"));
						BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
						BookDetails b=dao.getBookById(id);
						
								
						%>
						
						<form action="../add_books" method="post"
						enctype="multipart/form-data">
							<div class="form-gruop">
								<label for="exampleInputEmial1">Book Name</label> <input
									name="bname2"value="<%=b.getBookName() %>" type="text" class="form-control"
									id="exampleInputEmail1"required="required" aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Author Name</label> <input
									name="author2" value="<%=b.getAuthor() %>" type="text" class="form-control"
									id="exampleInputEmail1" required="required"
									aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Price</label> <input
									name="price2" value="<%=b.getPrice() %>" type="number" class="form-control"
									id="exampleInputPassword1"required="required" aria-describedby="emailHelp">
							</div>
							
							<div class="form-gruop">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<%if("Active".equals(b.getStatus())){ %>
									   <option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									   
									
									
									<%}else{ %>
									
									<option value="Inactive">Inactive</option>
                                    <option value="Active">Active</option>
                                     <%} %>
								</select>
							</div>

							

							<button type="submit" class="btn btn-primary">Update</button>
							<button type="reset" class="btn btn-warning">Clear</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
<div style="margin-top:50px;">
<%@include file="footer.jsp" %>
</div>
</body>
</html>