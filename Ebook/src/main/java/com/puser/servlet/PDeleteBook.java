package com.puser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpi;
import com.DAO.PBookDAOImpli;
import com.DB.DBConnet;
@WebServlet("/pdeletebook")
public class PDeleteBook extends HttpServlet {

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		try {
			String pregno1=req.getParameter("preg");
			int id2=Integer.parseInt(req.getParameter("id1"));
			PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
			//boolean f=dao.oldBookDeleteUser(id2,"Old", emai);
			boolean f=dao.deleteBook(pregno1, id2);
			
			HttpSession session=req.getSession();
			if(f) {
				//System.out.println("delete successfully...");
				session.setAttribute("suc"," Book Delete Successfully");
				resp.sendRedirect("publisher/allpublishbook.jsp");
			}
			
			else {
				session.setAttribute("failed", "Something went Wrong...");
				resp.sendRedirect("publisher/allpublishbook.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	

}

