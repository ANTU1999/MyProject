<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<div class="container-fluid" style="height:10px;background-color:#303f9f">
</div>
<div class="container-fluid p-3 bg-light">
<div class="row">
<div class="col-md-3 text-success">
<h3>
<i class="fas fa-book"></i>Online Books
</h3>
</div>
<!-- 
<div class="col-md-6">
<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>
-->

<div class="col-md-3 ">
<c:if test="${not empty userobj}">
 <a  class="btn btn-success text-white ">
 <i class="fas fa-user"></i>${ userobj.name }</a>
 <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white">
 <i class="fas fa-sign-in-alt" aria-hidden="true"></i>LogOut</a>

</c:if>
<c:if test="${empty userobj }">
<a href="../Login.jsp" class="btn btn-success"><i class="fas fa-sign-in-alt"></i>
Login</a>

<a href="../Register.jsp" class="btn btn-primary text-white"><i class="fa fa-registered" aria-hidden="true"></i>Register</a>
</c:if>

</div>
</div>
</div>
<!-- Logout frame code -->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="text-center">
        <h4>Do U want Logout</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
       <a href="../logout"  type="button" class="btn btn-primary text-white">Yes</a>
        </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
<!-- end logout modal -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
 <a class="navbar-brand" href="#"><i class="fa fa-home" aria-hidden="true"></i></a> 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
         
      </li>
      <li class="nav-item active">
      <a class="nav-link" href="Home.jsp">Profile <span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
   
    <form class="form-inline my-2 my-lg-0">
    <!--  
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      
      <button class="btn btn-light my-2 my-sm-0" type="submit"> <i class="fa fa-cog" aria-hidden="true"></i>Setting</button>
      <button class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa fa-phone-square-alt" ></i>Contact Us</button>
      -->
    </form>
  </div>
</nav>