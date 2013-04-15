package edu.ben.cmsc398.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ben.cmsc398.dao.MaintenanceDao;
import edu.ben.cmsc398.dao.UserDao;
import edu.ben.cmsc398.dao.VehicleDao;
import edu.ben.cmsc398.dao.VehicleSpecDao;
import edu.ben.cmsc398.model.Maintenance;
import edu.ben.cmsc398.model.Services;

/**
 * Servlet implementation class TrackingServlet
 */
@WebServlet("/TrackingServlet")
public class TrackingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TrackingServlet() {
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
		System.out.println("Action is: " + action);
		System.out.println("ID is: " + id);
		MaintenanceDao mDao = new MaintenanceDao();

		if (action.equals("getMaintenance")) {
			try {
				System.out.println("in getMaintenance");
				int userId = (int) request.getSession().getAttribute("userId");
				int vehicleId = (int) request.getSession().getAttribute(
						"vehicleId");

				ArrayList<Maintenance> records = new ArrayList<Maintenance>();
				records = mDao.getMaintenanceByUser(userId, vehicleId);

				request.setAttribute("maintenanceRecord", records); // respond
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Maintenance.jsp");
				dispatcher.forward(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("addForwardMaintenance")) {
			try {
				ArrayList<Services> service = new ArrayList<Services>();
				service = mDao.getServices();

				request.setAttribute("service", service); // respond
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("MaintenanceAddService.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
		System.out.println("Action is: " + action);
		System.out.println("ID is: " + id);
		MaintenanceDao mDao = new MaintenanceDao();

		if (action.equals("addMaintenance")) {
			try {
				int userId = (int) request.getSession().getAttribute("userId");
				int vehicleId = (int) request.getSession().getAttribute(
						"vehicleId");
				int serviceId = Integer.parseInt(request
						.getParameter("services"));
				String date = request.getParameter("date");
				float mileage = Float.parseFloat(request
						.getParameter("mileage"));

				Maintenance service = new Maintenance(0, serviceId, vehicleId,
						userId, mileage, date);

				mDao.insertMaintenance(service);
				
				response.setHeader("Refresh", "0; URL=TrackingServlet?action=getMaintenance");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("editMaintenance")) {

		} else if (action.equals("deleteMaintenance")) {

		}

		if (action.equals("getPerformance")) {

		} else if (action.equals("addMod")) {

		} else if (action.equals("editMod")) {

		} else if (action.equals("deleteMod")) {

		} else if (action.equals("addRace")) {

		} else if (action.equals("editRace")) {

		} else if (action.equals("deleteRace")) {

		}

	}

}
