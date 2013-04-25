package edu.ben.cmsc398.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import edu.ben.cmsc398.model.Modification;
import edu.ben.cmsc398.model.RaceTime;
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
		VehicleSpecDao vsDao = new VehicleSpecDao();
		PerformanceDao pDao = new PerformanceDao();

		if (action.equals("dashboard")) {
			try {
				float min = 10000;
				int mph = 0;
				int userId = (int) request.getSession().getAttribute("userId");
				int vehicleId = (int) request.getSession().getAttribute(
						"vehicleId");

				VehicleSpecs blankVehicleSpecs = new VehicleSpecs(vehicleId,
						87, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

				ArrayList<Modification> mods = new ArrayList<Modification>();
				ArrayList<RaceTime> times = new ArrayList<RaceTime>();

				mods = pDao.getModificationById(userId, vehicleId);
				times = pDao.getRaceTimeById(userId, vehicleId);
				VehicleSpecs vehicleSpec = vsDao.getVehicleSpec(vehicleId);

				if (vehicleSpec == null)
					vehicleSpec = blankVehicleSpecs;
				for (RaceTime r : times) {
					if (r.getTime() <= min) {
						min = r.getTime();
						mph = r.getSpeed();
					}
				}

				request.setAttribute("min", min); // respond
				request.setAttribute("mph", mph); // respond
				request.setAttribute("vehicleSpec", vehicleSpec); // respond
				request.setAttribute("times", times); // respond
				request.setAttribute("mods", mods); // respond

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("LoggedInIndex.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equals("logOff")) {
			request.getSession().removeAttribute("vehicleList");
			request.getSession().removeAttribute("userId");
			request.getSession().removeAttribute("vehicleId");
			response.setHeader("Refresh", "0; URL=Index.jsp");

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String salt = "*^rz=n]HRuZBVvXhoC1RKX+BJe?_YLL|_|{dZ*6iu|5-{/1+c0B2`WjX04w8{ .f'";
		String action = (String) request.getParameter("action");
		String id = request.getParameter("id");
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
				String hash = password + salt;
				int gender = 1;
				int areacode = Integer.parseInt(request
						.getParameter("areacode"));
				if (request.getParameter("gender").equals("male"))
					gender = 1;
				else if (request.getParameter("gender").equals("female"))
					gender = 0;

				MessageDigest digest = MessageDigest.getInstance("MD5");
				digest.update(hash.getBytes(), 0, hash.length());
				String md5 = new BigInteger(1, digest.digest()).toString(16);

				User user = new User(' ', firstName, lastName, username, md5,
						email, areacode, gender, year, month, day, ' ');

				int autoId = uDao.insertUser(user);

				Vehicle vehicle = new Vehicle(null, null, null, null, 0, null,
						0, ' ', autoId);

				int autoV = vDao.addVehicle(vehicle);

				VehicleSpecs vehicleSpec = new VehicleSpecs(autoV, 87, 0, 0, 0,
						0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

				vsDao.addVehicleSpecs(vehicleSpec);

				request.getSession().setAttribute("userId", autoId);
				request.getSession().setAttribute("vehicleId", autoV);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("RegistrationPageStage2.jsp");
				dispatcher.forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
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
				int engine = Integer.parseInt(request.getParameter("engine"));
				int def = Integer.parseInt(request.getParameter("other"));
				int userId = (int) request.getSession().getAttribute("userId");
				int vId = (int) request.getSession().getAttribute("vehicleId");

				User user = uDao.getUser(userId);
				Vehicle vehicle = new Vehicle(make, model, trim, trans, engine,
						color, year, vId, userId);

				vDao.updateVehicle(vehicle);

				if (user.getDefaultVehicle() == 0) {
					user.setDefaultVehicle(vId);
					uDao.updateUser(user);
				} else {
					if (def == 1) {
						user.setDefaultVehicle(vId);
						uDao.updateUser(user);
					}
				}

				/*
				 * This is grabing the fuel type and passing it into the
				 * registraton page 3
				 */
				ArrayList<Vehicle> vehicleList = vDao
						.getAllVehicleByUser(userId);
				ArrayList<FuelType> fuel = vsDao.getFuelType();
				request.setAttribute("fuelList", fuel); // respond
				request.getSession().setAttribute("vehicleList", vehicleList);
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("RegistrationPageStage3.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("addVehicleSpec")) {
			float bsfc, resultCubicInch, resultCompressionRatio, resultFuelInjector;
			int pistonType, syntheticOil;
			try {
				bsfc = resultCubicInch = resultCompressionRatio = resultFuelInjector = 0;
				pistonType = syntheticOil = 0;
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

				if (request.getParameter("pistonType") == null)
					pistonType = 0;
				else if (request.getParameter("pistonType").equals("dome"))
					pistonType = 1;
				else if (request.getParameter("pistonType").equals("dish"))
					pistonType = -1;

				if (request.getParameter("syntheticOil") == null)
					syntheticOil = 1;
				else if (request.getParameter("syntheticOil").equals("yes"))
					syntheticOil = 1;
				else if (request.getParameter("syntheticOil").equals("no"))
					syntheticOil = 2;

				int vehicleId = (int) request.getSession().getAttribute(
						"vehicleId");

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
				vsDao.updateVehicleSpecs(vehicleSpecs);

				response.setHeader("Refresh",
						"0; URL=RegistrationServlet?action=dashboard");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("login")) {
			try {
				String currentUsername = request.getParameter("username");
				String password = request.getParameter("password");
				String hash = password + salt;

				MessageDigest digest = MessageDigest.getInstance("MD5");
				digest.update(hash.getBytes(), 0, hash.length());
				String md5 = new BigInteger(1, digest.digest()).toString(16);
				System.out.println(md5);

				ArrayList<User> list = uDao.getAllUsers();
				for (User user : list) {
					if (currentUsername.equalsIgnoreCase(user.getUsername())) {
						System.out.println("I have a username");
						if (md5.equals(user.getPassword())) {
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
							ArrayList<Vehicle> vehicleList = vDao
									.getAllVehicleByUser(user.getId());
							request.getSession().setAttribute("vehicleList",
									vehicleList);
							request.getSession().setAttribute("userId",
									user.getId());
							request.getSession().setAttribute("vehicleId",
									vDao.getDefaultVehicleId(user.getId()));
							response.setHeader("Refresh",
									"0; URL=RegistrationServlet?action=dashboard");
							break;
						} else {
							System.out.println("bad password");
							response.setHeader("Refresh",
									"0; URL=LoginPage.jsp");
						}
					} else {
						System.out.println("bad username");
						response.setHeader("Refresh", "0; URL=LoginPage.jsp");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
