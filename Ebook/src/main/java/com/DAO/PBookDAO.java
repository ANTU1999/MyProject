package com.DAO;

import java.util.List;

import com.entity.BookDetails;
import com.entity.PBookDetails;

public interface PBookDAO {

	
	public boolean pBooksAdd(PBookDetails pb);
	
	public List<PBookDetails> getAllBooks();
	
	public List<PBookDetails> getBookBySell(String regno);
	
	public boolean deleteBook(String regno,int id2);
	
	public PBookDetails getBookById(int id1);
	
	public boolean updateEditBooks(PBookDetails b);
	
	public boolean adminUpdateEditBooks(PBookDetails b);
	
	public boolean pAdminDeleteBook(int id5);
	
	public List<PBookDetails> getPuNewBook();
	
	//public PBookDetails getPBookById(int id1);
	public PBookDetails getPBookByViewId(int id);
	
	public List<PBookDetails> getPAllRecentBook();
	
	public List<PBookDetails> getPBookBySearch(String ch1);
	
	public List<PBookDetails> getPPAllRecentBook();
	public List<PBookDetails> getPAllNewBook();
	
}
