package com.admin.servlet;

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

@WebServlet("/pADeleteBook")

public class pubDeleteBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			int id5=Integer.parseInt(req.getParameter("id"));
			//PrintWriter out=resp.getWriter();
			//out.print(id2);
			PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
			boolean f=dao.pAdminDeleteBook(id5);
			HttpSession session =req.getSession();
			
			if(f) {
				session.setAttribute("suc9", "Delete Successfully..");
				resp.sendRedirect("admin/p_allbook_see.jsp");
			}
			else {
			
				session.setAttribute("fall9","Something Went Wrong");
				resp.sendRedirect("admin/p_allbook_see.jsp");
			}
			
			
			
	}
		catch(Exception e) {
			e.printStackTrace();
		}
	

	}

	
	
}
