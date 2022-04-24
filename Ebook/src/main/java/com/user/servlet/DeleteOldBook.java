package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpi;
import com.DB.DBConnet;
@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		try {
			String emai=req.getParameter("ema");
			int id2=Integer.parseInt(req.getParameter("id1"));
			BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
			boolean f=dao.oldBookDeleteUser(id2,"Old", emai);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("suc","Old Book Delete Successfully");
				resp.sendRedirect("oldbooksellsetting.jsp");
			}
			
			else {
				session.setAttribute("failed", "Something went Wrong...");
				resp.sendRedirect("oldbooksellsetting.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
