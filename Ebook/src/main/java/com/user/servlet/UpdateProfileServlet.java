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
@WebServlet("/editprofile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name1=req.getParameter("fname");
			String email1=req.getParameter("email");
			String phone1=req.getParameter("phone");
			String pass1=req.getParameter("pass");
			HttpSession seesion=req.getSession();
			User us=new User();
			us.setUid(id);
			us.setName(name1);
            us.setEmail(email1);
            us.setPhone(phone1);
			UserDAOimpl dao=new UserDAOimpl(DBConnet.getCon());
			boolean f=dao.checkpassword(id, pass1);
			if(f) {
				
				boolean f2=dao.updateProfile(us);
				if(f2) {
					seesion.setAttribute("suc6","Update Succesfull..");
					resp.sendRedirect("editprofile.jsp");
				}
				else {
					seesion.setAttribute("failed6","Something went worng..");
					resp.sendRedirect("editprofile.jsp");
				}
				
			}
			else {
				seesion.setAttribute("failed6","user id and password are wrong..");
				resp.sendRedirect("editprofile.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
