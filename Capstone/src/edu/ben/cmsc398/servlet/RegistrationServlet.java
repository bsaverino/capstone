package edu.ben.cmsc398.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ben.cmsc398.dao.*;
import edu.ben.cmsc398.model.*;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
/*	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		int areacode = Integer.parseInt(request.getParameter("areacode"));
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String year = request.getParameter("year");
		String birthdate = year+"-"+month+"-"+day;
		int gender = 0;
		if (request.getParameter("gender").equals("male"))
			gender = 1;
		else if(request.getParameter("gender").equals("female"))
			gender = 2;
		String password = request.getParameter("password");
		
		//Can't get Date to work properly
		System.out.println(birthdate);
		Date birthday = new Date(birthdate);
		User user = new User(firstName,lastName,username,password,email,areacode,gender,birthday);
		System.out.println(user.toString());
		UserDao uDao = new UserDao();
		try {
			uDao.insertUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
/*	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String trim = request.getParameter("trim");
		String trans = request.getParameter("trans");
		int engine = Integer.parseInt(request.getParameter("engine"));
		String color = request.getParameter("color");
		int year = Integer.parseInt(request.getParameter("year"));
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		int userId =0;
		try {
			userId = uDao.getNewUserId();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int vehicleId=0;
		try {
			vehicleId = vDao.getNewVehicleId();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Vehicle vehicle = new Vehicle(make,model,trim,trans,engine,color,year,vehicleId,userId);
		try {
			vDao.addVehicle(vehicle);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String trim = request.getParameter("trim");
		String trans = request.getParameter("trans");
		int engine = Integer.parseInt(request.getParameter("engine"));
		String color = request.getParameter("color");
		int year = Integer.parseInt(request.getParameter("year"));
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		int userId =0;
		try {
			userId = uDao.getNewUserId();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int vehicleId=0;
		try {
			vehicleId = vDao.getNewVehicleId();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Vehicle vehicle = new Vehicle(make,model,trim,trans,engine,color,year,vehicleId,userId);
		try {
			vDao.addVehicle(vehicle);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
