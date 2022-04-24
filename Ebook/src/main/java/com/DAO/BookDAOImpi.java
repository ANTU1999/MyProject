package com.DAO;

import java.sql.Connection;
import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DB.DBConnet;
import com.entity.BookDetails;

public class BookDAOImpi implements BookDAO {

	private Connection conn;
	
	public BookDAOImpi(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDetails b) {
		// TODO Auto-generated method stub
		
		boolean f=false;
		try {
			String sql="insert into addbook(bookname,author,price,bookcategory,status,photo,user_email)values(?,?,?,?,?,?,?)";
		    PreparedStatement ps=conn.prepareStatement(sql);
		    ps.setString(1, b.getBookName());
		    ps.setString(2, b.getAuthor());
		    ps.setString(3, b.getPrice());
		    ps.setString(4, b.getBookCategory());
		    ps.setString(5, b.getStatus());
		    ps.setString(6, b.getPhotoName());
		    ps.setString(7, b.getEmail());
		    
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

	
	public  List<BookDetails> getAllBooks() {
		// TODO Auto-generated method stub
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from addbook";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
/*
	
	public BookDetails getBookById(int id) {
		
		BookDetails bb=null;
		try {
			
			String sql="select * from addbook where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				bb=new BookDetails();
				bb.setBookId(rs.getInt(1));
				bb.setBookName(rs.getString(2));
				bb.setAuthor(rs.getString(3));
				bb.setPrice(rs.getString(4));
				bb.setBookCategory(rs.getString(5));
				bb.setStatus(rs.getString(6));
				bb.setPhotoName(rs.getString(7));
				bb.setEmail(rs.getString(8));
				
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	return bb;
	}
 */
	/*
	@Override
	public boolean updateEditBooks(BookDetails b) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="update addbood set bookname=?,atuthor=?,price=?,status=? where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
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
	
	*/

	
	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String spl="delete from addbook where bookid=?";
			PreparedStatement ps=conn.prepareStatement(spl);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i>0) {
				f=true;
			}
					;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	public List<BookDetails> getNewBook() {
		// TODO Auto-generated method stub
		List<BookDetails> list2=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from addbook  where bookcategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New" );
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list2.add(b);
				i++;
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list2;
	
	}

	
	public List<BookDetails> getRecentBook() {
		
		List<BookDetails> list3=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from addbook  where status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active" );
			
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list3.add(b);
				i=i+1;
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list3;
	
	}

	
	public List<BookDetails> getOldBook() {
		
		List<BookDetails> list4=new ArrayList<BookDetails>();
		BookDetails b2=null;
		try {
			String sql="select * from addbook  where bookcategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old" );
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b2=new BookDetails();
				b2.setBookId(rs.getInt(1));
				b2.setBookName(rs.getString(2));
				b2.setAuthor(rs.getString(3));
				b2.setPrice(rs.getString(4));
				b2.setBookCategory(rs.getString(5));
				b2.setStatus(rs.getString(6));
				b2.setPhotoName(rs.getString(7));
				b2.setEmail(rs.getString(8));
				
				list4.add(b2);
				i=i+1;
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list4;
	}

	
	public List<BookDetails> getAllRecentBook() {
		
		
		List<BookDetails> list3=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from addbook  where status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active" );
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next() ) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list3.add(b);
				
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list3;
		
		
	}

	
	public List<BookDetails> getAllNewBook() {
		
		List<BookDetails> list2=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from addbook  where bookcategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"New" );
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list2.add(b);
				
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list2;
		
		
	}

	
	public List<BookDetails> getAllOldBook() {
		
		List<BookDetails> list4=new ArrayList<BookDetails>();
		BookDetails b2=null;
		try {
			String sql="select * from addbook  where bookcategory=? and status=? order by bookid desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old" );
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b2=new BookDetails();
				b2.setBookId(rs.getInt(1));
				b2.setBookName(rs.getString(2));
				b2.setAuthor(rs.getString(3));
				b2.setPrice(rs.getString(4));
				b2.setBookCategory(rs.getString(5));
				b2.setStatus(rs.getString(6));
				b2.setPhotoName(rs.getString(7));
				b2.setEmail(rs.getString(8));
				
				list4.add(b2);
			
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list4;
	}

	
	public BookDetails getBookByViewId(int id) {
		
		BookDetails bb=null;
		try {
			
			String sql="select * from addbook where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				bb=new BookDetails();
				bb.setBookId(rs.getInt(1));
				bb.setBookName(rs.getString(2));
				bb.setAuthor(rs.getString(3));
				bb.setPrice(rs.getString(4));
				bb.setBookCategory(rs.getString(5));
				bb.setStatus(rs.getString(6));
				bb.setPhotoName(rs.getString(7));
				bb.setEmail(rs.getString(8));
				bb.setBookCondition(rs.getString(9));
				
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	return bb;
	}

	
	public BookDetails getBookById(int id) {
		BookDetails bbb = null;
		try {
			
			String sql="select * from addbook where bookid=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				bbb=new BookDetails();
				bbb.setBookId(rs.getInt(1));
				bbb.setBookName(rs.getString(2));
				bbb.setAuthor(rs.getString(3));
				bbb.setPrice(rs.getString(4));
				bbb.setBookCategory(rs.getString(5));
				bbb.setStatus(rs.getString(6));
				bbb.setPhotoName(rs.getString(7));
				bbb.setEmail(rs.getString(8));
				//bbb.setBookCondition(rs.getString(9));
				
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	return bbb;
	}

	

	
	//Add old Books Details implementation 
	
	@Override
	public boolean addOldBooks(BookDetails b) {
		
		
		boolean f=false;
		try {
			String sql="insert into addbook(bookname,author,price,bookcategory,status,photo,user_email,bookcon)values(?,?,?,?,?,?,?,?)";
		    PreparedStatement ps=conn.prepareStatement(sql);
		    ps.setString(1, b.getBookName());
		    ps.setString(2, b.getAuthor());
		    ps.setString(3, b.getPrice());
		    ps.setString(4, b.getBookCategory());
		    ps.setString(5, b.getStatus());
		    ps.setString(6, b.getPhotoName());
		    ps.setString(7, b.getEmail());
		    ps.setString(8, b.getBookCondition());
		    
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
	public List<BookDetails> getBookByOldSell(String cate, String email) {
		
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		
		try {
			String spl="select * from addbook where bookcategory=? and user_email=?";
			PreparedStatement ps=conn.prepareStatement(spl);
			ps.setString(1,cate);
			ps.setString(2,email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setBookCondition(rs.getString(9));
				list.add(b);
				
			}
			//System.out.println(list);
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
			
		}
		
		
		
		return list;
	}

	@Override
	public boolean oldBookDeleteUser(int id ,String cat, String email) {
		// TODO Auto-generated method stub
		
		boolean f=false;
		
		try {
			String spl="delete from addbook where bookid=? and bookcategory=? and user_email=?";
			PreparedStatement ps=conn.prepareStatement(spl);
			ps.setInt(1,id);
			ps.setString(2,cat);
			ps.setString(3,email);
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
	public List<BookDetails> getBookBySearch(String ch1) {
		
		

		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		
		try {
			String spl="select * from addbook where bookname like ? or author like ? or bookcategory like ? or price like ? and status=? ";
			PreparedStatement ps=conn.prepareStatement(spl);
			ps.setString(1,"%"+ch1+"%");
			ps.setString(2,"%"+ch1+"%");
			ps.setString(3,"%"+ch1+"%");
			ps.setString(4,"%"+ch1+"%");
			ps.setString(5, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setBookCondition(rs.getString(9));
				list.add(b);
				
			}
			//System.out.println(list);
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
			
		}
		
		
		
		return list;
		
		
		
		
	
	}
	
	
	
    
	
	
}
