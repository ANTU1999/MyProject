package com.puser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.PBookDAOImpli;
import com.DB.DBConnet;
import com.entity.PBookDetails;

@WebServlet("/peditprofile")
public class PEditBook extends HttpServlet {

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int pid1=Integer.parseInt(req.getParameter("pid2"));
			String pBookName1=req.getParameter("pbname2");
			String pAuthor1=req.getParameter("pauthor2");
			String pLang1=req.getParameter("pblan2");
			String pyear=req.getParameter("pyear2");
		
			String pbprice=req.getParameter("pprice2");
			String pbdiscount=req.getParameter("pdprice2");
			String pBookPage=req.getParameter("ppage2");
			System.out.println(pid1+","+pBookName1+","+pAuthor1+","+pLang1+","+pyear+","+pbprice+","+pbdiscount+","+pBookPage);
			
			PBookDetails bb=new PBookDetails();
			bb.setpId(pid1);
			bb.setpBookName(pBookName1);
			bb.setpAuthorName(pAuthor1);
			bb.setpBookLanguage(pLang1);
			bb.setpBookYear(pyear);
			bb.setpPrice(pbprice);
			bb.setpDiscount(pbdiscount);
			bb.setpPage(pBookPage);
			System.out.println(bb);
			PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
			boolean f=dao.updateEditBooks(bb);
			HttpSession session=req.getSession();
			if(f) {
				
				
				session.setAttribute("suc6", "Book Update SUccessfully...");
				resp.sendRedirect("publisher/allpublishbook.jsp");
			}
			else {
				session.setAttribute("fiai6", "Something went wrong..");
				resp.sendRedirect("publisher/peditbook.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
	
}
