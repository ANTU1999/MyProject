package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnet;
import com.entity.BookOrder;

public class BookOrderImpi implements BookOrderDAO{

	
	private  Connection conn;

	public BookOrderImpi(Connection conn) {
		super();
		this.conn = conn;
	}
/*
	@Override
	public int getOrderNo() {
		// TODO Auto-generated method stub
		int i=1;
		try {
			String sql="select * from order1";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	*/
	public boolean saveOrder(List<BookOrder> blist) {
		// TODO Auto-generated method stub
		
		boolean f=false;
		try {
			
			String sql="insert into order1(orderid,username,email,address,phone,bookname,author,price,payment)values(?,?,?,?,?,?,?,?,?)";
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

	public List<BookOrder> getBook(String email12) {
		// TODO Auto-generated method stub
		List<BookOrder> list=new ArrayList<BookOrder>();
		BookOrder or=null;
		
		try {
			String sql="select * from order1 where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email12);
			System.out.println(email12);
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
				list.add(or);
				//System.out.println(list);
				
			}

		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
		
	}
	
	public List<BookOrder> getAllBookOrder() {
		// TODO Auto-generated method stub
		
		List<BookOrder> list=new ArrayList<BookOrder>();
		BookOrder or=null;
		
		try {
			String sql="select * from order1 ";
			PreparedStatement ps=conn.prepareStatement(sql);
			//ps.setString(1, email12);
			
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
