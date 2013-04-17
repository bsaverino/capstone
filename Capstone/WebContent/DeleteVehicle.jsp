<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.dao.*"%>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>rCal Delete Vehicle</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />
</head>
<body>
	<%
	int userId = Integer.parseInt(session.getAttribute("userId").toString());
	VehicleDao vDao= new VehicleDao();
	ArrayList<Vehicle>vehicleList = vDao.getAllVehicleByUser(userId);
%>

	<div id="header">
		<h1>
			<a href="./dashboard.html">rCal Tracer</a>
		</h1>
	</div>


	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">
			<li class="btn btn-inverse"><a title="" href="Profile.jsp"><i
					class="icon icon-cog"></i> <span class="text">Profile</span></a></li>
			<li class="btn btn-inverse"><a title="" href="LoginPage.jsp"><i
					class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>

	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Home</a>
		<ul>
			<li><a href="LoggedInIndex.jsp"><i class="icon icon-home"></i> <span>Dashboard</span></a></li>
			<li><a href="Performance.jsp"><i class="icon-road"></i> <span>Performance</span></a></li>
			<li><a href="TrackingServlet?action=getMaintenance"><i class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="CubicInchCalc.jsp">Cubic Inch Calc</a></li>
					<li><a href="CompressionRatioCalc.jsp">Compression Ratio Calc</a></li>
					<li><a href="FuelInjectorCalc.jsp">Fuel Injector Calc</a></li>
				</ul></li>
		</ul>
	</div>

	<div id="content">
		<div id="content-header">
			<h1>Profile</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#">Profile</a><a href="#"
				class="current">Delete Vehicle</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12 center" style="text-align: center;">
					<div class="widget-box">
						<ul class="quick-actions">
							<li><a href="UpdateServlet?action=loadUserProfile"> <i class="icon-user"></i>
									Update User Profile
							</a></li>
							<li><a href="ChangePassword.jsp"> <i class="icon-lock"></i>
									Change Password
							</a></li>
							<li><a href="AddVehicle.jsp"> <i class="icon-database"></i>
									Add Vehicle
							</a></li>
							<li><a href="AddVehicleSpec.jsp"> <i class="icon-database"></i>
									Add Vehicle Spec
							</a></li>
							<li><a href="DeleteVehicle.jsp"> <i class="icon-tag"></i>
									Delete Vehicle
							</a></li>
							<li><a href="UpdateServlet?action=loadVehicle"> <i class="icon-survey"></i>
									Update Vehicle
							</a></li>
							<li><a href="UpdateServlet?action=loadVehicleSpec"> <i class="icon-survey"></i>
									Update Vehicle Spec
							</a></li>
							</a></li>
						</ul>
					</div>
				</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon"> <i class="icon-pencil"></i>
								</span>
								<h5>Delete Vehicle</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="form-wizard" class="form-horizontal" method="post" action="UpdateServlet?action=deleteVehicle">
									<div id="form-wizard-1" class="step">
										<div class="control-group">
											<label class="control-label">Vehicle</label>
											<div class="controls">
												<select name="Vehicle">
													<%
														for(Vehicle vehicle:vehicleList){
													%>
														  <option value=<%=vehicle.getVehicleId() %>><%=vehicle.getVehicleId() + " - "+ vehicle.getMake()+"" %></option>
													<%}%>
												</select>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Delete Vehicle</label>
											<div class="controls">
												<input type="checkbox" name="delete">
											</div>
										</div>

									</div>
									<div class="form-actions">
										<input id="next" class="btn btn-primary" type="submit"
											value="Submit" />
										<div id="status"></div>
									</div>
									<div id="submitted"></div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div id="footer" class="span12">2012 &copy; Brought to you by
						Unity Productions</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.peity.min.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.interface.js"></script>
</body>
</html>
