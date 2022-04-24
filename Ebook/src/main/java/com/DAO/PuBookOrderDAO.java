package com.DAO;

import java.util.List;

import com.entity.BookOrder;

public interface PuBookOrderDAO {
	
	public boolean psaveOrder(List<BookOrder> blist);
	
	public List<BookOrder> pGetBook(String preg);

}
