package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOimpl implements UserDAO {
	private Connection conn;
	public UserDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}
   @Override
	public boolean userRegister(User us) {
		// TODO Auto-generated method stub
	   boolean f=false;
	   try {
		   String sql="insert into user (name,email,phone,password)values(?,?,?,?)";
		   PreparedStatement ps=conn.prepareStatement(sql);
	   
	      ps.setString(1, us.getName());
	      ps.setString(2, us.getEmail());
	      ps.setString(3, us.getPhone());
	      ps.setString(4, us.getPassword());
	      
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

public User login(String email3, String pass3) {
	// TODO Auto-generated method stub
	User us=null;
	try {
		String sql="select * from user where email=? and password=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, email3);
		ps.setString(2, pass3);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			us=new User();
			us.setUid(rs.getInt(1));
			us.setName(rs.getString(2));
			us.setEmail(rs.getString(3));
			us.setPhone(rs.getString(4));
			us.setPassword(rs.getString(5));
			us.setAddress(rs.getString(6));
			us.setLandmark(rs.getString(7));
			us.setCity(rs.getString(8));
			us.setState(rs.getString(9));
			us.setPincode(rs.getString(10));
			
		}
		
	}
	
	catch(Exception e) {
		e.printStackTrace();
	}
	return us;
}
@Override
public boolean checkpassword(int id,String ps1) {
	boolean f=false;
	try {
		String sql="select * from user where uid=? and password=?";
		PreparedStatement pss=conn.prepareStatement(sql);
		pss.setInt(1, id);
		pss.setString(2, ps1);
		ResultSet rs=pss.executeQuery();
		while(rs.next()) {
			f=true;
		}
	    	
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return f;
}
@Override
public boolean updateProfile(User us1) {
	
	 boolean f=false;
	   try {
		   String sql="update user set name=?,email=?,phone=? where uid=?";
		   PreparedStatement ps=conn.prepareStatement(sql);
	   
	      ps.setString(1, us1.getName());
	      ps.setString(2, us1.getEmail());
	      ps.setString(3, us1.getPhone());
	      ps.setInt(4, us1.getUid());
	      
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
@Override
public boolean checkUser(String email1) {
	boolean f=true;
	
	try {
		String sql="select * from user where email=?";
		   PreparedStatement ps=conn.prepareStatement(sql);
	   
	      ps.setString(1, email1);
	      
	      ResultSet rs=ps.executeQuery();
	      while(rs.next()) {
	    	  f=false;
	 
	      }
	
	      
	      
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return f;
}
   




   
}
