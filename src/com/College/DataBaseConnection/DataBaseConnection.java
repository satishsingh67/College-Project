package com.College.DataBaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseConnection {
public Connection getDatabaseConnection() {
	Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/college_project","root","Laxmi@1234");
			return conn;
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		
		}
}

}
