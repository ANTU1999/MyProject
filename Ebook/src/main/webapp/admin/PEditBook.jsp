<%@page import="com.entity.PBookDetails"%>
<%@page import="com.DAO.PBookDAOImpli"%>
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
<c:if test="${empty userobj }">
<c:redirect url="Login.jsp">
</c:redirect>
</c:if>
<%@include file="navbar.jsp" %>
<br>
<br>
	<div class="container ">
		<div class="row ">
			<div class="col-md-4 offset-md-4 ">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Publisher Edit Book</h4>
						
					
				<c:if test="${not empty suc8 }">
				<p class="text-center text-success">${suc8 }</p>
				<c:remove var="suc8" scope="session"/>
				</c:if> 
				<c:if test="${not empty fall8 }">
				<p class="text-center text-primary">${fall8 }</p>
				</c:if>
				
						<% 
						//System.out.println(request.getParameter("pid1"));
						int id21=Integer.parseInt(request.getParameter("pid1"));
						PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
						PBookDetails b=dao.getBookById(id21);
						%>
								
						
					
						
						<form action="../pAdEditBook" method="post">
						<input type="hidden" name="pid3" value="<%=b.getpId() %>"> 
						<div class="form-gruop">
								<label for="exampleInputEmial1">PRegNo:</label> <input
									name="pregno3" value="<%=b.getpRegNo() %>" type="text" class="form-control"
									id="exampleInputEmail1" required="required" readonly="readonly"
									aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Book Name</label> <input
									name="pbname3"value="<%=b.getpBookName() %>" type="text" class="form-control"
									id="exampleInputEmail1"required="required" aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Author Name</label> <input
									name="pauthor3" value="<%=b.getpAuthorName() %>" type="text" class="form-control"
									id="exampleInputEmail1" required="required"
									aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Price</label> <input
									name="price3" value="<%=b.getpPrice() %>" type="number" class="form-control"
									id="exampleInputPassword1"required="required" aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Publisher Dicount Price(%)</label> <input
									name="dprice3" value="<%=b.getpDiscount() %>" type="number" class="form-control"
									id="exampleInputPassword1"required="required" aria-describedby="emailHelp" readonly="readonly">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Admin Discount Price(%)</label> <input
									name="adprice3" value="<%=b.getAdminDiscount()%>" type="number" class="form-control"
									id="exampleInputPassword1"required="required" aria-describedby="emailHelp">
							</div>
							<%-- 
							<div class="form-gruop">
								<label for="exampleInputEmial1">Admin  Price</label> <input
									name="adprice33" value="<%=b.getAdminDiscount()%>" type="number" class="form-control"
									id="exampleInputPassword1"required="required" aria-describedby="emailHelp">
							</div>
							--%>
							<div class="form-gruop">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="pstatus3" class="form-control">
									<%if("Active".equals(b.getpBookStatus())){ %>
									   <option value="Active">Active</option>
									<option value="InActive">InActive</option>
									   
									
									
									<%}else{ %>
									
									<option value="InActive">InActive</option>
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