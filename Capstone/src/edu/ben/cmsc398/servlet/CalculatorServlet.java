package edu.ben.cmsc398.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ben.cmsc398.dao.VehicleSpecDao;
import edu.ben.cmsc398.model.VehicleSpecs;

/**
 * Servlet implementation class CalculatorServlet
 */
@WebServlet("/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculatorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String action = (String) request.getParameter("action");
		
		// get the session info
		int vehicleId = Integer.parseInt(session.getAttribute("vehicleId").toString());
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		VehicleSpecDao vsDao = new VehicleSpecDao();
		VehicleSpecs vehicle = null;
		try {
			vehicle = vsDao.getVehicleSpec(vehicleId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (action.equalsIgnoreCase("loacCRCalc")) { // load UpdateProfile.jsp
			
			request.setAttribute("bore",vehicle.getBore());
			request.setAttribute("stroke",vehicle.getStroke());
			request.setAttribute("headCC",vehicle.getHeadCC());
			request.setAttribute("pistonDeckHeight",vehicle.getPistonDeckHeight());
			request.setAttribute("pistonType",vehicle.getPistonType());
			request.setAttribute("pistonCC",vehicle.getPistonCC());
			request.setAttribute("headGasketThickness",vehicle.getHeadGasketThickness());
			request.setAttribute("headGasketBore",vehicle.getHeadGasketBore());
			request.setAttribute("resultCompressionRatio",vehicle.getResultCompressionRatio());
			
			// redirect to UpdateProfile.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher("CompressionRatioCalc.jsp");
			dispatcher.forward(request, response);
		}else if (action.equalsIgnoreCase("loacCICalc")) { // load UpdateProfile.jsp
			
			request.setAttribute("bore",vehicle.getBore());
			request.setAttribute("stroke",vehicle.getStroke());
			request.setAttribute("cylinders",vehicle.getCylinders());
			request.setAttribute("resultCubicInch",vehicle.getResultCubicInch());
			
			// redirect to UpdateProfile.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher("CubicInchCalc.jsp");
			dispatcher.forward(request, response);
		}
		else if (action.equalsIgnoreCase("loacFICalc")) { // load UpdateProfile.jsp
			
			request.setAttribute("hp",vehicle.getHp());
			request.setAttribute("cylinders",vehicle.getCylinders());
			request.setAttribute("dutyCycle",vehicle.getDutyCycle());
			request.setAttribute("bsfc",vehicle.getBsfc());
			request.setAttribute("resultFuelInjector",vehicle.getResultFuelInjector());
			
			// redirect to UpdateProfile.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher("FuelInjectorCalc.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// testing pull and commit. reinstalled windows so setting it up again 
	}

}
