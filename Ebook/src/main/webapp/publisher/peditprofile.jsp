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

	<c:if test="${not empty suc7 }">
				<p class="text-center text-success">${suc7}</p>
				<c:remove var="suc7" scope="session"/>
				</c:if>  
				<c:if test="${not empty fall7 }">
				<p class="text-center text-danger">${fall7}</p>	
					<c:remove var="fall7" scope="session"/>
				</c:if>




            <form action="../updateprofile" method="post">
        
        
               <input type="hidden" value="${puserobj.pid }" name="pid3">
				<div class="form-group">
				          
							<label for="exampleInputEmail1">Publisher Name:</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="pname3" placeholder="Enter Name"required="required" value="${puserobj.pname }">
							
						</div>
						<div class="form-group">
						<label for="exampleInputEmail1">Publisher RegNO:</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="pregno3" placeholder=""required="required" readonly="readonly" value="${puserobj.pno }">
							
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="pemail3" placeholder="Enter email"required="required" value="${puserobj.pemail }">
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Phone Number</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="pphone3" placeholder="Mobile Number"required="required" value="${puserobj.pphone }">
							
						</div>
						<div class="form-group">
						<label for="exampleInputEmail1">State:</label>
						<input type="text" class="form-control" id="something" aria-describedby="help" name="pstate3" required="required" value="${puserobj.pstate }">
						</div>
						<div class="form-group">
						<label for="exampleInputEmail1">City:</label>
						<input type="text" class="form-control" id="something" aria-describedby="help" name="pcity3" required="required" value="${puserobj.pcity }">
						</div>
						<div class="form-group">
						<label for="exampleInputEmail1">Pin:</label>
						<input type="text" class="form-control" id="something" aria-describedby="help" name="ppin3" required="required" value="${puserobj.ppin }">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								placeholder="Password" name="ppass3" required="required">
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
<%@ include file="footer.jsp" %>
</body>
</html>