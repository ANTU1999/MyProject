package com.DAO;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDAO {
	
	//public int getOrderNo();
	
	public boolean saveOrder(List<BookOrder> bo);
	
	public List<BookOrder> getBook(String email12);
	
	public List<BookOrder> getAllBookOrder();

}
