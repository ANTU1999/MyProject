package com.DAO;

import com.entity.User;

public interface UserDAO {
  public boolean userRegister(User us);
  
  public User login(String email, String pass);
  
  public boolean checkpassword(int id,String ps1);
  public boolean updateProfile(User us1);
  
  public boolean checkUser(String email);
  
  
}
