package com.user.servlet;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.UserDAOimpl;
import com.DB.DBConnet;
import com.entity.User;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			String name1=req.getParameter("fname");
			String email1=req.getParameter("email");
			String phone1=req.getParameter("phone");
			String pass1=req.getParameter("pass");
			String check1=req.getParameter("check");
			 
			//System.out.println(name1+" "+email1+" "+phone1+" "+pass1+" "+check1);
			
			User use=new User();
			use.setName(name1);
			use.setEmail(email1);
			use.setPhone(phone1);
			use.setPassword(pass1);
			
			HttpSession session=req.getSession();			
			//term and condition check code
			if(check1 !=null)
			{
				UserDAOimpl dao=new UserDAOimpl(DBConnet.getCon());
				boolean f2=dao.checkUser(email1);
				if(f2) {
				boolean f=dao.userRegister(use);
				//System.out.println(f);
				if(f) {
					//System.out.println("User Register success...");
					
					//session.setAttribute("succMsg","Registration successfully..");
					resp.sendRedirect("Login.jsp");
				}
				else {
					//System.out.println("Something went wrong");
					session.setAttribute("failedMsg","Something WentWrong..");
					resp.sendRedirect("Register.jsp");
				}
				}
				else {
					
					session.setAttribute("failedMsg","<b>User are already exist please login..</b>");
					resp.sendRedirect("Register.jsp");
				}
			}
			else {
				//System.out.println("Please Agree the term and condition");
				session.setAttribute("failedMsg","Please Agree Term & Condition..");
				resp.sendRedirect("Register.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
