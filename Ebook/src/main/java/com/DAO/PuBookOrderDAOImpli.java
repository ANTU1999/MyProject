package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class PuBookOrderDAOImpli implements PuBookOrderDAO {
    
	private Connection conn;
	public PuBookOrderDAOImpli(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean psaveOrder(List<BookOrder> blist) {
		
		boolean f=false;
		try {
			
			String sql="insert into order1(orderid,username,email,address,phone,bookname,author,price,payment,pregno)values(?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			for(BookOrder b:blist) {
				
				ps.setString(1,b.getOrderid());
				ps.setString(2, b.getUsername());
				ps.setString(3,b.getEmail());
				ps.setString(4,b.getFulladd());
				ps.setString(5, b.getPhone());
				ps.setString(6, b.getBookname());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPayment());
				ps.setString(10,b.getPuregno());
				
				ps.addBatch();
				
				
				
			}
			int [] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		return f;
		
		
		
	}

	
	public List<BookOrder> pGetBook(String preg) {
		
		
		List<BookOrder> list=new ArrayList<BookOrder>();
		BookOrder or=null;
		
		try {
			String sql="select * from order1 where pregno=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, preg);
			System.out.println(preg);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				or=new BookOrder();
				or.setId(rs.getInt(1));
				or.setOrderid(rs.getString(2));
				or.setUsername(rs.getString(3));
				or.setEmail(rs.getString(4));
				//or.setAddress(rs.getString(5));
				or.setFulladd(rs.getString(5));
				or.setPhone(rs.getString(6));
				or.setBookname(rs.getString(7));
				or.setAuthor(rs.getString(8));
				or.setPrice(rs.getString(9));
				or.setPayment(rs.getString(10));
				or.setPuregno(rs.getString(11));
				list.add(or);
				//System.out.println(list);
				
			}

		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
	}

	

	
}
