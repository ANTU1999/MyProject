<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sellbook page</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body style="background-color:#f7f7f7;">

<c:if test="${empty userobj }">
<c:redirect url="Login.jsp">
</c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %>

   <div class="container">
   <div class="row mt-3">
   <div class="col-md-4 offset-md-4">
   <div class="card">
   <div class="card-body">
   
     <h5 class="text-center">Sell Own Old Book </h5>
     <c:if test="${not empty succMsg3 }">
				        <p class="text-center text-success">${succMsg3}</p>	
					    <c:remove var="succMsg3" scope="session"/>
				        </c:if>
				        <c:if test="${not empty failedMsg }">
				        <p class="text-center text-danger">${failedMsg}</p>	
					    <c:remove var="failedMsg" scope="session"/>
				        </c:if>
   <form action="add_old_book" method="post"
						enctype="multipart/form-data">
						
						<input type="hidden" value="${userobj.email }" name="user">
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
								<label for="inputState">Book Condition</label> <select
									id="inputState" name="btype2" class="form-control">
									<option selected>select one</option>
									<option value="veryGood">Very Good</option>
									<option value="Good">Good</option>

								</select>
							</div>
						

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form.control.file"
									id="exampleFormCOntrolFile1"required="required">
							</div>

							<button type="submit" class="btn btn-primary">Sell</button>
							<button type="reset" class="btn btn-warning">Clear</button>
						</form>
   
   </div>
   </div>
   
   </div>
   </div>
   
   </div>


</body>
</html>