package edu.ben.cmsc398.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ben.cmsc398.dao.*;
import edu.ben.cmsc398.model.User;
import edu.ben.cmsc398.model.Vehicle;
import edu.ben.cmsc398.model.VehicleSpecs;
import edu.ben.cmsc398.model.FuelType;

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
		// System.out.println("Action is: " + action);
		// System.out.println("ID is: " + id);
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		VehicleSpecDao vsDao = new VehicleSpecDao();

		if (action.equals("registerUser")) {
			try {
				String username = request.getParameter("username");
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String email = request.getParameter("email");
				int month = Integer.parseInt(request.getParameter("month"));
				int day = Integer.parseInt(request.getParameter("day"));
				int year = Integer.parseInt(request.getParameter("year"));
				String password = request.getParameter("password");
				int gender = 1;
				int areacode = Integer.parseInt(request
						.getParameter("areacode"));
				if (request.getParameter("gender").equals("male"))
					gender = 1;
				else if (request.getParameter("gender").equals("female"))
					gender = 0;

				User user = new User(' ', firstName, lastName, username,
						password, email, areacode, gender, year, month, day,
						' ');

				int autoId = uDao.insertUser(user);
				session.setAttribute("userId", autoId);

				response.setHeader("Refresh",
						"0; URL=RegistrationPageStage2.jsp");

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
				int def = Integer.parseInt(request.getParameter("default"));
				userId = uDao.getNewUserId();
//				int sessionId = session.getAttribute(arg0)

				User user = uDao.getUser(userId);

				Vehicle vehicle = new Vehicle(make, model, trim, trans, engine,
						color, year, ' ', userId);
				int vId = vDao.addVehicle(vehicle);

				if (user.getDefaultVehicle() == 0) {
					user.setDefaultVehicle(vId);
					uDao.updateUser(user);
					session.setAttribute("vehicleId", vId);
				}else {
					if(def == 1) {
						user.setDefaultVehicle(vId);
						uDao.updateUser(user);
						session.setAttribute("vehicleId", vId);
					}
				}

				/*
				 * This is grabing the fuel type and passing it into the
				 * registraton page 3
				 */
				ArrayList<FuelType> fuel = vsDao.getFuelType();
				request.setAttribute("fuelList", fuel); // respond
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("RegistrationPageStage3.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
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

				if (request.getParameter("nitrous") == "1")
					bsfc = (float) .65;
				else if (request.getParameter("fi") == "1")
					bsfc = (float) .65;
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
				response.setHeader("Refresh", "0; URL=LoggedInIndex.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("login")) {
			String currentUsername = request.getParameter("username");
			String password = request.getParameter("password");
			try {
				ArrayList<User> list = uDao.getAllUsers();

				for (User user : list) {
					if (currentUsername.equalsIgnoreCase(user.getUsername())) {
						System.out.println("I have a username");
						if (password.equals(user.getPassword())) {
							System.out.println("I have a password");
							// ArrayList<Vehicle> singleVehicle =
							// vDao.getAllVehicleByUser(user.getId());
							// int count = vDao.getVehiclesCount(user.getId());
							// int i = 0;
							// String [] vehicles;
							// vehicles = new String[count-1];
							// for(Vehicle car: singleVehicle) {
							// vehicles[i] = String.valueOf(car.getVehicleId());
							//
							// }
							session.setAttribute("userId", user.getId());
							session.setAttribute("vehicleId",
									vDao.getDefaultVehicleId(user.getId()));
							response.setHeader("Refresh",
									"0; URL=LoggedInIndex.jsp");
							break;
						} else {
							System.out.println("bad password");
							response.setHeader("Refresh",
									"0; URL=LoginPage.jsp");
						}
					} else {
						System.out.println("bad username");
						response.setHeader("Refresh",
								"0; URL=LoginPage.jsp");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equals("addVehicleSpec")) {

		}
	}
}
