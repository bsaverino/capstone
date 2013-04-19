package edu.ben.cmsc398.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.cmsc398.model.*;

public class UserDao extends DBConnector {

	public User getUser(String username) throws SQLException {
		Connection conn = getConnection();
		String sql = "select * from user where username='" + username + "';";
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
				int year = rs.getInt("year");
				int day = rs.getInt("day");
				int month = rs.getInt("month");
				int gender = rs.getInt("sex");
				String password = rs.getString("password");
				int def = rs.getInt("default_vehicle");

				user = new User(userId, firstName, lastName, username,
						password, email, areacode, gender, year, month, day,
						def);
			}
			closeConnection();
			return user;
		}
		closeConnection();
		return null;

	}

	public User getUser(int userId) throws SQLException {
		Connection conn = getConnection();
		String sql = "select * from user where user_id='" + userId + "';";
		User user = null;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				int areacode = rs.getInt("area_code");
				int year = rs.getInt("year");
				int day = rs.getInt("day");
				int month = rs.getInt("month");
				int gender = rs.getInt("sex");
				String username = rs.getString("username");
				String password = rs.getString("password");
				int def = rs.getInt("default_vehicle");

				user = new User(userId, firstName, lastName, username,
						password, email, areacode, gender, year, month, day,
						def);
			}
			closeConnection();
			return user;
		}
		closeConnection();
		return null;
	}

	public void updateUser(User user) throws SQLException {
		Connection conn = getConnection();
		String username = user.getUsername();
		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		String email = user.getEmail();
		int areacode = user.getAreacode();
		int year = user.getYear();
		int day = user.getDay();
		int month = user.getMonth();
		int gender = user.getGender();
		int def = user.getDefaultVehicle();
		String password = user.getPassword();

		String sql = "update user set first_name='" + firstName
				+ "', last_name='" + lastName + "', email='" + email
				+ "', area_code=" + areacode + ",year='" + year + "',month='"
				+ month + "',day='" + day + "',sex=" + gender + ",password='"
				+ password + "', default_vehicle='" + def
				+ "' where username='" + username + "';";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		closeConnection();
	}

	public int insertUser(User user) throws SQLException {
		Connection conn = getConnection();
		String sql = "insert into user (first_name, last_name, year, month, day, email, area_code,sex,username,password) values (?,?,?,?,?,?,?,?,?,?);";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = null;
		int autoId = -1;

		ps.setString(9, user.getUsername());
		ps.setString(1, user.getFirstName());
		ps.setString(2, user.getLastName());
		ps.setString(6, user.getEmail());
		ps.setInt(7, user.getAreacode());
		ps.setInt(3, user.getYear());
		ps.setInt(5, user.getDay());
		ps.setInt(4, user.getMonth());
		ps.setInt(8, user.getGender());
		ps.setString(10, user.getPassword());

		ps.execute();

		ps = conn.prepareStatement("select last_insert_id()");
		rs = ps.executeQuery();

		if (rs.next()) {
			autoId = rs.getInt(1);
			closeConnection();
			return autoId;
		}
		closeConnection();
		return 0;
	}

	public void deleteUser(String username) throws SQLException {
		Connection conn = getConnection();
		String sql = "Delete from user where username='" + username + "';";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		closeConnection();
	}

	public int getUserId(String username) throws SQLException {
		Connection conn = getConnection();
		String sql = "select user_id from user where username='" + username
				+ "';";
		int userId = 0;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				userId = rs.getInt("user_id");
			}
			closeConnection();
			return userId;
		}
		closeConnection();
		return 0;

	}

	public int getNewUserId() throws SQLException {
		Connection conn = getConnection();
		String sql = "select Max(user_id) as user_id from user;";
		int userId = 0;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				userId = rs.getInt("user_id");
			}
			closeConnection();
			return userId;
		}
		closeConnection();
		return 0;
	}

	public ArrayList<User> getAllUsers() throws SQLException {
		Connection conn = getConnection();
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
				int year = rs.getInt("year");
				int day = rs.getInt("day");
				int month = rs.getInt("month");
				int gender = rs.getInt("sex");
				int def = rs.getInt("default_vehicle");
				User s = new User(id, firstName, lastName, username, password,
						email, areaCode, gender, year, month, day, def);
				// System.out.println(s);
				users.add(s);

			}
			closeConnection();
			return users;
		}
		closeConnection();
		return null;

	}

	public void updateDefaultVehicle(int userId, int vehicleId)
			throws SQLException {
		Connection conn = getConnection();
		String sql = "update user set default_vehicle='" + vehicleId
				+ "' where user_id='" + userId + "';";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		closeConnection();
	}
}
