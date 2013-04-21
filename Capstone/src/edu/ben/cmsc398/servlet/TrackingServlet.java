package edu.ben.cmsc398.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ben.cmsc398.dao.MaintenanceDao;
import edu.ben.cmsc398.dao.PerformanceDao;
import edu.ben.cmsc398.dao.UserDao;
import edu.ben.cmsc398.dao.VehicleDao;
import edu.ben.cmsc398.dao.VehicleSpecDao;
import edu.ben.cmsc398.model.Maintenance;
import edu.ben.cmsc398.model.Modification;
import edu.ben.cmsc398.model.RaceTime;
import edu.ben.cmsc398.model.RaceType;
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
		PerformanceDao pDao = new PerformanceDao();

		if (action.equals("getMaintenance")) {
			try {
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

		} else if (action.equals("getPerformance")) {
			try {
				int userId = (int) request.getSession().getAttribute("userId");
				int vehicleId = (int) request.getSession().getAttribute(
						"vehicleId");

				System.out.println("got the user and vehicle");

				ArrayList<Modification> mods = new ArrayList<Modification>();
				ArrayList<RaceTime> times = new ArrayList<RaceTime>();

				System.out.println("initialized the arrays");

				mods = pDao.getModificationById(userId, vehicleId);
				times = pDao.getRaceTimeById(userId, vehicleId);

				System.out.println("called the daos ");

				request.setAttribute("times", times); // respond
				request.setAttribute("mods", mods); // respond

				System.out.println("getPerformance");

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Performance.jsp");
				dispatcher.forward(request, response);

				System.out.println("going to the JSP");

			} catch (SQLException e) {
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
		MaintenanceDao mDao = new MaintenanceDao();
		PerformanceDao pDao = new PerformanceDao();

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

				response.setHeader("Refresh",
						"0; URL=TrackingServlet?action=getMaintenance");
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
				e.printStackTrace();
			}
		} else if (action.equals("editForwardMaintenance")) {
			try {
				ArrayList<Services> service = new ArrayList<Services>();
				service = mDao.getServices();
				int mRecord = Integer.parseInt(request.getParameter("mRecord"));

				Maintenance record = mDao.getSingleMaintenance(mRecord);

				System.out.println("record = " + record);

				request.setAttribute("record", record); // respond
				request.setAttribute("service", service); // respond
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("MaintenanceEditService.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equals("editMaintenance")) {
			try {
				int userId = (int) request.getSession().getAttribute("userId");
				int vehicleId = (int) request.getSession().getAttribute(
						"vehicleId");
				int serviceId = Integer.parseInt(request
						.getParameter("services"));
				String date = request.getParameter("date");
				float mileage = Float.parseFloat(request
						.getParameter("mileage"));
				int maintId = Integer.parseInt(id);

				Maintenance service = new Maintenance(maintId, serviceId,
						vehicleId, userId, mileage, date);
				System.out.println(service);

				mDao.updateMaintenance(service);
				response.setHeader("Refresh",
						"0; URL=TrackingServlet?action=getMaintenance");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("deleteMaintenance")) {
			try {
				int mRecord = Integer.parseInt(request.getParameter("mRecord"));

				mDao.deleteMaintenanceRecord(mRecord);
				response.setHeader("Refresh",
						"0; URL=TrackingServlet?action=getMaintenance");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		if (action.equals("addMod")) {

		} else if (action.equals("editMod")) {

		} else if (action.equals("deleteMod")) {

		} else if (action.equals("addForwardTime")) {
			try {
				ArrayList<RaceType> times = new ArrayList<RaceType>();
				times = pDao.getRaceType();

				request.setAttribute("times", times); // respond

				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PerformanceAdd.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("addTime")) {
			try {
				int userId = (int) request.getSession().getAttribute("userId");
				int vehicleId = (int) request.getSession().getAttribute(
						"vehicleId");
				float time = Float.parseFloat(request.getParameter("time"));
				float distanceTime = Float.parseFloat(request
						.getParameter("distanceTime"));
				String date = request.getParameter("date");
				int raceTypeId = Integer.parseInt(request
						.getParameter("raceType"));
				int speed = Integer.parseInt(request.getParameter("speed"));

				RaceTime r = new RaceTime(' ', userId, vehicleId, raceTypeId,
						speed, date, time, distanceTime);

				pDao.insertRaceTime(r);

				response.setHeader("Refresh",
						"0; URL=TrackingServlet?action=getPerformance");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equals("editForwardTime")) {
			try {
				ArrayList<RaceType> times = new ArrayList<RaceType>();

				int raceId = Integer.parseInt(request.getParameter("raceId"));

				RaceTime time = pDao.getSingleRaceTime(raceId);
				times = pDao.getRaceType();

				request.setAttribute("times", times); // respond
				request.setAttribute("time", time); // respond
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("PerformanceEdit.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("editTime")) {
			try {
				int userId = (int) request.getSession().getAttribute("userId");
				int vehicleId = (int) request.getSession().getAttribute(
						"vehicleId");
				int speed = Integer.parseInt(request.getParameter("speed"));
				int raceTypeId = Integer.parseInt(request
						.getParameter("raceTypeId"));
				int raceId = Integer.parseInt(id);
				String date = request.getParameter("date");
				float time = Float.parseFloat(request.getParameter("time"));
				float distanceTime = Float.parseFloat(request
						.getParameter("distanceTime"));

				RaceTime r = new RaceTime(raceId, userId, vehicleId,
						raceTypeId, speed, date, time, distanceTime);

				pDao.updateRaceTime(r);
				
				response.setHeader("Refresh",
						"0; URL=TrackingServlet?action=getPerformance");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.equals("deleteTime")) {
			try {
				int raceId = Integer.parseInt(request.getParameter("raceId"));

				pDao.deleteSingleRaceTime(raceId);
				response.setHeader("Refresh",
						"0; URL=TrackingServlet?action=getPerformance");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

}
