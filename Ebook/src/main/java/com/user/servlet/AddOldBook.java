package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpi;
import com.DB.DBConnet;
import com.entity.BookDetails;
@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String bookName1=req.getParameter("bname2");
			String author1=req.getParameter("author2");
			String price1=req.getParameter("price2");
			
			String bookCategory1="Old";
			String status1="Active";
			Part part1=req.getPart("bimg");
			String fileName=part1.getSubmittedFileName();
			
			String bookCondition=req.getParameter("btype2");
			String useremail=req.getParameter("user");
			BookDetails b=new BookDetails(bookName1,author1,price1,bookCategory1,status1,fileName,useremail,bookCondition);
		    //System.out.println(b);
			
			BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
            
			
			
			boolean f=dao.addOldBooks(b);
		    
		    HttpSession session=req.getSession();
		    if(f) {
		    	
		    	String path	 =getServletContext().getRealPath("")+"Book";
	            //System.out.println(path);
	            File fil=new File(path);
	            part1.write(path+File.separator+fileName);
		    	
		    	session.setAttribute("succMsg3", "Book Add Sucesssfully");
		    	resp.sendRedirect("setting.jsp");
	    }
		    else {
		    	session.setAttribute("filedMsg3","Something Went Wrong...");
		    	resp.sendRedirect("sellbook.jsp");
		    }
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
