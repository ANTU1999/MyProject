package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpi;
import com.DAO.CartDAOImpl;
import com.DAO.PCartDAOImpli;
import com.DAO.PuBookOrderDAOImpli;
import com.DB.DBConnet;
import com.entity.BookOrder;
import com.entity.Cart;
import com.entity.PCart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession session=req.getSession();
			
			int id1=Integer.parseInt(req.getParameter("oid"));
			String name=req.getParameter("oname");
			String email=req.getParameter("oemail");
			String phone=req.getParameter("ophone");
			String address=req.getParameter("oaddress");
			String landmark=req.getParameter("olandmark");
			String city=req.getParameter("ocity");
			String state=req.getParameter("ostate");
			String pin=req.getParameter("opin");
			
			String pmode=req.getParameter("payment");
			//get pregno
			//String pubregno=req.getParameter("pregno");
			
			String fulladd=address+","+ landmark+","+city+","+state+","+pin;
			
			//System.out.println(name+" "+email+" "+phone+" "+fulladd+" "+pmode);
			
			PCartDAOImpli dao=new PCartDAOImpli(DBConnet.getCon());
			PuBookOrderDAOImpli dao2=new PuBookOrderDAOImpli(DBConnet.getCon());
			//int i=dao2.getOrderNo();
			Random r=new Random();
			BookOrder or=null;
			List<PCart> listcart=dao.getPBookByUser(id1);
			
			if(listcart.isEmpty()) {
				session.setAttribute("failed1234", "please Add Atleast One Book");
				resp.sendRedirect("checkout.jsp");
				
			}
			else {
			ArrayList<BookOrder> orderlist=new ArrayList<BookOrder>();
			for(PCart c:listcart) {
				//i++;
				or=new BookOrder();
				//System.out.println(c.getBookName()+" "+c.getAuthor()+" "+c.getPrice());
				or.setOrderid("PBOOK-ORD-2022 "+r.nextInt(200));
				or.setUsername(name);
				or.setEmail(email);
				or.setPhone(phone);
				or.setFulladd(fulladd);
				or.setBookname(c.getpBookName());
				or.setAuthor(c.getpAuthor());
				or.setPrice(c.getpPrice()+"");
				or.setPayment(pmode);
				//set regno
				//or.setPuregno(pubregno);
				or.setPuregno(c.getPregNo());
				orderlist.add(or);
				
				
			}
			
			if("noselect".equals(pmode)) {
				session.setAttribute("failed12", "please select Payment Method");
				resp.sendRedirect("checkout.jsp");
				
			}
			else {
				
		        boolean f=dao2.psaveOrder(orderlist);
		        if(f) {
		        	resp.sendRedirect("OrderSuccess.jsp");
		        	System.out.println("succes order");
		        }
		        else {
		        	session.setAttribute("failed123", "Something issue Server Please Try again");
					resp.sendRedirect("checkout.jsp");
		        	//System.out.println("failed");
		        }
				
			}
			
		}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	

	
	
}
