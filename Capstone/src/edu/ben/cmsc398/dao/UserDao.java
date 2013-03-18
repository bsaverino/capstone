package edu.ben.cmsc398.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import edu.ben.cmsc398.dao.*;
import edu.ben.cmsc398.model.*;

public class UserDao extends DBConnector {
	public User getUser(String username) throws SQLException {
		String sql = "select * from user where username='"+username+"';";
		User user = null;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				int areacode = rs.getInt("area_code");
				Date birthday = rs.getDate("birth_date");
				int gender = rs.getInt("sex");
				String password = rs.getString("password");
				
				user = new User(firstName,lastName,username,password,email,areacode,gender,birthday);
			}
		}
		return user;
	}
	
	public void updateUser(User user) throws SQLException {
		String username = user.getUsername();
		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		String email = user.getEmail();
		int areacode = user.getAreacode();
		Date birthday = user.getBirthday();
		int gender = user.getGender();
		String password = user.getPassword();
		
		String sql = "update user set first_name='"+firstName+"', last_name='"+lastName+"', email='"+email+"', area_code="+areacode+",birth_date='"+birthday+"',sex="+gender+",password='"+password+"' where username='"+username+"';";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}
	
	public void insertUser(User user) throws SQLException {
		String username = user.getUsername();
		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		String email = user.getEmail();
		int areacode = user.getAreacode();
		Date birthday = user.getBirthday();
		int gender = user.getGender();
		String password = user.getPassword();
		
		String sql = "insert into user (first_name, last_name, birth_date, email, area_code,sex,username,password) values ('"+firstName+"','"+lastName+"','"+birthday+"','"+email+"',"+areacode+","+gender+",'"+username+"','"+password+"');";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}
	
	public void deleteUser(String username) throws SQLException {
		String sql = "Delete from user where username='"+username+"';";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}
}
