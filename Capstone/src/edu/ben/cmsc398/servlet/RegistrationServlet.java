package edu.ben.cmsc398.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String action = (String) request.getParameter("action");
		String id = request.getParameter("id");
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String action = (String) request.getParameter("action");
		String id = request.getParameter("id");
		//System.out.println("Action is: " + action);
		//System.out.println("ID is: " + id);
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		VehicleSpecDao vsDao = new VehicleSpecDao();

		if (action.equals("registerUser")) {
			try {
				String username = request.getParameter("username");
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String email = request.getParameter("email");
				String month = request.getParameter("month");
				String day = request.getParameter("day");
				String year = request.getParameter("year");
				String password = request.getParameter("password");
				int gender = 2;
				int areacode = Integer.parseInt(request.getParameter("areacode"));
				if (request.getParameter("gender").equals("male"))
					gender = 1;
				else if (request.getParameter("gender").equals("female"))
					gender = 1;



				// Can't get Date to work properly
				User user = new User(' ',firstName, lastName, username, password,
						email, areacode, gender, year, month, day);
				System.out.println(user.toString());
				uDao.insertUser(user);
				response.setHeader("Refresh", "0; URL=RegistrationPageStage2.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equals("registerVehicle")) {
			try {
				String make = request.getParameter("make");
				String model = request.getParameter("model");
				String trim = request.getParameter("trim");
				String trans = request.getParameter("trans");
				String color = request.getParameter("color");
				int year = Integer.parseInt(request.getParameter("year"));
				int userId = 0;
				int engine = Integer.parseInt(request.getParameter("engine"));
				userId = uDao.getNewUserId();

				Vehicle vehicle = new Vehicle(make, model, trim, trans, engine,
						color, year, ' ', userId);
				vDao.addVehicle(vehicle);
				
				/* This is grabing the fuel type and passing it into the registraton page 3 */
				ArrayList<FuelType> fuel = vsDao.getFuelType();
				request.setAttribute("fuelList", fuel); // respond
				RequestDispatcher dispatcher = request.getRequestDispatcher("RegistrationPageStage3.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}else if(action.equals("login")) {
			String currentUsername = request.getParameter("currentUsername");
			String password = request.getParameter("password");
			try {
				ArrayList<User> list = uDao.getAllUsers();
				
				for(User user: list) {
					if (currentUsername.equalsIgnoreCase(user.getUsername())) { 
						
						if (password.equals(user.getPassword())) {
//							ArrayList<Vehicle> singleVehicle = vDao.getAllVehicleByUser(user.getId());
//							int count = vDao.getVehiclesCount(user.getId());
//							int i = 0;
//							String [] vehicles;
//							vehicles = new String[count-1];
//							for(Vehicle car: singleVehicle) {
//								vehicles[i] = String.valueOf(car.getVehicleId()); 
//								
//							}
							String userId = String.valueOf(user.getId());
							session.setAttribute(userId, user.getId());
							response.setHeader("Refresh", "0; URL=LoggedInIndex.jsp");
						}
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		else if(action.equals("addVehicleSpec")){
			
		}
	}

}
