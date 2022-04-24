package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOimpl;
import com.DB.DBConnet;
import com.entity.User;

@WebServlet("/login")
public class LogingServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			UserDAOimpl dao=new UserDAOimpl(DBConnet.getCon());
			HttpSession session=req.getSession();
			
			String email2=req.getParameter("email");
			String pass2=req.getParameter("pass");
			//check data fetch or not 
			//System.out.println(email2+"  "+pass2);
			if("admin@gmail.com".equals(email2)&& "antu".equals(pass2))
			{
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				
				resp.sendRedirect("admin/Home.jsp");
			}
		
			
			else {
				User us= dao.login(email2, pass2);
				if(us != null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("failedMsg1", "Email & password invalid");
					resp.sendRedirect("Login.jsp");
				}
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
}
