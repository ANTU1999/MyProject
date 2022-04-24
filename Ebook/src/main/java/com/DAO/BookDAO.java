package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDAO  {
	
	public boolean addBooks(BookDetails b);
	public boolean addOldBooks(BookDetails b);
		
	public List<BookDetails> getAllBooks();
	//some problem in getBookById() when run get server error 500
	//public BookDetails getBookById(int id);
	//public boolean updateEditBooks(BookDetails b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getNewBook();
	
	public List<BookDetails> getRecentBook();
	
	public List<BookDetails> getOldBook();
	
	public List<BookDetails> getAllRecentBook();
	public List<BookDetails> getAllNewBook();
	public List<BookDetails> getAllOldBook();
	
	public BookDetails getBookByViewId(int id);
	
	public BookDetails getBookById(int id1);
	
	public List<BookDetails> getBookByOldSell(String cate,String email);
	
	public boolean oldBookDeleteUser(int id,String cat,String email);
	
	public List<BookDetails> getBookBySearch(String ch1);
	
	
	

}
