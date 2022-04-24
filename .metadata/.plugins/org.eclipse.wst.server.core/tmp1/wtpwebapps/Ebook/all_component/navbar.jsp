<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

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
<div class="col-md-6">
<form class="form-inline my-2 my-lg-0" action="psearchpage.jsp" method="post">
      <div>
                Select One:<select name="puuser">
                    <option></option>
                    <option value="puser">NewBookSearch</option>
                    <option value="user">OldBookSearch</option>
                    
                </select>
            </div>
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"name="ch">
      <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>

<c:if test="${not empty userobj}">

<div class="col-md-3">

 <a href="checkout.jsp"> 
  <i class="fas fa-cart-plus fa-2x ml-2"></i></a>
  
<a href="Login.jsp" class="btn btn-success"><i class="fas fa-sign-in-alt"></i> ${userobj.name}</a>

<a href="logout" class="btn btn-primary text-white"><i class="fa fa-registered" aria-hidden="true"></i>Logout</a>
</div>
</c:if>

<c:if test="${empty userobj}">
<div class="col-md-3">
<a href="Login.jsp" class="btn btn-success"><i class="fas fa-sign-in-alt"></i>Login</a>
<a href="Register.jsp" class="btn btn-primary text-white"><i class="fa fa-registered" aria-hidden="true"></i>Register</a>
</div>
</c:if>



</div></div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
 <a class="navbar-brand" href="#"><i class="fa fa-home" aria-hidden="true"></i></a> 
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <!-- 
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      -->
      <!-- 
      Use for drop down menu
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      -->
      <li class="nav-item active"><a class="nav-link" href="all_old_book.jsp"><i class="fa fa-book" aria-hidden="true"></i>Old Book</a></li>
      <li class="nav-item active"><a class="nav-link" href="all_new_book.jsp"><i class="fa fa-book" aria-hidden="true"></i>New Book</a></li>
      <li class="nav-item active"><a class="nav-link" href="all_recent_book.jsp">Recent Book</a></li>
      <!--  <li> <a class="nav-link disabled" href="PLogin.jsp">AddBook</a> -->
       
      <li class="nav-item active"><a class="nav-link" href="PLogin.jsp">AddBook</a></li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <!--  
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      -->
      <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"> <i class="fa fa-cog" aria-hidden="true"></i>User Setting</a>
      <a href="#" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa fa-cog" aria-hidden="true"></i>Contract</a>
    </form>
     
  </div>
</nav>