package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpi;
import com.DB.DBConnet;

@WebServlet("/deletebook")
public class BookDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
		
			int id2=Integer.parseInt(req.getParameter("uid"));
			//PrintWriter out=resp.getWriter();
			//out.print(id2);
			BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
			boolean f=dao.deleteBooks(id2);
			HttpSession session =req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Delete Successfully..");
				resp.sendRedirect("admin/all_books");
			}
			else {
			
				session.setAttribute("failMsg","Something Went Wrong");
				resp.sendRedirect("admin/all_books");
			}
			
			
			
	}
		catch(Exception e) {
			e.printStackTrace();
		}
	

}
}
