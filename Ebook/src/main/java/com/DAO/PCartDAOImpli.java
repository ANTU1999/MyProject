package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.PCart;

public class PCartDAOImpli implements PCartDAO {
	
	private Connection conn;
	public PCartDAOImpli(Connection conn) {
		this.conn=conn;
	}
	@Override
	public boolean pAddCart(PCart c) {
		
		boolean f=false;
		try {
		String sql="insert into pcart (pbid,useruid,puid,pbookname,pauthor,pprice,ptotalprice,admindiscount,orginalprice) values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,c.getPbid());
		ps.setInt(2, c.getUuserId());
		ps.setString(3, c.getPregNo());
		ps.setString(4, c.getpBookName());
		ps.setString(5, c.getpAuthor());
		ps.setDouble(6, c.getpPrice());
		ps.setDouble(7, c.getpTotalPrice());
		ps.setString(8, c.getaDiscount());
		ps.setString(9, c.getOriginalPrice());
		//change next line
		//ps.setDouble(8, c.getCartPriceAfterDiscount());
		
		int i=ps.executeUpdate();
		if(i==1) {
			f=true;
		
		}
		
		
	}
		catch(Exception e) {
			e.printStackTrace();
		}

		return f;
		
	}
	
	
	public List<PCart> getPBookByUser(int userId) {
		
		List<PCart> list=new ArrayList<PCart>();
		double totalPrice=0;
		PCart c=null;
		try {
			
			String sql="select * from pcart where useruid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				c=new PCart();
				
				
				c.setPcid(rs.getInt(1));
				c.setPbid(rs.getInt(2));
				c.setUuserId(rs.getInt(3));
				c.setPregNo(rs.getString(4));
				c.setpBookName(rs.getString(5));
				c.setpAuthor(rs.getString(6));
				c.setpPrice(rs.getDouble(7));
				c.setaDiscount(rs.getString(9));
				c.setOriginalPrice(rs.getString(10));
				//c.setpDiscountPrice(rs.getDouble(8));
				
				
				
				totalPrice=totalPrice+rs.getDouble(8);
				c.setpTotalPrice(totalPrice);
				
				list.add(c);
				
				
			}
			
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return list;
		
		
		
	}
	
	public boolean pdeleteBook(int cid, int bid, int uid) {
		
		boolean f=false;
		
		try {
			
			String spl="delete from pcart where pcid=? and pbid=? and useruid=?";
			PreparedStatement ps=conn.prepareStatement(spl);
			ps.setInt(1, cid);
			ps.setInt(2, bid);
			ps.setInt(3,uid);
			int i=ps.executeUpdate();
			if(i>0) {
				f=true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	
	
	
	

}
