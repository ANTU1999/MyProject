package com.DAO;

import java.util.List;

import com.entity.BookDetails;
import com.entity.PBookDetails;
import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean deleteBook(int cid,int bid,int uid);
	
}