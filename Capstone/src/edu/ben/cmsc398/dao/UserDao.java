package edu.ben.cmsc398.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import edu.ben.cmsc398.model.*;

public class UserDao extends DBConnector {
	public User getUser(String username) throws SQLException {
		String sql = "select * from user where username='"+username+"';";
		User user = null;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				int userId = rs.getInt("user_id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				int areacode = rs.getInt("area_code");
				String year = rs.getString("year");
				String day = rs.getString("day");
				String month = rs.getString("month");
				int gender = rs.getInt("sex");
				String password = rs.getString("password");
				
				user = new User(userId, firstName,lastName,username,password,email,areacode,gender,year, month,day);
			}
		}
		return user;
	}
	public User getUser(int userId) throws SQLException {
		String sql = "select * from user where user_id='"+userId+"';";
		User user = null;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				int areacode = rs.getInt("area_code");
				String year = rs.getString("year");
				String day = rs.getString("day");
				String month = rs.getString("month");
				int gender = rs.getInt("sex");
				String username = rs.getString("username");
				String password = rs.getString("password");
				
				user = new User(userId, firstName,lastName,username,password,email,areacode,gender, year, month, day);
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
		String year = user.getYear();
		String day = user.getMonth();
		String month = user.getDay();
		int gender = user.getGender();
		String password = user.getPassword();
		
		String sql = "update user set first_name='"+firstName+"', last_name='"+lastName+"', email='"+email+"', area_code="+areacode+",year='"+year+"',month='"+month+"',day='"+day+"',sex="+gender+",password='"+password+"' where username='"+username+"';";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}
	
	public void insertUser(User user) throws SQLException {
		String username = user.getUsername();
		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		String email = user.getEmail();
		int areacode = user.getAreacode();
		String year = user.getYear();
		String day = user.getMonth();
		String month = user.getDay();
		int gender = user.getGender();
		String password = user.getPassword();
		
		String sql = "insert into user (first_name, last_name, year, month, day, email, area_code,sex,username,password) values ('"+firstName+"','"+lastName+"','"+year+"','"+month+"','"+day+"','"+email+"',"+areacode+","+gender+",'"+username+"','"+password+"');";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}
	
	public void deleteUser(String username) throws SQLException {
		String sql = "Delete from user where username='"+username+"';";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}
	
	public int getUserId(String username) throws SQLException{
		String sql = "select user_id from user where username='"+username+"';";	
		int userId = 0;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				userId  = rs.getInt("user_id");
			}
		}
		return userId;
	}
	public int getNewUserId() throws SQLException{
		String sql = "select Max(user_id) as user_id from user;";	
		int userId = 0;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				userId  = rs.getInt("user_id");
			}
		}
		return userId;
	}
	public ArrayList<User> getAllUsers() throws SQLException{
		String sql = "select * from user";
		ArrayList<User> users = new ArrayList<User>();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if (rs != null) {
			while (rs.next()) {
				int id = rs.getInt("user_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				int areaCode = rs.getInt("area_code");
				String year = rs.getString("year");
				String day = rs.getString("day");
				String month = rs.getString("month");
				int gender = rs.getInt("sex");
				User s = new User(id, firstName, lastName, username, password, email, areaCode, gender, year, month, day);
				//System.out.println(s);
				users.add(s);

			}
			conn.close();
			return users;
		}
		conn.close();
		return null;
		
	}
}
