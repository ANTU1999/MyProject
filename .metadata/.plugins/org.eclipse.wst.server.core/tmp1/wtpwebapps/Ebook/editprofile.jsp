<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile Page</title>
<%@include file="all_component/allcss.jsp" %>

</head>
<body style="background-color:#f7f7f7;">
<c:if test="${empty userobj }">
<c:redirect url="Login.jsp">
</c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %>

<div class="container">
<c:if test="${not empty userobj }">

<!-- <h3 class="text-center">Hello ${userobj.name }</h3> -->
</c:if>
<div class="row mt-3">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h5 class="text-center text-primary">Edit Profile page</h5>

	<c:if test="${not empty suc6 }">
				<p class="text-center text-success">${suc6}</p>
				<c:remove var="suc6" scope="session"/>
				</c:if>  
				<c:if test="${not empty failed6 }">
				<p class="text-center text-danger">${failed6}</p>	
					<c:remove var="failed6" scope="session"/>
				</c:if>




<form action="editprofile" method="post">
        
        
               <input type="hidden" value="${userobj.uid }" name="id">
				<div class="form-group">
				          
							<label for="exampleInputEmail1">Enter Full Name</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="fname" placeholder="Enter Name"required="required" value="${userobj.name }">
							
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email" placeholder="Enter email"required="required" value="${userobj.email }">
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Phone Number</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="phone" placeholder="Mobile Number"required="required" value="${userobj.phone }">
							
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								placeholder="Password" name="pass" required="required">
						</div>
						
						<button type="submit" class="btn btn-warning">Update</button>
						<button type="reset" class="btn btn-primary">Clear</button>
						
					</form>

</div>
</div>
</div>
</div>
</div>
<br><br><br><br>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>