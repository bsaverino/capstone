package edu.ben.cmsc398.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Calendar;

public class DBConnector {
	
	Connection conn;
	
	public DBConnector() {
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			conn = DriverManager.getConnection("jdbc:mysql://174.121.2.194:3306/cmsc374_capstone?user=cmsc374_Brad&password=Pollack");
			
		}catch(SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState:" + ex.getSQLState());
			System.out.println("VendorError: "+ ex.getErrorCode());
		}
	}
	public Connection getConnection() {
		return conn;
	}
	
	public void closeConnection() {
		try {
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
