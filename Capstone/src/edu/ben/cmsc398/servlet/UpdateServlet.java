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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String action = (String) request.getParameter("action");
		String selectedVehicleId = (String) request.getParameter("selectedVehicle");
		int vehicleId = Integer.parseInt(session.getAttribute("vehicleId")
				.toString());
		int userId = Integer.parseInt(session.getAttribute("userId")
				.toString());
		int newDefaultVehicleId = 0;
		if(selectedVehicleId!=null)
			newDefaultVehicleId= Integer.parseInt(selectedVehicleId);
		
		String id = request.getParameter("id");
		//System.out.println("Action is: " + action);
		//System.out.println("ID is: " + id);
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		VehicleSpecDao vsDao = new VehicleSpecDao();

		if (action.equalsIgnoreCase("loadUserProfile")) {
			User user = null;
			String firstName, lastName, email;
			int month, day, year, gender, areacode;

			try {
				user = uDao.getUser(userId);
				firstName = user.getFirstName();
				lastName = user.getLastName();
				email = user.getEmail();
				month = user.getMonth();
				day = user.getDay();
				year = user.getYear();
				gender = user.getGender();
				areacode = user.getAreacode();
				request.setAttribute("user", user);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("error");
			}

			RequestDispatcher dispatcher = request
					.getRequestDispatcher("UpdateProfile.jsp");
			dispatcher.forward(request, response);
		} else if (action.equalsIgnoreCase("loadVehicle")) {

			ArrayList<Vehicle> vehicleList = null;
			Vehicle vehicle = null;
			String firstName, lastName, email;
			int month, day, year, gender, areacode;
			
			try {
				vehicle = vDao.getVehicle(vehicleId);
				vehicleList = vDao.getAllVehicleByUser(userId);
				request.setAttribute("vehicle", vehicle);
				request.setAttribute("vehicleList", vehicleList);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("error");
			}

			RequestDispatcher dispatcher = request
					.getRequestDispatcher("UpdateVehicle.jsp");
			dispatcher.forward(request, response);
		}else if (action.equalsIgnoreCase("loadVehicleSpec")) {

			
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("UpdateVehicle.jsp");
			dispatcher.forward(request, response);
		}else if (action.equalsIgnoreCase("changeDefaultVehicle")) {
			try {
				System.out.println("default vehicle before "+vehicleId);
				request.getSession().setAttribute("vehicleId",newDefaultVehicleId);
				uDao.updateDefaultVehicle(userId, newDefaultVehicleId);
				System.out.println("default vehicle after "+Integer.parseInt(session.getAttribute("vehicleId")
						.toString()));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("UpdateServlet?action=loadVehicle");
			dispatcher.forward(request, response);
		}
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
		// System.out.println("Action is: " + action);
		// System.out.println("ID is: " + id);
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		VehicleSpecDao vsDao = new VehicleSpecDao();

		if (action.equals("updateUser")) {
			int userId = Integer.parseInt(session.getAttribute("userId")
					.toString());
			int vehicleId = Integer.parseInt(session.getAttribute("vehicleId")
					.toString());
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			int month = Integer.parseInt(request.getParameter("month"));
			int day = Integer.parseInt(request.getParameter("day"));
			int year = Integer.parseInt(request.getParameter("year"));
			int gender = 1;
			int areacode = Integer.parseInt(request.getParameter("areacode"));
			if (request.getParameter("gender").equals("male"))
				gender = 1;
			else if (request.getParameter("gender").equals("female"))
				gender = 0;

			// Can't get Date to work properly
			User user = null;
			try {
				user = uDao.getUser(userId);
				System.out.println("User before: " + user.toString());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("error");
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
			user.setDefaultVehicle(vehicleId);
			try {
				System.out.println("User after: " + user.toString());
				uDao.updateUser(user);
				response.setHeader("Refresh", "0; URL=Profile.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (action.equals("changePassword")) {
			String currentPassword = request.getParameter("currentPassword");
			String newPassword = request.getParameter("newPassword");
			String newPassword2 = request.getParameter("newPassword2");
			try {
				User user = uDao.getUser(Integer.parseInt(session.getAttribute(
						"userId").toString()));
				if (user.getPassword().equals(currentPassword))
					if (newPassword.equals(newPassword2)) {
						user.setPassword(newPassword);
						uDao.updateUser(user);
						response.setHeader("Refresh", "0; URL=Profile.jsp");
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// Need to add in the Vehicle Specs
		else if (action.equals("addVehicle")) {
			try {

				String make = request.getParameter("make");
				String model = request.getParameter("model");
				String trim = request.getParameter("trim");
				String trans = request.getParameter("trans");
				String color = request.getParameter("color");
				int year = Integer.parseInt(request.getParameter("year"));
				int engine = Integer.parseInt(request.getParameter("engine"));
				int def = Integer.parseInt(request.getParameter("default"));
				int userId = (int) session.getAttribute("userId");
				User user = uDao.getUser(userId);

				Vehicle vehicle = new Vehicle(make, model, trim, trans, engine,
						color, year, ' ', userId);
				int vId = vDao.addVehicle(vehicle);

				if (def == 1) {
					user.setDefaultVehicle(vId);
					uDao.updateUser(user);
					session.setAttribute("vehicleId", vId);
				}
				response.setHeader("Refresh", "0; URL=Profile.jsp");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (action.equals("addVehicleSpec")) {
			float bsfc, resultCubicInch, resultCompressionRatio, resultFuelInjector;
			int pistonType, syntheticOil, vehicleId;
			try {
				bsfc = resultCubicInch = resultCompressionRatio = resultFuelInjector = 0;
				pistonType = syntheticOil = vehicleId = 0;
				int octane = Integer.parseInt(request.getParameter("fuel"));
				int cylinders = Integer.parseInt(request
						.getParameter("cylinders"));
				int headCC = Integer.parseInt(request.getParameter("headCC"));
				int pistonCC = Integer.parseInt(request
						.getParameter("pistonCC"));
				float hp = Float.parseFloat(request.getParameter("hp"));
				float torque = Float.parseFloat(request.getParameter("torque"));
				float bore = Float.parseFloat(request.getParameter("bore"));
				float stroke = Float.parseFloat(request.getParameter("stroke"));
				float headGasketThickness = Float.parseFloat(request
						.getParameter("headGasketThickness"));
				float headGasketBore = Float.parseFloat(request
						.getParameter("headGasketBore"));
				float pistonDeckHeight = Float.parseFloat(request
						.getParameter("pistonDeckHeight"));
				float dutyCycle = (float) .80;

				if (request.getParameter("nitrous").equals("nitrous"))
					bsfc = (float) .65;
				else if (request.getParameter("fi").equals("fi"))
					bsfc = (float) .65;
				else if (request.getParameter("na").equals("na"))
					bsfc = (float) .55;
				else
					bsfc = (float) .55;

				if (request.getParameter("pistonType").equals("dome"))
					pistonType = 1;
				else if (request.getParameter("pistonType").equals("dish"))
					pistonType = -1;
				else
					pistonType = 0;

				if (request.getParameter("syntheticOil").equals("yes"))
					syntheticOil = 1;
				else if (request.getParameter("syntheticOil").equals("no"))
					syntheticOil = 2;
				else
					syntheticOil = 0;

				// Change to whatever is selected in dropdown
				vehicleId = vDao.getNewVehicleId();

				// Gets Cubic Inch result for storage
				if (bore != 0 && stroke != 0 && cylinders != 0) {
					resultCubicInch = (float) ((bore * bore) * stroke
							* 0.7853982 * cylinders);
				}

				// Gets Compression Ratio result for storage
				if (bore != 0 && stroke != 0 && pistonType != 0
						&& pistonDeckHeight != 0 && headCC != 0
						&& pistonCC != 0 && headGasketThickness != 0
						&& headGasketBore != 0) {
					float CYV = (float) (0.7853982 * (bore * bore) * stroke);
					float CLV = (float) (0.7853982 * (bore * bore) * pistonDeckHeight);
					float PCC = (float) ((pistonType * pistonCC) * 0.0610237);
					float HG = (float) (0.7853982 * Math.pow(headGasketBore, 2) * headGasketThickness);
					float HCC = (float) (0.0610237 * headCC);
					resultCompressionRatio = (CYV + CLV + PCC + HG + HCC)
							/ (CLV + PCC + HG + HCC);
				}

				// Gets Fuel Injector size for storage
				if (hp != 0 && bsfc != 0 && cylinders != 0) {
					resultFuelInjector = (hp * bsfc) / (cylinders * dutyCycle);
				}

				VehicleSpecs vehicleSpecs = new VehicleSpecs(vehicleId, octane,
						cylinders, pistonType, headCC, pistonCC, syntheticOil,
						hp, torque, bore, stroke, headGasketThickness,
						headGasketBore, dutyCycle, bsfc, pistonDeckHeight,
						resultCubicInch, resultCompressionRatio,
						resultFuelInjector);
				vsDao.addVehicleSpecs(vehicleSpecs);
				response.setHeader("Refresh", "0; URL=Profile.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equalsIgnoreCase("deleteVehicle")) {
			int vehicleId = Integer.parseInt(request.getParameter("Vehicle"));
			String check = request.getParameter("delete");

			if (check.equals("on"))
				try {
					vDao.deleteVehicle(vehicleId);
					response.setHeader("Refresh", "0; URL=Profile.jsp");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}

}
