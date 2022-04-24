<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User address</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body style="background-color:#fof1f2;">
<%@ include file="all_component/navbar.jsp"%>
<div class="container">
<div class="row p-3">
<div class="col-md-6 offset-md-4">
<div class="card">
<div class="card-body">
<h5 class="text-center text-success">Add Address</h5>
<form action="">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputpassword">Address</label>
									<input type="text" class="form-control" id="inputPassword">
								</div>
								
								<div class="form-group col-md-6">
									<label for="inputpassword">LandMark</label>
									<input type="text" class="form-control" id="inputPassword">
								</div>
								
								<div class="form-group col-md-6">
									<label for="inputpassword">city</label>
									<input type="text" class="form-control" id="inputPassword">
								</div>
								<div class="form-group col-md-6">
									<label for="inputpassword">state</label>
									<input type="text" class="form-control" id="inputPassword">
								</div>
								<div class="form-group col-md-6">
									<label for="inputpassword">pin</label>
									<input type="number" class="form-control" id="inputPassword">
								</div>
							</div>
							
							<div class="text-center">
							<button class="btn btn-warning text-black">Add Address</button>
							</div>
							
							
</form>

  
</div>
</div>
</div>
</div>
</div>

</body>
</html>