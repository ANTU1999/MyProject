<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Publisher Registration</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
<%@ include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
				<div class="card-body">
				 <h4 class="text-center"><u>Publisher Registration From</u></h4>
				</div>
				<!-- 
				<c:if test="${not empty psuc1 }">
				<p class="text-center text-success">${psuc1}</p>
				<c:remove var="psuc1" scope="session"/>
				</c:if>  
				-->
				<c:if test="${not empty pfail1 }">
				<p class="text-center text-danger">${pfail1}</p>	
					<c:remove var="pfail1" scope="session"/>
				</c:if>
				<c:if test="${not empty pfail11 }">
				<p class="text-center text-danger">${pfail11}</p>
				<c:remove var="pfail11" scope="session"/>
				</c:if>
				
				 <form  action="pregister" method="post">
				<div class="form-group">
							<label for="exampleInputEmail1">Publisher Name</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="pname" placeholder="Publisher Name"required="required">
							
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">RegNo</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="regno" placeholder="Registration Number"required="required">
							
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email" placeholder="Enter email"required="required">
							
						</div>
						
						<div class="form-group">
						    
							<label for="exampleInputEmail1">Phone Number</label> <input
								type="number" class="form-control" id="txtPhoneNumber" 
								 name="phone"  placeholder="Mobile Number">
								
								</div>
						<div class="form-group">
							<label for="exampleInputEmail1">State:</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="state" placeholder="State Name"required="required">
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">City:</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="city" placeholder="Enter city"required="required">
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Pin:</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="pin" placeholder="Enter pin number"required="required">
							
						</div>
						
						
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								placeholder="Password" name="pass" required="required">
						</div>
						<div class="form-check">
							<input type="checkbox" name="check" class="form-check-input"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1"><a href="agreement.pdf" target="-blank">Agree Term & Condition</a> </label>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-primary">Clear</button>
						<a href="PLogin.jsp">If Already Account</a>
					</form>
				
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="all_component/footer.jsp" %>

</body>
</html>