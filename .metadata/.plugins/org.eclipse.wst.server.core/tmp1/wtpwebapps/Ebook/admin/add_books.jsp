<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddBook Page</title>
<%@include file="allcss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"/>
    </c:if>
<br>
<br>
	<div class="container ">
		<div class="row ">
			<div class="col-md-4 offset-md-4 ">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Book</h4>
						<c:if test="${not empty succMsg3 }">
				        <p class="text-center text-success">${succMsg3}</p>	
					    <c:remove var="succMsg3" scope="session"/>
				        </c:if>
				        <c:if test="${not empty failedMsg }">
				        <p class="text-center text-danger">${failedMsg}</p>	
					    <c:remove var="failedMsg" scope="session"/>
				        </c:if>
						<form action="../add_books" method="post"
						enctype="multipart/form-data">
							<div class="form-gruop">
								<label for="exampleInputEmial1">Book Name</label> <input
									name="bname2" type="text" class="form-control"
									id="exampleInputEmail1"required="required" aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Author Name</label> <input
									name="author2" type="text" class="form-control"
									id="exampleInputEmail1" required="required"
									aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="exampleInputEmial1">Price</label> <input
									name="price2" type="number" class="form-control"
									id="exampleInputPassword1"required="required" aria-describedby="emailHelp">
							</div>
							<div class="form-gruop">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="btype2" class="form-control">
									<option selected>select one</option>
									<option value="New">New Book</option>

								</select>
							</div>
							<div class="form-gruop">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="bstatus2" class="form-control">
									<option selected>select one</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form.control.file"
									id="exampleFormCOntrolFile1"required="required">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
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