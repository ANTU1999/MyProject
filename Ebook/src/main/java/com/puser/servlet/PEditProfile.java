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



@WebServlet("/updateprofile")

public class PEditProfile extends HttpServlet {


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int pid4=Integer.parseInt(req.getParameter("pid3"));
			String pname4=req.getParameter("pname3");
			String pregno4=req.getParameter("pregno3");
			String pemail4=req.getParameter("pemail3");
			String pphone4=req.getParameter("pphone3");
			String pstate4=req.getParameter("pstate3");
			String pcity4=req.getParameter("pcity3");
			String ppin4=req.getParameter("ppin3");
			String ppass4=req.getParameter("ppass3");
			
			HttpSession seesion=req.getSession();
			
			PUser ppus=new PUser();
			ppus.setPid(pid4);
			ppus.setPname(pname4);
			ppus.setPno(pregno4);
            ppus.setPemail(pemail4);
            ppus.setPphone(pphone4);
            ppus.setPstate(pstate4);
            ppus.setPcity(pcity4);
            ppus.setPpin(ppin4);
            ppus.setPpass(ppass4);
			PUserDAOimpli dao=new PUserDAOimpli(DBConnet.getCon());
			boolean f=dao.pcheckpassword(pid4, ppass4);
			if(f) {
				
				boolean f2=dao.pupdateProfile(ppus);
				if(f2) {
					seesion.setAttribute("suc7","Update Succesfull..");
					resp.sendRedirect("publisher/peditprofile.jsp");
				}
				else {
					seesion.setAttribute("fall7","Something went worng..");
					resp.sendRedirect("publisher/peditprofile.jsp");
				}
				
			}
			else {
				seesion.setAttribute("fall7","please enter correct password...");
				resp.sendRedirect("publisher/peditprofile.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
	
}
