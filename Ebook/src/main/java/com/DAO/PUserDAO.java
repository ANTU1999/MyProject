package com.DAO;

import java.util.List;

import com.entity.BookDetails;
import com.entity.PUser;
import com.entity.User;

public interface PUserDAO {

	public boolean pUserReg(PUser pus);
	
	public PUser PLogin(String preg,String pass);
	
	public boolean pupdateProfile(PUser pus1);
	
	public boolean pcheckpassword(int id,String ps1);
	

	public List<PUser> getAllPublisher();
	
}
