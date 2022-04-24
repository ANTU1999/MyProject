package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.PUser;
import com.entity.User;

public class PUserDAOimpli implements PUserDAO {
	
	private Connection conn;
	public PUserDAOimpli(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean pUserReg(PUser pus) {
		// TODO Auto-generated method stub
		boolean f=false;
		
		try {
			String sql="insert into puser(pname,preg,pemail,pphone,pstate,pcity,ppin,ppass)values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			 ps.setString(1, pus.getPname());
			 ps.setString(2, pus.getPno());
			 ps.setString(3, pus.getPemail());
			 ps.setString(4, pus.getPphone());
			 ps.setString(5, pus.getPstate());
			 ps.setString(6,pus.getPcity());
			 ps.setString(7, pus.getPpin());
			 ps.setString(8, pus.getPpass());
			 
			 int i=ps.executeUpdate();
			 //System.out.println(i);
			 if(i>0) {
				 f=true;
				// System.out.println(f);
			 }
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public PUser PLogin(String preg,String pass) {
		// TODO Auto-generated method stub
		PUser pus=null;
		
	try {
		String sql="select * from puser where preg=? and ppass=?";
		PreparedStatement ps=conn.prepareStatement(sql);
	    ps.setString(1, preg);
	    ps.setString(2, pass);
	    ResultSet rs=ps.executeQuery();
	    while(rs.next()) {
	    	pus=new PUser();
			pus.setPid(rs.getInt(1));
		    pus.setPname(rs.getString(2));
		    pus.setPno(rs.getString(3));
		    pus.setPemail(rs.getString(4));
		    pus.setPphone(rs.getString(5));
		    pus.setPstate(rs.getString(6));
		    pus.setPcity(rs.getString(7));
		    pus.setPpin(rs.getString(8));
		    pus.setPpass(rs.getString(9));
		    
	    }
	    
	}
	catch(Exception e) {
		e.printStackTrace();
	}
		return pus;
	}

	
	public boolean pcheckpassword(int id, String ps1) {
		
		boolean f=false;
		try {
			String sql="select * from puser where pid=? and ppass=?";
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

	
	public boolean pupdateProfile(PUser pus1) {
		
		 boolean f=false;
		   try {
			   String sql="update puser set pname=?,pemail=?,pphone=?, pstate=?,pcity=?,ppin=? where pid=?";
			   PreparedStatement ps=conn.prepareStatement(sql);
		   
		      ps.setString(1, pus1.getPname());
		      ps.setString(2, pus1.getPemail());
		      ps.setString(3, pus1.getPphone());
		     
		      ps.setString(4, pus1.getPstate());
		      ps.setString(5, pus1.getPcity());
		      ps.setString(6,pus1.getPpin());
		      ps.setInt(7,pus1.getPid());
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


	public List<PUser> getAllPublisher() {
		List<PUser> list2=new ArrayList<PUser>();
		PUser p=null;
		try {
			String sql="select * from puser";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				p=new PUser();
				p.setPno(rs.getString(3));
				p.setPname(rs.getString(2));
				p.setPphone(rs.getString(5));
				p.setPemail(rs.getString(4));
				p.setPcity(rs.getString(7));
				p.setPpin(rs.getString(8));
				p.setPstate(rs.getString(6));
			
				
				list2.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list2;
		
		
		
	}

	
	
	
	
	
	

}
