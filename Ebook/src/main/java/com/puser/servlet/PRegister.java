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
@WebServlet("/pregister")
public class PRegister extends HttpServlet {

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String pname1=req.getParameter("pname");
			String preg1=req.getParameter("regno");
			String pemail1=req.getParameter("email");
			String pphone1=req.getParameter("phone");
			String pstate1=req.getParameter("state");
			String pcity1=req.getParameter("city");
			String ppin1=req.getParameter("pin");
			String ppass1=req.getParameter("pass");
			String pcheck1=req.getParameter("check");
			
			PUser pus=new PUser();
			pus.setPname(pname1);
			pus.setPno(preg1);
			pus.setPemail(pemail1);
			pus.setPphone(pphone1);
			pus.setPstate(pstate1);
			pus.setPcity(pcity1);
			pus.setPpin(ppin1);
			pus.setPpass(ppass1);
			
			HttpSession session=req.getSession();
			
			if(pcheck1 != null) {
				PUserDAOimpli dao=new PUserDAOimpli(DBConnet.getCon());
				boolean f=dao.pUserReg(pus);
				if(f) {
					//System.out.println("User registration success...");
					//session.setAttribute("psuc1","Registration successfully..");
					resp.sendRedirect("PLogin.jsp");
				}
				else {
					//System.out.println("Something went wrong..");
					session.setAttribute("pfail1", "Something Went Wrong Try Again..");
					resp.sendRedirect("RegPublisher.jsp");
				}
			}
			else {
				//System.out.println("please select term and condition");
				
					//System.out.println("Please Agree the term and condition");
					session.setAttribute("pfail11","Please Agree Term & Condition..");
					resp.sendRedirect("RegPublisher.jsp");
				
			}
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	
		
	

}
