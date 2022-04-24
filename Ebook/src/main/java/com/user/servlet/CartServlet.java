package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpi;
import com.DAO.CartDAOImpl;
import com.DB.DBConnet;
import com.entity.BookDetails;
import com.entity.Cart;


@WebServlet("/cartSer")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		
		
		try {
			

			
			
			int bid=Integer.parseInt(req.getParameter("bid"));
			//System.out.println(bid);
			int uid=Integer.parseInt(req.getParameter("uid"));
			//System.out.println(uid);
	
		BookDAOImpi dao=new BookDAOImpi(DBConnet.getCon());
	    BookDetails b6=dao.getBookById(bid);
		Cart c=new Cart();
		c.setBid(bid);
		c.setUserId(uid);
		c.setBookName(b6.getBookName());
		c.setAuthor(b6.getAuthor());
		c.setPrice(Double.parseDouble(b6.getPrice()));
		c.setTotalPrice(Double.parseDouble(b6.getPrice()));
		
		CartDAOImpl dao2=new CartDAOImpl(DBConnet.getCon());
		boolean f=dao2.addCart(c);
		
		HttpSession session=req.getSession();
		
		
		if(f) {
			
			session.setAttribute("sucMsg","Book Added To Cart");
			resp.sendRedirect("all_new_book.jsp");
			
			//System.out.println("Add Cart SUccess");
		}
		else {
			
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
