package edu.ben.cmsc398.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
		// get the session and get the action(what page needs to be loaded) and
		// what vehicle is selected
		HttpSession session = request.getSession(true);
		String action = (String) request.getParameter("action");
		String selectedVehicleId = (String) request
				.getParameter("selectedVehicle");

		// get the session info
		int vehicleId = Integer.parseInt(session.getAttribute("vehicleId")
				.toString());
		int userId = Integer
				.parseInt(session.getAttribute("userId").toString());

		// getting the new default vehicleId
		int newDefaultVehicleId = 0;
		if (selectedVehicleId != null)
			newDefaultVehicleId = Integer.parseInt(selectedVehicleId);

		// setting up various Daos
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		VehicleSpecDao vsDao = new VehicleSpecDao();

		// getting a list of all of the user's vehicles
		ArrayList<Vehicle> vehicleList = null;
		try {
			vehicleList = vDao.getAllVehicleByUser(userId);
			request.setAttribute("vehicleList", vehicleList);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if (action.equalsIgnoreCase("loadUserProfile")) { // load
															// UpdateProfile.jsp
			User user = null;

			// get the User object from DB and put it in a request
			try {
				user = uDao.getUser(userId);
				request.setAttribute("user", user);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			// redirect to UpdateProfile.jsp
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("UpdateProfile.jsp");
			dispatcher.forward(request, response);

		} else if (action.equalsIgnoreCase("loadUpdateVehicle")) { // load
																	// UpdateVehicle.jsp
			Vehicle vehicle = null;

			// get the Vehicle object from DB and put it in a request
			try {
				vehicle = vDao.getVehicle(vehicleId);
				request.setAttribute("vehicle", vehicle);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("error");
			}

			// redirect to UpdateVehicle.jsp
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("UpdateVehicle.jsp");
			dispatcher.forward(request, response);
		} else if (action.equalsIgnoreCase("loadUpdateVehicleSpec")) { // load
																		// UpdateVehicleSpec.jsp
			// Figure out what vehicles don't have vehicleSpecs
			ArrayList<VehicleSpecs> vehicleSpecsList = null;
			ArrayList<Vehicle> vehicleWithSpecList = new ArrayList<Vehicle>();
			ArrayList<Integer> vehicleIdList = new ArrayList<Integer>();
			ArrayList<FuelType> fuel = null;
			VehicleSpecs vehicleSpec = null;
			boolean found = false;
			boolean exist = false;

			try {
				vehicleSpecsList = vsDao.getAllVehicleSpec();
				fuel = vsDao.getFuelType();
				// get a list of all vehicleId that I own
				for (Vehicle v : vehicleList)
					vehicleIdList.add(v.getVehicleId());

				// checking if the vehicleId exists in the list
				for (Integer v : vehicleIdList) {
					if (vehicleId == v)
						exist = true;
				}

				// find out which of my vehicles have specs
				for (int j = 0; j < vehicleSpecsList.size(); j++) {
					for (int y = 0; y < vehicleIdList.size(); y++) {
						if (vehicleIdList.get(y) == vehicleSpecsList.get(j)
								.getVehicleId())
							vehicleWithSpecList.add(vDao
									.getVehicle(vehicleIdList.get(y)));
					}
				}

				// find out the default vehicle's specs and return it
				for (Vehicle v : vehicleWithSpecList) {
					if (v.getVehicleId() == vehicleId) {
						request.setAttribute("vehicleSpec",
								vsDao.getVehicleSpec(vehicleId));
						found = true;
						break;
					}
				}

				// if the default vehicle's specs are not found, assume it
				// hasn't been created
				// so redirect to AddVehicleSpec
				if (!found) {
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("UpdateServlet?action=loadAddVehicleSpec");
					dispatcher.forward(request, response);
					return;
				}
				request.setAttribute("vehicleWithSpecList", vehicleWithSpecList);
				request.setAttribute("fuelList", fuel); // respond
				request.setAttribute("exist", exist); // respond
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// redirect to UpdateVehicleSpec.jsp
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("UpdateVehicleSpec.jsp");
			dispatcher.forward(request, response);
		} else if (action.equalsIgnoreCase("changeDefaultVehicle")) { // if the user wants to change the default vehicle in session
			// getting the previous page
			String prevPage = (String) request.getHeader("Referer");
			try {
				// setting the new vehicleId in the session and in the DB
				request.getSession().setAttribute("vehicleId",
						newDefaultVehicleId);
				uDao.updateDefaultVehicle(userId, newDefaultVehicleId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			// Go back to the previous page
			response.sendRedirect(request.getHeader("referer"));

		} else if (action.equalsIgnoreCase("loadAddVehicleSpec")) { // if the user wants to add a new vehicle spec
			ArrayList<FuelType> fuel = null;

			// Figure out what vehicles don't have vehicleSpecs
			ArrayList<VehicleSpecs> vehicleSpecsList = null;
			ArrayList<Vehicle> vehicleNoSpecList = new ArrayList<Vehicle>();
			ArrayList<Integer> vehicleIdList = new ArrayList<Integer>();
			ArrayList<Integer> vehicleWithSpecList = new ArrayList<Integer>();
			try {
				vehicleSpecsList = vsDao.getAllVehicleSpec();
				fuel = vsDao.getFuelType();
				// get a list of all vehicleId that I own
				for (Vehicle v : vehicleList)
					vehicleIdList.add(v.getVehicleId());

				// find out which of my vehicles have specs
				for (int j = 0; j < vehicleSpecsList.size(); j++) {
					for (int y = 0; y < vehicleIdList.size(); y++) {
						if (vehicleIdList.get(y) == vehicleSpecsList.get(j)
								.getVehicleId())
							vehicleWithSpecList.add(vehicleIdList.get(y));
					}
				}

				// Remove all the vehicles that belong to me and has specs so
				// what remains is the vehicleId of those with no specs
				vehicleIdList.removeAll(vehicleWithSpecList);

				// getting a list of vehicles that don't have specs
				for (Integer x : vehicleIdList)
					vehicleNoSpecList.add(vDao.getVehicle(x));

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("vehicleNoSpecListSize",
					vehicleNoSpecList.size());
			request.setAttribute("vehicleNoSpecList", vehicleNoSpecList);
			request.setAttribute("fuelList", fuel); // respond
			// if there is a vehicle with no specs, set the first one to be the
			// default vehicle in session,
			// else set it to the first vehicle I own
			if (vehicleNoSpecList.size() > 0) {
				request.getSession().setAttribute("vehicleId",
						vehicleNoSpecList.get(0).getVehicleId());
			} else {
				request.getSession().setAttribute("vehicleId",
						vehicleList.get(0).getVehicleId());
			}
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("AddVehicleSpec.jsp");
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
		// get the session and get the action(what page needs to be loaded) and
		// what vehicle is selected
		String salt = "*^rz=n]HRuZBVvXhoC1RKX+BJe?_YLL|_|{dZ*6iu|5-{/1+c0B2`WjX04w8{ .f'";
		String action = (String) request.getParameter("action");
		String selectedVehicleId = (String) request
				.getParameter("selectedVehicle");

		// get the session info
		int vehicleId = Integer.parseInt(session.getAttribute("vehicleId")
				.toString());
		int userId = Integer
				.parseInt(session.getAttribute("userId").toString());

		// getting the new default vehicleId
		int newDefaultVehicleId = 0;
		if (selectedVehicleId != null)
			newDefaultVehicleId = Integer.parseInt(selectedVehicleId);
		// setting up various Daos
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		VehicleSpecDao vsDao = new VehicleSpecDao();

		// getting a list of all of the user's vehicles
		ArrayList<Vehicle> vehicleList = null;
		try {
			vehicleList = vDao.getAllVehicleByUser(userId);
			request.setAttribute("vehicleList", vehicleList);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if (action.equals("updateUser")) { // Update user information
			// getting information from page
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

			// getting user object from DB
			User user = null;
			try {
				user = uDao.getUser(userId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("error");
				e.printStackTrace();
			}
			// updating user information
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
				// updating user information in the DB
				uDao.updateUser(user);
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Profile.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (action.equals("changePassword")) { // Change user password
			// get information from page
			String currentPassword = request.getParameter("currentPassword");
			String newPassword = request.getParameter("newPassword");
			String newPassword2 = request.getParameter("newPassword2");
			String hash1 = currentPassword + salt;
			String newHash2 = newPassword + salt;
			String newHash3 = newPassword2 + salt;

			try {

				MessageDigest digest = MessageDigest.getInstance("MD5");
				digest.update(hash1.getBytes(), 0, hash1.length());
				String currentMd5 = new BigInteger(1, digest.digest())
						.toString(16);
				digest.update(newHash2.getBytes(), 0, newHash2.length());
				String newMd5 = new BigInteger(1, digest.digest()).toString(16);
				digest.update(newHash3.getBytes(), 0, newHash3.length());
				String newMd52 = new BigInteger(1, digest.digest())
						.toString(16);

				// get user object from DB and check password is valid
				User user = uDao.getUser(userId);
				if (user.getPassword().equals(currentMd5))
					if (newMd5.equals(newMd52)) {
						// update user info in DB
						user.setPassword(newMd5);
						uDao.updateUser(user);
					}
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Profile.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (action.equals("addVehicle")) { // if the user wants to add a vehicle
			try {
				// get information from page
				String make = request.getParameter("make");
				String model = request.getParameter("model");
				String trim = request.getParameter("trim");
				String trans = request.getParameter("trans");
				String color = request.getParameter("color");
				int year = Integer.parseInt(request.getParameter("year"));
				int engine = Integer.parseInt(request.getParameter("engine"));
				int def = Integer.parseInt(request.getParameter("default"));

				// getting user information from DB
				User user = uDao.getUser(userId);
				// creating new vehicle object and inserting it to the DB
				Vehicle vehicle = new Vehicle(make, model, trim, trans, engine,
						color, year, ' ', userId);
				int vId = vDao.addVehicle(vehicle);
				// get a list of all my vehicles
				vehicleList = vDao.getAllVehicleByUser(userId);

				// set the default vehicle and update it in the session and DB
				if (user.getDefaultVehicle() == 0) {
					user.setDefaultVehicle(vId);
					uDao.updateUser(user);
					request.getSession().setAttribute("vehicleId", vId);
				} else {
					if (def == 1) {
						user.setDefaultVehicle(vId);
						uDao.updateUser(user);
						request.getSession().setAttribute("vehicleId", vId);
					}
				}
				request.getSession().setAttribute("vehicleList", vehicleList);
				request.getSession().setAttribute("vehicleId", vId);
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Profile.jsp");
				dispatcher.forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (action.equals("addVehicleSpec")) { // Create a vehicle spec
			float bsfc, resultCubicInch, resultCompressionRatio, resultFuelInjector;
			int pistonType, syntheticOil;
			try {
				bsfc = resultCubicInch = resultCompressionRatio = resultFuelInjector = 0;
				pistonType = syntheticOil = 0;

				// getting information from page
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
				// creating VehicleSpecs object and inserting it to DB
				VehicleSpecs vehicleSpec = new VehicleSpecs(vehicleId, 87, 0, 0, 0,
						0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
				vsDao.addVehicleSpecs(vehicleSpec);
				vehicleSpec.setOctane(octane);
				vehicleSpec.setCylinders(cylinders);
				vehicleSpec.setPistonType(pistonType);
				vehicleSpec.setHeadCC(headCC);
				vehicleSpec.setPistonCC(pistonCC);
				vehicleSpec.setSyntheticOil(syntheticOil);
				vehicleSpec.setHp(hp);
				vehicleSpec.setTorque(torque);
				vehicleSpec.setBore(bore);
				vehicleSpec.setStroke(stroke);
				vehicleSpec.setHeadGasketThickness(headGasketThickness);
				vehicleSpec.setHeadGasketBore(headGasketBore);
				vehicleSpec.setDutyCycle(dutyCycle);
				vehicleSpec.setBsfc(bsfc);
				vehicleSpec.setPistonDeckHeight(pistonDeckHeight);
				vehicleSpec.setResultCubicInch(resultCubicInch);
				vehicleSpec.setResultCompressionRatio(resultCompressionRatio);
				vehicleSpec.setResultFuelInjector(resultFuelInjector);

				// Update VehicleSpec in the DB
				vsDao.updateVehicleSpecs(vehicleSpec);
				VehicleSpecs vehicleSpecs = new VehicleSpecs(vehicleId, octane,
						cylinders, pistonType, headCC, pistonCC, syntheticOil,
						hp, torque, bore, stroke, headGasketThickness,
						headGasketBore, dutyCycle, bsfc, pistonDeckHeight,
						resultCubicInch, resultCompressionRatio,
						resultFuelInjector);
				vsDao.addVehicleSpecs(vehicleSpecs);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Profile.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equalsIgnoreCase("deleteVehicle")) { // Delete a vehicle
			// get which vehicle to delete
			int deleteVehicleId = Integer.parseInt(request
					.getParameter("Vehicle"));
			String check = request.getParameter("delete");
			// making sure user really wants to delete it
			if (check.equals("on"))
				try {
					// update user default vehicle and delete the Vehicle and
					// VehicleSpec
					// from the DB
					uDao.updateDefaultVehicle(userId, vehicleList.get(0)
							.getVehicleId());
					vsDao.deleteVehicleSpecs(deleteVehicleId);
					vDao.deleteVehicle(deleteVehicleId);
					// get an update vehicleList
					vehicleList = vDao.getAllVehicleByUser(userId);

					// set the new vehicleList into the session
					request.getSession().setAttribute("vehicleList",
							vehicleList);
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("Profile.jsp");
					dispatcher.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		} else if (action.equalsIgnoreCase("updateVehicle")) { // if the user wants to update vehicle info
			Vehicle vehicle = null;
			User user;
			try {
				// get information from the page
				String make = request.getParameter("make");
				String model = request.getParameter("model");
				String trim = request.getParameter("trim");
				String trans = request.getParameter("trans");
				String color = request.getParameter("color");
				int year = Integer.parseInt(request.getParameter("year"));
				int engine = Integer.parseInt(request.getParameter("engine"));
				int def = Integer.parseInt(request.getParameter("default"));

				// get User Object and Vehicle Object from the DB
				user = uDao.getUser(userId);
				vehicle = vDao.getVehicle(vehicleId);

				// update the Vehicle Object
				vehicle.setColor(color);
				vehicle.setEngine(engine);
				vehicle.setMake(make);
				vehicle.setModel(model);
				vehicle.setTrans(trans);
				vehicle.setTrim(trim);
				vehicle.setYear(year);

				// Update user's default vehicle
				if (def == 1) {
					user.setDefaultVehicle(vehicle.getVehicleId());
					uDao.updateUser(user);
					request.getSession().setAttribute("vehicleId",
							vehicle.getVehicleId());
				}

				// update Vehicle in the DB
				vDao.updateVehicle(vehicle);
				vehicleList = vDao.getAllVehicleByUser(userId);
				request.getSession().setAttribute("vehicleList",vehicleList);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("error");
			}

			// redirect to UpdateVehicle.jsp
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("Profile.jsp");
			dispatcher.forward(request, response);

		} else if (action.equalsIgnoreCase("updateVehicleSpec")) { // if the user wants to update vehicle spec
			float bsfc, resultCubicInch, resultCompressionRatio, resultFuelInjector;
			int pistonType, syntheticOil;
			VehicleSpecs vehicleSpecs = null;
			try {
				// get information from the page
				vehicleSpecs = vsDao.getVehicleSpec(vehicleId);
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
				// update VehicleSpec object
				vehicleSpecs.setOctane(octane);
				vehicleSpecs.setCylinders(cylinders);
				vehicleSpecs.setPistonType(pistonType);
				vehicleSpecs.setHeadCC(headCC);
				vehicleSpecs.setPistonCC(pistonCC);
				vehicleSpecs.setSyntheticOil(syntheticOil);
				vehicleSpecs.setHp(hp);
				vehicleSpecs.setTorque(torque);
				vehicleSpecs.setBore(bore);
				vehicleSpecs.setStroke(stroke);
				vehicleSpecs.setHeadGasketThickness(headGasketThickness);
				vehicleSpecs.setHeadGasketBore(headGasketBore);
				vehicleSpecs.setDutyCycle(dutyCycle);
				vehicleSpecs.setBsfc(bsfc);
				vehicleSpecs.setPistonDeckHeight(pistonDeckHeight);
				vehicleSpecs.setResultCubicInch(resultCubicInch);
				vehicleSpecs.setResultCompressionRatio(resultCompressionRatio);
				vehicleSpecs.setResultFuelInjector(resultFuelInjector);

				// Update VehicleSpec in the DB
				vsDao.updateVehicleSpecs(vehicleSpecs);

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Profile.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
