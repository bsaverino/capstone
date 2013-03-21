package edu.ben.cmsc398.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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
				String birthdate = year + "-" + month + "-" + day;
				int gender = 2;
				int areacode = Integer.parseInt(request
						.getParameter("areacode"));
				if (request.getParameter("gender").equals("male"))
					gender = 1;
				else if (request.getParameter("gender").equals("female"))
					gender = 1;

				DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
				Date startDate;
				startDate = df.parse(birthdate);
				String newDateString = df.format(startDate);
				System.out.println(newDateString);

				// Can't get Date to work properly
				System.out.println(birthdate);
				User user = new User(' ',firstName, lastName, username, password,
						email, areacode, gender, startDate);
				System.out.println(user.toString());
				uDao.insertUser(user);
			} catch (ParseException | SQLException e) {
				// TODO Auto-generated catch block
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
				int vehicleId = 0;
				int engine = Integer.parseInt(request.getParameter("engine"));
				userId = uDao.getNewUserId();

				vehicleId = vDao.getNewVehicleId();
				Vehicle vehicle = new Vehicle(make, model, trim, trans, engine,
						color, year, vehicleId, userId);
				vDao.addVehicle(vehicle);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}else if(action.equals("login")) {
			String currentUsername = request.getParameter("currentUsername");
			String password = request.getParameter("password");
			try {
				ArrayList<User> list = uDao.getAllUsers();
//				ArrayList<Vehicle> singleVehicle = vDao.
				for(User user: list) {
//					System.out.println(user.getUsername());
//					System.out.println(user.getPassword());
//					System.out.println(currentUsername);
//					System.out.println(password);
					if (currentUsername.equalsIgnoreCase(user.getUsername())) { 
						
						if (password.equals(user.getPassword())) {
							//session.setAttribute(String userId, user.getId());
							//session.setAttribute(arg0, arg1)
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
