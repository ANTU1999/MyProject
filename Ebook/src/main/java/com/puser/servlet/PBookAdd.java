package com.puser.servlet;
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
import com.DAO.PBookDAOImpli;
import com.DB.DBConnet;
import com.entity.PBookDetails;
@WebServlet("/paddbook")

@MultipartConfig(maxFileSize = 16177215)
public class PBookAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String pBookName1=req.getParameter("pbname");
			String pAuthor1=req.getParameter("pauthor");
			String pLang1=req.getParameter("plangu");
			String pisbn=req.getParameter("pisbn");
			String pyear=req.getParameter("pyear");
			String pbprice=req.getParameter("price2");
			String pbdiscount=req.getParameter("dprice2");
			String pBookPage=req.getParameter("ppage");
			String pDiscrip=req.getParameter("pdis");
			
			Part part2=req.getPart("pbimg");
			String fileName=part2.getSubmittedFileName();
			
			String pstatus1="InActive";
			
			String pregno=req.getParameter("puser");
			String pemail=req.getParameter("pemail1");
			String pAdminDiscount1="0";
			String adminPrice="0";
			String bookCata1="New";
			//BookDetails b=new BookDetails(bookName1,author1,price1,bookCategory1,status1,fileName,"admin","N.A");
		    //System.out.println(b);
			PBookDetails pb=new PBookDetails(pBookName1,pAuthor1,pLang1,pisbn,pyear,pbprice,pbdiscount,pBookPage,fileName,pDiscrip,pstatus1,pregno,pemail,pAdminDiscount1,adminPrice,bookCata1);
			System.out.println(pb);
			PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
            
			
			
			boolean f=dao.pBooksAdd(pb);
		    
		    HttpSession session=req.getSession();
		    if(f) {
		    	
		    	String path	 =getServletContext().getRealPath("")+"Book";
	            //System.out.println(path);
	            File fil=new File(path);
	            part2.write(path+File.separator+fileName);
		    	
		    	session.setAttribute("succMsg3", "Book Add Sucesssfully");
		    	resp.sendRedirect("publisher/PAddBook.jsp");
	    }
		    else {
		    	session.setAttribute("filedMsg3","Something Went Wrong...");
		    	resp.sendRedirect("publisher/PAddBook.jsp");
		    }
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
