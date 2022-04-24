<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body style="background-color:#fof1f2;">
   <%@ include file="all_component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row ml-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">
							<u>Login From</u>
						</h4>
					</div>
					<c:if test="${not empty failedMsg1 }">
				<p class="text-center text-danger">${failedMsg1}</p>	
					<c:remove var="failedMsg1" scope="session"/>
				</c:if>
				
				<c:if test="${not empty succMsg4 }">
				<p class="text-center text-success">${succMsg4}</p>	
					<c:remove var="succMsg4" scope="session"/>
				</c:if>
				
				
					<form action="plogin" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">PublisherRegistration</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="preg" placeholder="Enter Reg Number" required="required">

						</div>

						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								placeholder="Password" name="pass" required="required">
						</div>
						<div class="text-center">
                      <button type="submit" class="btn btn-primary">Login</button>
                      <button type="reset" class="btn btn-primary">Clear</button>
                     <br> <a href="RegPublisher.jsp">Create Account</a>
                     </div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>
	


<div style="margin-top:100px;">
<%@include file="all_component/footer.jsp" %>
</div>

</body>
</html>