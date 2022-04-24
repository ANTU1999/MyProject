<%@page import="com.entity.PBookDetails"%>
<%@page import="com.DAO.PBookDAOImpli"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpi"%>
<%@page import="com.DB.DBConnet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Index </title>
<%@include file="all_component/allcss.jsp" %>
<style type="text/css">
.back-img{
  background:url("image/1.jpg");
  height:50vh;
  width:100%;
  background-size:cover;
  background-repeat:no-repeat; 
}
.crd-ho:hover{
   background-color:#adbab1;
}
</style>
</head>
<body style="background-color:#f7f7f7;">
<!--  <h1>user class object</h1> -->
<%
User u=(User)session.getAttribute("userobj");

%>

<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid back-img">
<h2 class="text-center text-danger"> Online Books Management System</h2>
</div>
<!--  database connection check-->

 <% Connection conn=DBConnet.getCon();
   out.println(conn);
%> 

 
<hr>
<!--  Recent BOOK -->
	 <%-- <div class="container-fluid ">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
		<%
		BookDAOImpi dao1=new BookDAOImpi(DBConnet.getCon());
		 List<BookDetails> list4=dao1.getRecentBook();
		 for(BookDetails b1:list4){
		 %>
		
		<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b1.getPhotoName() %>"
							style="width: 50px; height: 100px" class="img-thumbnail">
						<p><%=b1.getBookName() %></p>
						<p>Author: <%=b1.getAuthor() %></p>
						
						<%
						if(b1.getBookCategory().equals("Old")){ %>
							
						<p>Categories: <%=b1.getBookCategory() %></p>
						
						<div class="row">
							<!--  <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> -->    
							 <a href="viewbook.jsp?bid=<%=b1.getBookId() %>" class=" btn btn-success btn-sm ml-2">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1 "><%=b1.getPrice() %></a>
                           
						</div>
					
						<%}else{ %>
						
					
						
						<p>Categories: <%=b1.getBookCategory() %></p>
						<div class="row">
						
						<%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>  
						    <a href="Login.jsp" class=" btn btn-danger btn-sm"> View Details</a>   
						    <%}else{ %>
							 
							 <a href="cartSer?bid=<%=b1.getBookId()%>&&uid=<%=u.getUid()%>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 
						
						
							  <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>  
							 <a href="viewbook.jsp?bid=<%=b1.getBookId() %>" class=" btn btn-success btn-sm ">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm "><%=b1.getPrice() %></a>
							<%} %>
						</div>
						<%} %>
					</div>
				</div>
			</div>
		
		
		<%} %>
		
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/java/java.png"
							style="width: 50px; height: 100px" class="img-thumbnail">
						<p>java Programming</p>
						<p>Anirban sinha</p>
						<p>Categories: New</p>
						<div class="row">
							 <a href="#" class=" btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 <a href="#" class=" btn btn-success btn-sm ml-1">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1">299</a>

						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/python/python1.png"
							style="width: 50px; height: 100px" class="img-thumbnail">
						<p>java Programming</p>
						<p>Anirban sinha</p>
						<p>Categories: New</p>
						<div class="row">
							 <a href="#" class=" btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 <a href="#" class=" btn btn-success btn-sm ml-1">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1">299</a>

						</div>
					</div>
				</div>
			</div>
			
			
		</div>
		
		<div class="text-center ml-1"><br>
		<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">More View</a>
          </div>
	</div> 
	 
	  --%>
	 
	 
  <div class="container-fluid ">
	<div class="row p-3">
	
		<%

		
		PBookDAOImpli dao2=new PBookDAOImpli(DBConnet.getCon());
		 /* List<PBookDetails> list7=dao2.getPAllRecentBook(); */
		 List<PBookDetails>list7=dao2.getPuNewBook();
		 for(PBookDetails pb1:list7){
		%>
		
		<div class="col-md-3 mt-2">
				<div class="card crd-ho">
					<div class="card-body text-center">
						
						<img alt="SomeWrong" src="Book/<%=pb1.getpPhoto() %>"
							style="width: 90px; height: 100px" class="img-thumbnail">
						<p><%=pb1.getpBookName() %></p>
						<p>Author: <%=pb1.getpAuthorName() %></p>
						
						<%
						if("NEW".equals("Old")){ %>
							
						<p>Language: <%=pb1.getpBookLanguage() %></p>
						<div class="row">
							<!--  <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> -->    
							<%--  <a href="viewbook.jsp?bid=<%=pb1.getpId() %>" class=" btn btn-success btn-sm ml-2">View Details</a> --%> 
							
							<!-- <a href="Login.jsp" class="btn btn-success btn-sm">View Details</a> -->
 
						</div>
					
						<%}else{ %>
						
					
						
						<p>Language: <%=pb1.getpBookLanguage() %></p> 
						<div class="row ml-5" >
						 <p class="text-center">price:&nbsp;<span><%=pb1.getPriceAfterDiscount() %></span>&nbsp;&nbsp;<span><del><%=pb1.getpPrice() %></del></span>&nbsp; <span><%=pb1.getAdminDiscount() %>%</span></p>
						   </div>
						<div class="row ml-5">
							<!--  <a href="#" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     -->
							<%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> 
						    <a href="Login.jsp" class="btn btn-success btn-sm">View Details</a>    
						    <%}else{ %>
							 <a href="pcartorder?bid=<%=pb1.getpId()%>&&uid=<%=u.getUid()%>&&puserid=<%=pb1.getpRegNo() %>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a> 
							 <%-- <a href="cartSer?bid=<%=pb1.getpId()%>&&uid=<%=u.getUid()%>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>      --%>
							  <a href="newviewbook.jsp?bid=<%=pb1.getpId() %>" class=" btn btn-success btn-sm ">View Details</a>
							 <%} %>
							 <%-- <a href="viewbook.jsp?bid=<%=pb1.getpId() %>" class=" btn btn-success btn-sm ">View Details</a>  --%>
							
						</div>
						<%} %>
					</div>
				</div>
			</div>
		
		
		<% } %>
		 
		<!-- </div>
		</div> -->
		
		<!-- old book display -->
		<!-- <div class="container-fluid"> -->
		<!-- <h3 class="text-center">Old Book</h3> -->
		<!-- <div class="row"> -->
		
		 <%
			 BookDAOImpi dao6=new BookDAOImpi(DBConnet.getCon());
			 List<BookDetails> list4=dao6.getOldBook();
			 for(BookDetails b3 : list4){
				%>
		
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b3.getPhotoName() %>"
							style="width: 90px; height: 100px" class="img-thumbnail">
						<p><%=b3.getBookName()%></p>
						<p>Author:<%=b3.getAuthor() %></p>
						<p>Categories:<%=b3.getBookCategory() %></p>
						<div class="row ">
							 
							 <a href="viewbook.jsp?bid=<%=b3.getBookId() %>" class="ml-5 btn btn-success btn-sm ml-1">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1">299</a>
								
						</div>
					</div>
				</div>
			</div>
      <%} %>
			
		</div>
		<div class="text-center ml-1"><br>
		<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">More View</a>
          </div>
		
		
		</div>
		
	
