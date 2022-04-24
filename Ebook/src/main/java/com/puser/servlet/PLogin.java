package com.puser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PUserDAOimpli;

import com.DB.DBConnet;
import com.entity.PUser;
import com.entity.User;
@WebServlet("/plogin")
public class PLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PUserDAOimpli dao=new PUserDAOimpli(DBConnet.getCon());
		HttpSession session=req.getSession();
		String preg2=req.getParameter("preg");
		String ppass2=req.getParameter("pass");
		
		PUser pus= dao.PLogin(preg2, ppass2);
		if(pus != null) {
			session.setAttribute("puserobj", pus);
			
			
			System.out.println("login success....");
			resp.sendRedirect("publisher/psetting.jsp");
		}
		else {
			session.setAttribute("failedMsg1", "Email & password invalid");
			resp.sendRedirect("PLogin.jsp");
			System.out.println("Login Fail...");
		}
		
	}

	
	
}
