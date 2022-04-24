package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.PBookDAOImpli;
import com.DAO.PCartDAOImpli;
import com.DB.DBConnet;

import com.entity.PBookDetails;
import com.entity.PCart;
@WebServlet("/pcartorder")
public class PCartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		
		
		try {
			
			int bid=Integer.parseInt(req.getParameter("bid"));
			//System.out.println(bid);
			int uid=Integer.parseInt(req.getParameter("uid"));
			//System.out.println(uid);
			//int puserid1=Integer.parseInt(req.getParameter("puserid"));
			String  puserid2=req.getParameter("puserid");
			//System.out.println(puserid2);
		
	
		PBookDAOImpli dao=new PBookDAOImpli(DBConnet.getCon());
	    PBookDetails b6=dao.getBookById(bid);
	   // System.out.println("hell0"+b6.getPriceAfterDiscount1());
		PCart c=new PCart();
		c.setPbid(bid);
		c.setUuserId(uid);
		c.setPregNo(puserid2);
		c.setpBookName(b6.getpBookName());
		c.setpAuthor(b6.getpAuthorName());
		//update admin discount
		c.setaDiscount(b6.getAdminDiscount());
		c.setOriginalPrice(b6.getpPrice());
		//c.setpPrice(Double.parseDouble(b6.getpPrice()));
		/* c.setpPrice((double)(b6.getPricePublisherDiscount())); */
		
		
		//working below code for publisher price 
		//c.setpTotalPrice((double)(b6.getPricePublisherDiscount()));
		//working below code for admin price
		c.setpPrice((double)(c.getPriceAfterDiscount3()));
		c.setpTotalPrice((double)(c.getPriceAfterDiscount3()));
		
		PCartDAOImpli dao2=new PCartDAOImpli(DBConnet.getCon());
		boolean f=dao2.pAddCart(c);
		
		HttpSession session=req.getSession();
		
		
		if(f) {
			System.out.println("Add Cart SUccess");
			session.setAttribute("sucMsg","Book Added To Cart");
			resp.sendRedirect("index.jsp");
			
			//System.out.println("Add Cart SUccess");
		}
		else {
			System.out.println("Not Add to cart");
			session.setAttribute("failed", "Something Went wrong");
			resp.sendRedirect("all_new_book.jsp");
			//System.out.println("Not Add to cart");
		}
		
		
		
	}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("someting went wrong");
		}
	
	}
	

}
