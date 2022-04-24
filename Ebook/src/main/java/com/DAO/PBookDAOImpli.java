package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.PBookDetails;

public class PBookDAOImpli implements PBookDAO {
	
	private Connection conn;
	
	
	

	public PBookDAOImpli(Connection conn) {
		super();
		this.conn=conn;
		// TODO Auto-generated constructor stub
	}




	
	public boolean pBooksAdd(PBookDetails pb) {
		// TODO Auto-generated method stub
		
		boolean f=false;
		try {
			String sql="insert into paddbook(pbname,pbauthor,pblan,pbisbn,pbyear,pbprice,pbdis,pbpage,pbphoto,pdiscrip,pstatus,preg,pemail,adiscount,adminprice,bcatagory)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		    PreparedStatement ps=conn.prepareStatement(sql);
		    ps.setString(1,pb.getpBookName());
		    ps.setString(2,pb.getpAuthorName());
		    ps.setString(3,pb.getpBookLanguage());
		    ps.setString(4,pb.getpBookIsbn());
		    ps.setString(5,pb.getpBookYear());
		    ps.setString(6,pb.getpPrice());
		    ps.setString(7,pb.getpDiscount());
		    ps.setString(8,pb.getpPage());
		    ps.setString(9,pb.getpPhoto());
		    ps.setString(10,pb.getpBookDescription());
		    ps.setString(11,pb.getpBookStatus());
		    ps.setString(12,pb.getpRegNo());
		    ps.setString(13,pb.getpEmail());
		    ps.setString(14,pb.getAdminDiscount());
		    ps.setString(15, pb.getAdminPrice());
		    ps.setString(16,pb.getBookCatagory());
		    System.out.println(ps);
		    int i=ps.executeUpdate();
		    
		    if(i>0) {
		    	f=true;
		    	System.out.println(f);
		    }
		
		
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
		
	}




	
	public List<PBookDetails> getAllBooks() {
		// TODO Auto-generated method stub
		List<PBookDetails> list=new ArrayList<PBookDetails>();
		PBookDetails b=null;
		
		try {
			
			String sql="select * from paddbook";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new PBookDetails();
				b.setpId(rs.getInt(1));
				b.setpRegNo(rs.getString(13));
				b.setpEmail(rs.getString(14));
				b.setpBookName(rs.getString(2));
				b.setpPhoto(rs.getString(10));
				b.setpAuthorName(rs.getString(3));
				b.setpBookIsbn(rs.getString(5));
				b.setpPrice(rs.getString(7));
				b.setpDiscount(rs.getString(8));
				b.setpBookStatus(rs.getString(12));
				b.setAdminDiscount(rs.getString(15));
				list.add(b);
				//System.out.println(list);
				
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}






	public List<PBookDetails> getBookBySell(String regno) {
		// TODO Auto-generated method stub
		
		List<PBookDetails> list=new ArrayList<PBookDetails>();
		PBookDetails b=null;
		
		try {
			String spl="select * from paddbook where preg=?";
			PreparedStatement ps=conn.prepareStatement(spl);
			ps.setString(1,regno);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new PBookDetails();
				b.setpId(rs.getInt(1));
				b.setpBookName(rs.getString(2));
				b.setpAuthorName(rs.getString(3));
				b.setpBookLanguage(rs.getString(4));
				b.setpBookIsbn(rs.getString(5));
				b.setpPrice(rs.getString(7));
				b.setpDiscount(rs.getString(8));
				b.setpPage(rs.getString(9));
				
				list.add(b);
				
			}
			//System.out.println(list);
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
			
		}
		
		
		
		return list;
	}





	
	public boolean deleteBook(String regno, int id2) {
		
         boolean f=false;
		
		try {
			String spl="delete from paddbook where preg=? and pbid=?";
			PreparedStatement ps=conn.prepareStatement(spl);
			ps.setString(1,regno);
			ps.setInt(2,id2);
			
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






	public PBookDetails getBookById(int id1) {
		
		
		PBookDetails bbb = null;
		try {
			
			String sql="select * from paddbook where pbid=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id1);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				bbb=new PBookDetails();
				bbb.setpId(rs.getInt(1));
				bbb.setpBookName(rs.getString(2));
				bbb.setpAuthorName(rs.getString(3));
				bbb.setpBookLanguage(rs.getString(4));
				bbb.setpBookIsbn(rs.getString(5));
				bbb.setpBookYear(rs.getString(6));
				bbb.setpPrice(rs.getString(7));
				bbb.setpDiscount(rs.getString(8));
				bbb.setpPage(rs.getString(9));
				bbb.setpPhoto(rs.getString(10));
				bbb.setpBookDescription(rs.getString(11));
				bbb.setpBookStatus(rs.getString(12));
				bbb.setpRegNo(rs.getString(13));
				bbb.setpEmail(rs.getString(14));
				//change after delete
				bbb.setAdminDiscount(rs.getString(15));
				//bbb.setBookCondition(rs.getString(9));
				
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	return bbb;
	}





	
	public boolean updateEditBooks(PBookDetails b) {
		
		boolean f=false;
		
		try {
		String sql="update paddbook set  pbname=?,pbauthor=?,pblan=?,pbyear=?,pbprice=?,pbdis=?,pbpage=? where pbid=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,b.getpBookName());
		ps.setString(2, b.getpAuthorName());
		ps.setString(3, b.getpBookLanguage());
		ps.setString(4, b.getpBookYear());
		ps.setString(5, b.getpPrice());
		ps.setString(6, b.getpDiscount());
		ps.setString(7, b.getpPage());
		//use for checking admindiscount price update
		//ps.setString(8,b.getAdminDiscount());
		ps.setInt(8, b.getpId());
		
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






	public boolean adminUpdateEditBooks(PBookDetails b) {
	boolean f=false;
		
		try {
		String sql="update paddbook set  pbname=?,pbauthor=?,pbprice=?,pbdis=?,adiscount=?,pstatus=? where pbid=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,b.getpBookName());
		ps.setString(2, b.getpAuthorName());
		//ps.setString(3, b.getpBookLanguage());
		//ps.setString(4, b.getpBookYear());
		ps.setString(3, b.getpPrice());
		ps.setString(4, b.getpDiscount());
		ps.setString(5, b.getAdminDiscount());
		ps.setString(6, b.getpBookStatus());
		
		//ps.setString(7, b.getpPage());
		//ps.setInt(7, b.discountprice);
		ps.setInt(7, b.getpId());
		
		int i=ps.executeUpdate();
		//System.out.println(i);
		if(i>0) {
			f=true;
			
		}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}





	public boolean pAdminDeleteBook(int id5) {
		
		 boolean f=false;
			
			try {
				String spl="delete from paddbook where  pbid=?";
				PreparedStatement ps=conn.prepareStatement(spl);
				
				ps.setInt(1,id5);
				
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





	
	public List<PBookDetails> getPuNewBook() {
		
		List<PBookDetails> list3=new ArrayList<PBookDetails>();
		PBookDetails b=null;
		try {
			String sql="select * from paddbook  where  pstatus=? order by pbid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			//ps.setString(1,"New" );
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new PBookDetails();
				b.setpId(rs.getInt(1));
				b.setpBookName(rs.getString(2));
				b.setpAuthorName(rs.getString(3));
				b.setpBookLanguage(rs.getString(4));
				b.setpBookIsbn(rs.getString(5));
				b.setpBookYear(rs.getString(6));
				b.setpPrice(rs.getString(7));
				b.setpDiscount(rs.getString(8));
				b.setpPage(rs.getString(9));
				b.setpPhoto(rs.getString(10));
				b.setpBookDescription(rs.getString(11));
				b.setpBookStatus(rs.getString(12));
				b.setpRegNo(rs.getString(13));
				b.setpEmail(rs.getString(14));
				b.setAdminDiscount(rs.getString(15));
				
				
				list3.add(b);
				i=i+1;
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list3;
	
		
		
	}






	public PBookDetails getPBookByViewId(int id) {
		PBookDetails bb=null;
		try {
			
			String sql="select * from paddbook where pbid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				bb=new PBookDetails();
				bb.setpId(rs.getInt(1));
				bb.setpBookName(rs.getString(2));
				bb.setpAuthorName(rs.getString(3));
				bb.setpBookLanguage(rs.getString(4));
				bb.setpBookIsbn(rs.getString(5));
				bb.setpBookYear(rs.getString(6));
				bb.setpPrice(rs.getString(7));
				bb.setpDiscount(rs.getString(8));
				bb.setpPage(rs.getString(9));
				bb.setpPhoto(rs.getString(10));
				bb.setpBookDescription(rs.getString(11));
				bb.setpBookStatus(rs.getString(12));
				bb.setpRegNo(rs.getString(13));
				bb.setpEmail(rs.getString(14));
				bb.setAdminDiscount(rs.getString(15));
				
				
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	return bb;
		
		
	}





	
	public List<PBookDetails> getPAllRecentBook() {
		
		List<PBookDetails> list4=new ArrayList<PBookDetails>();
		PBookDetails p=null;
		try {
			String sql="select * from paddbook  where pstatus=? order by pbid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active" );
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next() ) {
				p=new PBookDetails();
				p.setpId(rs.getInt(1));
				p.setpBookName(rs.getString(2));
				p.setpAuthorName(rs.getString(3));
				p.setpBookLanguage(rs.getString(4));
				p.setpBookYear(rs.getString(6));
				p.setpBookIsbn(rs.getString(5));
				p.setpPrice(rs.getString(7));
				p.setpDiscount(rs.getString(8));
				p.setpPhoto(rs.getString(10));
				p.setpBookStatus(rs.getString(12));
				p.setpRegNo(rs.getString(13));
				p.setpEmail(rs.getString(14));
				p.setAdminDiscount(rs.getString(15));
				
				
				
				list4.add(p);
				
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list4;
			
		
	}





	
	public List<PBookDetails> getPBookBySearch(String ch1) {
		//System.out.println(ch1);
		List<PBookDetails> list=new ArrayList<PBookDetails>();
		PBookDetails b=null;
		
		try {
			String spl="select * from paddbook where pbname like ? or pbauthor like ? or bcatagory like ? or pbprice like ? and pstatus=? ";
			PreparedStatement ps=conn.prepareStatement(spl);
			ps.setString(1,"%"+ch1+"%");
			ps.setString(2,"%"+ch1+"%");
			ps.setString(3,"%"+ch1+"%");
			ps.setString(4,"%"+ch1+"%");
			/* ps.setString(5,"%"+ch1+"%"); */
			ps.setString(5, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new PBookDetails();
				b.setpId(rs.getInt(1));
				b.setpBookName(rs.getString(2));
				b.setpAuthorName(rs.getString(3));
				b.setpBookLanguage(rs.getString(4));
				b.setpBookIsbn(rs.getString(5));
				b.setpBookYear(rs.getString(6));
				b.setpPrice(rs.getString(7));
				b.setpDiscount(rs.getString(8));
				b.setpPage(rs.getString(9));
				b.setpPhoto(rs.getString(10));
				b.setpBookDescription(rs.getString(11));
				b.setpBookStatus(rs.getString(12));
				b.setpRegNo(rs.getString(13));
				b.setpEmail(rs.getString(14));
				b.setAdminDiscount(rs.getString(15));
				
				b.setBookCatagory(rs.getString(17));
				
				
				
				list.add(b);
				
			}
			//System.out.println(list);
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
			
		}
		
		return list;
		
		
		
	}





	
	public List<PBookDetails> getPPAllRecentBook() {
		return null;
	}






	public List<PBookDetails> getPAllNewBook() {
		
		List<PBookDetails> list3=new ArrayList<PBookDetails>();
		PBookDetails b=null;
		try {
			String sql="select * from paddbook  where  pstatus=? order by pbid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			//ps.setString(1,"New" );
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next()) {
				b=new PBookDetails();
				b.setpId(rs.getInt(1));
				b.setpBookName(rs.getString(2));
				b.setpAuthorName(rs.getString(3));
				b.setpBookLanguage(rs.getString(4));
				b.setpBookIsbn(rs.getString(5));
				b.setpBookYear(rs.getString(6));
				b.setpPrice(rs.getString(7));
				b.setpDiscount(rs.getString(8));
				b.setpPage(rs.getString(9));
				b.setpPhoto(rs.getString(10));
				b.setpBookDescription(rs.getString(11));
				b.setpBookStatus(rs.getString(12));
				b.setpRegNo(rs.getString(13));
				b.setpEmail(rs.getString(14));
				b.setAdminDiscount(rs.getString(15));
				
				
				list3.add(b);
				i=i+1;
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list3;
	
	}
	
	
	
	
	
	
	
	

}
