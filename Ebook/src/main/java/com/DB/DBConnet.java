package com.DB;

import java.sql.*;
public class DBConnet {
  private static Connection conn;
  public static Connection  getCon() {
	  try {
		  if(conn==null) {
		  Class.forName("com.mysql.jdbc.Driver");
		  
		  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Ebook-app","root","admin");
	  }
	  }
	  catch(Exception e) {
		  e.printStackTrace();
	  }
	  
	  return conn;
  }
}
