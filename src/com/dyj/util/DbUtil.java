package com.dyj.util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DbUtil {
	  private String url = "jdbc:mysql://localhost:3306/smis";
	  private String userName = "root";
	  private String userPassword = "root";
	  private String jdbcName = "com.mysql.jdbc.Driver";
	  
	  public Connection getCon() throws Exception{
		  Class.forName(jdbcName);
		  Connection con = DriverManager.getConnection(url,userName,userPassword);
		  return con;
	  }
	  public void closeCon(Connection con) throws Exception{
		  if(con!=null){
			  con.close();
		  }
	  }
	  
	 
	}


