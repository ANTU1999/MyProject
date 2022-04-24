package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PBookDAOImpli;
import com.DB.DBConnet;
import com.entity.PBookDetails;
@WebServlet("/pAdEditBook")
public class PubEditBook extends HttpServlet {

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int pid4=Integer.parseInt(req.getParameter("pid3"));
			//System.out.println(pid4);
			String pRegNo4=req.getParameter("pregno3");
			String pBookName4=req.getParameter("pbname3");
			String pAuthor4=req.getParameter("pauthor3");
			
		
			String pbPrice4=req.getParameter("price3");
			String pbDiscount4=req.getParameter("dprice3");
			String adminPBookDis=req.getParameter("adprice3");
			//use bydefault value of admin discount
			String pBookSta4=req.getParameter("pstatus3");
			//System.out.println(pid4+","+pRegNo4+","+pBookName4+","+pAuthor4+","+pbPrice4+","+pbDiscount4+","+adminPBookDis+","+pBookSta4);
			
			PBookDetails bbb=new PBookDetails();
			
			bbb.setpId(pid4);
			bbb.setpRegNo(pRegNo4);
			//System.out.println(bbb);
			bbb.setpBookName(pBookName4);
			bbb.setpAuthorName(pAuthor4);
			bbb.setpPrice(pbPrice4);
			bbb.setpDiscount(pbDiscount4);
			bbb.setAdminDiscount(adminPBookDis);
			bbb.setpBookStatus(pBookSta4);
			
			System.out.println(bbb);
			PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
			boolean f=dao.adminUpdateEditBooks(bbb);
			//System.out.println(f);
			HttpSession session=req.getSession();
			if(f) {
				
			
				session.setAttribute("suc8", "Book Update SUccessfully...");
				resp.sendRedirect("admin/p_allbook_see.jsp");
			}
			else {
				session.setAttribute("fall8", "Something went wrong..");
				resp.sendRedirect("admin/PEditBook.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

		
		
		
	}
	
	


