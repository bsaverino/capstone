<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Unicorn Maintenance</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />
</head>
<body>
	<%
		User user = (User) request.getAttribute("user");
		ArrayList<Vehicle> vehicleList = (ArrayList<Vehicle>)session.getAttribute("vehicleList");
		int vehicleId = (Integer) session.getAttribute("vehicleId");
	%>
	<div id="header">
		<h1>
			<a href="./dashboard.html">rCal Tracer</a>
		</h1>
	</div>


	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">
			<li class="btn btn-inverse dropdown"><a href="#"
				data-toggle="dropdown" class="dropdown-toggle"><i
					class="icon icon-wrench"></i> <span class="text">Default
						Vehicle</span> <span class="label label-important"><%=vehicleList.size()%></span>
					<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<%
						for (Vehicle newVehicle : vehicleList) {
					%>
					<%
						if (vehicleId == newVehicle.getVehicleId()) {
					%>
					<li><a class="sAdd" title=""
						href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
							class="icon icon-ok"></i><%=newVehicle.getYear() + " - "
							+ newVehicle.getMake() + " " + newVehicle.getTrim()%></a></li>
					<%
						} else {
					%>
					<li><a class="sAdd" title=""
						href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
							class="icon icon-space"></i><%=newVehicle.getYear() + " - "
							+ newVehicle.getMake() + " " + newVehicle.getTrim()%></a></li>
					<%
						}
						}
					%>
				</ul></li>
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
			<li><a href="LoggedInIndex.jsp"><i class="icon icon-home"></i>
					<span>Dashboard</span></a></li>
			<li><a href="Performance.jsp"><i class="icon-road"></i> <span>Performance</span></a></li>
			<li class="active"><a
				href="TrackingServlet?action=getMaintenance"><i
					class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="CalculatorServlet?action=loacCICalc">Cubic Inch Calc</a></li>
					<li><a href="CalculatorServlet?action=loacCRCalc">Compression Ratio Calc</a></li>
					<li><a href="CalculatorServlet?action=loacFICalc">Fuel Injector Calc</a></li>
				</ul></li>
		</ul>
	</div>


	<div id="content">
		<div id="content-header">
			<h1>Dashboard</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#" class="current">Maintenance</a>
		</div>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<%
						ArrayList<Services> service = (ArrayList<Services>) request
								.getAttribute("service");
					%>
					<div class="widget-box">
						<div class="widget-title">

							<span class="icon"> <i class="icon-th"></i>
							</span>
							<h5>Current Maintenance -> Add Record</h5>
							<span class="label label-info">Maintenance</span>
						</div>
						<div class="widget-content nopadding">
							<form id="form-wizard" class="form-horizontal" method="post"
								action="TrackingServlet?action=addMaintenance">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">Date</label>
										<div class="controls">
											<input id="date" type="text" name="date" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Mileage</label>
										<div class="controls">
											<input id="mileage" type="text" name="mileage" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Services</label>
										<div class="controls">
											<select id="services" name="services">
												<option value="0" selected="selected">Services</option>
												<%
													for(Services s : service){
												%>
												<option value=<%=s.getServiceId()%>><%=s.getService()%></option>
												<%
													}
												%>
											</select>
										</div>
									</div>

								</div>
								<div class="form-actions">
									<input id="back" class="btn btn-primary" type="reset" value="Back" /> 
									<input id="next" class="btn btn-primary" type="submit" value="Next" />
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



	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/fullcalendar.min.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.calendar.js"></script>
</body>
</html>
