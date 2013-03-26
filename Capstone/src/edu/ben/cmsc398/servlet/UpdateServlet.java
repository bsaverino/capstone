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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String action = (String) request.getParameter("action");
		String id = request.getParameter("id");
		//System.out.println("Action is: " + action);
		//System.out.println("ID is: " + id);
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		
		if (action.equals("updateUser")) {
			String username = request.getParameter("username");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			int month = Integer.parseInt(request.getParameter("month"));
			int day = Integer.parseInt(request.getParameter("day"));
			int year = Integer.parseInt(request.getParameter("year"));
			int gender = 1;
			int areacode = Integer.parseInt(request
					.getParameter("areacode"));
			if (request.getParameter("gender").equals("male"))
				gender = 1;
			else if (request.getParameter("gender").equals("female"))
				gender = 0;

			// Can't get Date to work properly
			User user = null;
			try {
				user = uDao.getUser(username);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			user.setAreacode(areacode);
			user.setDay(day);
			user.setEmail(email);
			user.setFirstName(firstName);
			user.setGender(gender);
			user.setLastName(lastName);
			user.setMonth(month);
			user.setYear(year);
			try {
				uDao.updateUser(user);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("changePassword")){
			String currentPassword = request.getParameter("currentPassword");
			String newPassword = request.getParameter("newPassword");
			String newPassword2 = request.getParameter("newPassword2");
			try {
				User user = uDao.getUser(Integer.parseInt(session.getId()));
				if(user.getPassword().equals(currentPassword))
					if(newPassword.equals(newPassword2)){
						user.setPassword(newPassword);
						uDao.updateUser(user);
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		// Need to add in the Vehicle Specs
		else if(action.equals("addVehicle")){
			try {
				// Don't know if it works in terms of getting session's id
				String make = request.getParameter("make");
				String model = request.getParameter("model");
				String trim = request.getParameter("trim");
				String trans = request.getParameter("trans");
				String color = request.getParameter("color");
				int year = Integer.parseInt(request.getParameter("year"));
				int vehicleId = 0;
				int engine = Integer.parseInt(request.getParameter("engine"));

				vehicleId = vDao.getNewVehicleId();
				Vehicle vehicle = new Vehicle(make, model, trim, trans, engine,
						color, year, vehicleId, Integer.parseInt(session.getId()));
				vDao.addVehicle(vehicle);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equalsIgnoreCase("deleteVehicle")){
			int vehicleId = Integer.parseInt(request.getParameter("Vehicle"));
			String check = request.getParameter("delete");

			if (check.equals("on"))
				try {
					vDao.deleteVehicle(vehicleId);
					System.out.println("deleted");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}

}
