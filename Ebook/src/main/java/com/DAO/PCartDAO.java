package com.DAO;


import java.util.List;


import com.entity.PCart;

public interface PCartDAO {

	
	public boolean pAddCart(PCart c);
	
	public List<PCart> getPBookByUser(int userId);
	
	public boolean pdeleteBook(int cid,int bid,int uid);
}
