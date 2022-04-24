package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.PCartDAOImpli;
import com.DB.DBConnet;
@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cid=Integer.parseInt(req.getParameter("cid"));
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		System.out.println(cid);
		System.out.println(bid);
		System.out.println(uid);
		
		
		PCartDAOImpli dao1=new PCartDAOImpli(DBConnet.getCon());
		boolean f1=dao1.pdeleteBook(cid,bid,uid);
		HttpSession session1=req.getSession();
		if(f1) {
			session1.setAttribute("suc","Book Remove From Cart table");
			resp.sendRedirect("checkout.jsp");
		}
		
		else {
			session1.setAttribute("failed", "Something went Wrong...");
			resp.sendRedirect("checkout.jsp");
		}
		/*
		CartDAOImpl dao=new CartDAOImpl(DBConnet.getCon());
		boolean f=dao.deleteBook(cid,bid,uid);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("suc","Book Remove From Cart table");
			resp.sendRedirect("checkout.jsp");
		}
		
		else {
			session.setAttribute("failed", "Something went Wrong...");
			resp.sendRedirect("checkout.jsp");
		}
		*/
	
	}
	
	

}