<!-- END RECENT BOOK -->
<hr>
<!--  New BOOK -->
	<div class="container-fluid">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			
			 <%
			// BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
			 //List<BookDetails> list3=dao.getNewBook();
			// for(BookDetails b : list3){
				PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
				List<PBookDetails> list5=dao.getPuNewBook();
				
				for(PBookDetails b:list5){
				
					
				%>
				
				<%-- <div class="col-md-3">
				 <div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="SomeWrong" src="Book/<%=b.getPhotoName() %>"
							style="width: 50px; height: 100px" class="img-thumbnail">
						<p><%=b.getBookName() %></p>
						<p>Author: <%= b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
						<div class="row">
						 <p>price:&nbsp;<span><%=b.getPrice() %></span>&nbsp;&nbsp;<span><del><%=b.getPrice() %></del></span>&nbsp; <span>10%</span></p>
						    <%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
						    <%}else{ %>
							 
							 <a href="cartSer?bid=<%=b.getBookId()%>&&uid=<%=u.getUid()%>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 <%} %>
							 <a href="viewbook.jsp?bid=<%=b.getBookId() %>" class=" btn btn-success btn-sm ">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm "><i class="fas fa-rupee-sign"></i> <%=b.getPrice() %></a>

						</div>
					</div>
				</div>
				 
				</div>  --%>
				
				<div class="col-md-3">
				 <div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="SomeWrong" src="Book/<%=b.getpPhoto() %>"
							style="width: 90px; height: 100px" class="img-thumbnail">
						<p><%=b.getpBookName() %></p>
						<p>Author: <%=b.getpAuthorName() %></p>
						<p>Language:<%=b.getpBookLanguage() %></p>
						<div class="row ml-5" >
						 <p class="text-center">price:&nbsp;<span><%=b.getPriceAfterDiscount() %></span>&nbsp;&nbsp;<span><del><%=b.getpPrice() %></del></span>&nbsp; <span><%=b.getAdminDiscount() %>%</span></p>
						   </div>
						   <p>Avalable : 10</p>
						    <%if(u==null){ %>
						    
						    <a href="Login.jsp" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>   
						     <a href="Login.jsp" class="btn btn-success btn-sm">View Details</a> 
						    <%}else{ %>
							 
							 <a href="pcartorder?bid=<%=b.getpId()%>&&uid=<%=u.getUid()%>&&puserid=<%=b.getpRegNo() %>" class=" btn btn-danger btn-sm "><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 
							 <a href="newviewbook.jsp?bid=<%=b.getpId() %>" class=" btn btn-success btn-sm ">View Details</a> 
							 <%} %>
							 <!-- <a href="#" class="btn btn-danger btn-sm "><i class="fas fa-rupee-sign"></i> <%=b.getpPrice() %></a> -->

						
					</div>
				</div>
				 
				</div>
				 
			<%
			} 
			%>			 
			 
			 
			
			
			
			<!-- <div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/java/java.png"
							style="width: 50px; height: 100px" class="img-thumbnail">
						<p>java Programming</p>
						<p>Anirban sinha</p>
						<p>Categories: New</p>
						<div class="row">
							 <a href="#" class=" btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>     
							 <a href="#" class=" btn btn-success btn-sm ml-1">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1">299</a>

						</div>
					</div>
				</div>
			</div>
 -->			
				
			
		</div>
		
		<div class="text-center ml-1">
		<br>
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">More View</a>
		</div>
	</div>
<!-- END New BOOK -->
<hr>
<!--  old BOOK -->
	<div class="container-fluid ">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
		
		 <%
			 BookDAOImpi dao3=new BookDAOImpi(DBConnet.getCon());
			 List<BookDetails> list6=dao3.getOldBook();
			 for(BookDetails b3 : list6){
				%>
		
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b3.getPhotoName() %>"
							style="width: 90px; height: 100px" class="img-thumbnail">
						<p><%=b3.getBookName()%></p>
						<p>Author:<%=b3.getAuthor() %></p>
						<p>Categories:<%=b3.getBookCategory() %></p>
						<div class="row ">
							 
							 <a href="viewbook.jsp?bid=<%=b3.getBookId() %>" class="ml-5 btn btn-success btn-sm ml-1">View Details</a> 
							 <a	href="#" class="btn btn-danger btn-sm ml-1">299</a>
								
						</div>
					</div>
				</div>
			</div>
      <%} %>
			
		</div>
		
		<div class="text-center ml-1"><br>
		<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">More View</a>
          </div>
	</div>
<!-- END Old BOOK -->
<br>


<%@ include file="all_component/footer.jsp" %>
</body>
</html>