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
		// get the session and get the action(what page needs to be loaded) and what vehicle is selected
		HttpSession session = request.getSession(true);
		String action = (String) request.getParameter("action");
		String selectedVehicleId = (String) request.getParameter("selectedVehicle");
		String breadcrumbs = (String) request.getAttribute("javax.servlet.forward.request_uri");
		System.out.println("I was on page " +breadcrumbs);
		
		// get the session info
		int vehicleId = Integer.parseInt(session.getAttribute("vehicleId").toString());
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		// getting the new default vehicleId
		int newDefaultVehicleId = 0;
		if(selectedVehicleId!=null)
			newDefaultVehicleId= Integer.parseInt(selectedVehicleId);
		// setting up various Daos
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		VehicleSpecDao vsDao = new VehicleSpecDao();
		
		String id = request.getParameter("id");
		//System.out.println("Action is: " + action);
		//System.out.println("ID is: " + id);
		
		// getting a list of all of the user's vehicles
		ArrayList<Vehicle> vehicleList = null;
		try {
			vehicleList = vDao.getAllVehicleByUser(userId);
			request.setAttribute("vehicleList", vehicleList);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if (action.equalsIgnoreCase("loadUserProfile")) { // load UpdateProfile.jsp
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
		} else if (action.equalsIgnoreCase("loadUpdateVehicle")) {	// load UpdateVehicle.jsp
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
		}else if (action.equalsIgnoreCase("loadUpdateVehicleSpec")) {	// load UpdateVehicleSpec.jsp
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
				for(Vehicle v:vehicleList)
					vehicleIdList.add(v.getVehicleId());
				
				System.out.println("ID in v spec table");
				for(Integer v:vehicleIdList)
				{
					System.out.println(v);
					if(vehicleId== v)
						exist = true;
				}
				
				
				// find out which of my vehicles have specs
				for(int j=0;j<vehicleSpecsList.size();j++){
					for(int y=0;y<vehicleIdList.size();y++){
						if(vehicleIdList.get(y)==vehicleSpecsList.get(j).getVehicleId())
							vehicleWithSpecList.add(vDao.getVehicle(vehicleIdList.get(y)));
					}
				}
				
				// find out the default vehicle's specs and return it
				for(Vehicle v:vehicleWithSpecList){
					System.out.println("v with specs: "+v.toString());
					if(v.getVehicleId()== vehicleId)
					{
						request.setAttribute("vehicleSpec", vsDao.getVehicleSpec(vehicleId));
						System.out.println(vsDao.getVehicleSpec(vehicleId).toString());
						found = true;
						break;
					}
				}
				
				// if the default vehicle's specs are not found, assume it hasn't been created
				// so set default vehicleId and the specs to be the first vehicle that has specs
				VehicleSpecs defaultv =null;
				Vehicle defaultvehicle = vehicleWithSpecList.get(0);
				int dvID= defaultvehicle.getVehicleId();
				vsDao.getVehicleSpec(vehicleWithSpecList.indexOf(0));
				if(!found){
						System.out.println("default v has no spec so setting the first one with spec");
						request.setAttribute("vehicleSpec", vsDao.getVehicleSpec(dvID));
						request.getSession().setAttribute("vehicleId", dvID);
				}
				
				defaultv = (VehicleSpecs)request.getAttribute("vehicleSpec");
				
				
				System.out.println("default v "+defaultv);
				request.setAttribute("vehicleWithSpecList", vehicleWithSpecList);				
				request.setAttribute("fuelList", fuel); // respond
				request.setAttribute("exist", exist); // respond
			}catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			// redirect to UpdateVehicleSpec.jsp
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("UpdateVehicleSpec.jsp");
			dispatcher.forward(request, response);
		}else if (action.equalsIgnoreCase("changeDefaultVehicle")) {	// if the the user wants to change the default vehicle in session
			String prevPage = (String) request.getHeader("Referer");
			try {
				System.out.println("default vehicle before "+vehicleId);
				// setting the new vehicleId in the session and in the DB
				request.getSession().setAttribute("vehicleId",newDefaultVehicleId);
				uDao.updateDefaultVehicle(userId, newDefaultVehicleId);
				System.out.println("default vehicle after "+Integer.parseInt(session.getAttribute("vehicleId")
						.toString()));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			// Go back to the previous page
			response.sendRedirect(request.getHeader("referer"));
			
		}else if (action.equalsIgnoreCase("loadAddVehicleSpec")) {	// if the the user wants to change the default vehicle in session
				ArrayList<FuelType> fuel = null;
				
				System.out.println("in servlet");
				// Figure out what vehicles don't have vehicleSpecs
				ArrayList<VehicleSpecs> vehicleSpecsList = null;
				ArrayList<Vehicle> vehicleNoSpecList = new ArrayList<Vehicle>();
				ArrayList<Integer> vehicleIdList = new ArrayList<Integer>();
				ArrayList<Integer> vehicleWithSpecList = new ArrayList<Integer>();
				try {
					vehicleSpecsList = vsDao.getAllVehicleSpec();
					fuel = vsDao.getFuelType();
					// get a list of all vehicleId that I own
					for(Vehicle v:vehicleList)
						vehicleIdList.add(v.getVehicleId());
					
					System.out.println("ID in v spec table");
					for(Integer v:vehicleIdList)
						System.out.println(v);
					
					// find out which of my vehicles have specs
					for(int j=0;j<vehicleSpecsList.size();j++){
						for(int y=0;y<vehicleIdList.size();y++){
							if(vehicleIdList.get(y)==vehicleSpecsList.get(j).getVehicleId())
								vehicleWithSpecList.add(vehicleIdList.get(y));
						}
					}
					
					for(Integer v:vehicleWithSpecList)
						System.out.println("I own ID"+v.toString());

					// Remove all the vehicles that belong to me and has specs so what remains is the vehicleId of those with no specs
					vehicleIdList.removeAll(vehicleWithSpecList);
					
					System.out.println("Removed those with ID so what remains is");
					for(Integer v:vehicleIdList)
						System.out.println(v);
					
					for (Integer x:vehicleIdList)
						vehicleNoSpecList.add(vDao.getVehicle(x));
					
						
					for(Vehicle v:vehicleNoSpecList)
						System.out.println("v w/o spec "+v.toString());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("vehicleNoSpecListSize", vehicleNoSpecList.size());
				request.setAttribute("vehicleNoSpecList", vehicleNoSpecList);
				request.setAttribute("fuelList", fuel); // respond
				if(vehicleNoSpecList.size()>0){
				request.getSession().setAttribute("vehicleId",vehicleNoSpecList.get(0).getVehicleId());
				}else{
					request.getSession().setAttribute("vehicleId",vehicleList.get(0).getVehicleId());
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
		// get the session and get the action(what page needs to be loaded) and what vehicle is selected
		String action = (String) request.getParameter("action");
		String selectedVehicleId = (String) request.getParameter("selectedVehicle");
		
		// get the session info
		int vehicleId = Integer.parseInt(session.getAttribute("vehicleId").toString());
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		
		// getting the new default vehicleId
		int newDefaultVehicleId = 0;
		if(selectedVehicleId!=null)
			newDefaultVehicleId= Integer.parseInt(selectedVehicleId);
		// setting up various Daos
		UserDao uDao = new UserDao();
		VehicleDao vDao = new VehicleDao();
		VehicleSpecDao vsDao = new VehicleSpecDao();
		
		String id = request.getParameter("id");
		//System.out.println("Action is: " + action);
		//System.out.println("ID is: " + id);
		
		// getting a list of all of the user's vehicles
		ArrayList<Vehicle> vehicleList = null;
		try {
			vehicleList = vDao.getAllVehicleByUser(userId);
			request.setAttribute("vehicleList", vehicleList);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if (action.equals("updateUser")) {
			
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
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Profile.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (action.equals("changePassword")) {
			String currentPassword = request.getParameter("currentPassword");
			String newPassword = request.getParameter("newPassword");
			String newPassword2 = request.getParameter("newPassword2");
			try {
				User user = uDao.getUser(userId);
				if (user.getPassword().equals(currentPassword))
					if (newPassword.equals(newPassword2)) {
						user.setPassword(newPassword);
						uDao.updateUser(user);
					}
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Profile.jsp");
				dispatcher.forward(request, response);
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

				User user = uDao.getUser(userId);

				Vehicle vehicle = new Vehicle(make, model, trim, trans, engine,
						color, year, ' ', userId);
				int vId = vDao.addVehicle(vehicle);
				vehicleList = vDao.getAllVehicleByUser(userId);

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
				request.getSession().setAttribute("vehicleList",vehicleList);
				request.getSession().setAttribute("vehicleId",vId);
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Profile.jsp");
				dispatcher.forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (action.equals("addVehicleSpec")) {
			float bsfc, resultCubicInch, resultCompressionRatio, resultFuelInjector;
			int pistonType, syntheticOil;
			try {
				bsfc = resultCubicInch = resultCompressionRatio = resultFuelInjector = 0;
				pistonType = syntheticOil = 0;
				System.out.println("selected v request"+(String) request.getParameter("selectedVehicle"));
				System.out.println(newDefaultVehicleId);
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
				
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Profile.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equalsIgnoreCase("deleteVehicle")) {
			int deleteVehicleId = Integer.parseInt(request.getParameter("Vehicle"));
			System.out.println("delete "+deleteVehicleId);
			String check = request.getParameter("delete");

			if (check.equals("on"))
				try {
					if(deleteVehicleId==vehicleId)
						request.getSession().setAttribute("vehicleId", vehicleList.get(0).getVehicleId());
					uDao.updateDefaultVehicle(userId, vehicleList.get(0).getVehicleId());
					vsDao.deleteVehicleSpecs(deleteVehicleId);
					vDao.deleteVehicle(deleteVehicleId);
					System.out.println("deleted vehicle" + deleteVehicleId);					
					
					System.out.println("new vehicle list");
					vehicleList = vDao.getAllVehicleByUser(userId);
					for(Vehicle v:vehicleList)
						System.out.println(v.toString());
					
					//request.getSession().setAttribute("vehicleId", vehicleList.get(0).getVehicleId());
					System.out.println("new v id: "+vehicleList.get(0).getVehicleId());
					request.getSession().setAttribute("vehicleList",vehicleList);
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("Profile.jsp");
					dispatcher.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else if (action.equalsIgnoreCase("updateVehicle")) {	// if the the user wants to update a vehicle's info
			Vehicle vehicle = null;
			User user;
			
			// get the Vehicle object from DB and put it in a request
			try {
				String make = request.getParameter("make");
				String model = request.getParameter("model");
				String trim = request.getParameter("trim");
				String trans = request.getParameter("trans");
				String color = request.getParameter("color");
				int year = Integer.parseInt(request.getParameter("year"));
				int engine = Integer.parseInt(request.getParameter("engine"));
				int def = Integer.parseInt(request.getParameter("default"));
				
				user = uDao.getUser(userId);
				vehicle = vDao.getVehicle(vehicleId);
				
				vehicle.setColor(color);
				vehicle.setEngine(engine);
				vehicle.setMake(make);
				vehicle.setModel(model);
				vehicle.setTrans(trans);
				vehicle.setTrim(trim);
				vehicle.setYear(year);
				if (def == 1) {
					user.setDefaultVehicle(vehicle.getVehicleId());
					uDao.updateUser(user);
					request.getSession().setAttribute("vehicleId", vehicle.getVehicleId());
				}
				vDao.updateVehicle(vehicle);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("error");
			}
			
			// redirect to UpdateVehicle.jsp
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("Profile.jsp");
			dispatcher.forward(request, response);
		}else if(action.equalsIgnoreCase("updateVehicleSpec")){	// if the the user wants to update a vehicle's spec info
			float bsfc, resultCubicInch, resultCompressionRatio, resultFuelInjector;
			int pistonType, syntheticOil;
			VehicleSpecs vehicleSpecs = null;
			try {
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

				if (request.getParameter("nitrous").equals("nitrous"))
					bsfc = (float) .65;
				else if (request.getParameter("fi").equals("fi"))
					bsfc = (float) .65;
				else
					bsfc = (float) .55;
				
				System.out.println("nitro "+request.getParameter("nitrous"));
				System.out.println("fi "+request.getParameter("fi"));
				System.out.println("na "+request.getParameter("na"));
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
