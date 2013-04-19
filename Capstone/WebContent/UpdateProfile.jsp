<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>rCal Update Profile</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" type="text/css" href="css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="css/unicorn.main.css" />
<link rel="stylesheet" type="text/css" href="css/unicorn.grey.css"
	class="skin-color" />
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
						if(vehicleId == newVehicle.getVehicleId()){
					%>
					<li><a class="sAdd" title=""
						href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
							class="icon icon-ok"></i><%=newVehicle.getYear() + " - " + newVehicle.getMake()+ " "+ newVehicle.getModel()
						+ " "+ newVehicle.getTrim() %></a></li>
					<%
						}else{
					%>
					<li><a class="sAdd" title=""
						href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
							class="icon icon-space"></i><%=newVehicle.getYear() + " - " + newVehicle.getMake()+ " "+ newVehicle.getModel()
						+ " "+ newVehicle.getTrim() %></a></li>
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
			<li><a href="TrackingServlet?action=getMaintenance"><i
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
			<h1>Profile</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#">Profile</a> <a href="#"
				class="current">Update User Profile</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12 center" style="text-align: center;">
					<div class="widget-box">
						<ul class="quick-actions">
							<li><a href="UpdateServlet?action=loadUserProfile"> <i
									class="icon-user"></i> Update User Profile
							</a></li>
							<li><a href="ChangePassword.jsp"> <i class="icon-lock"></i>
									Change Password
							</a></li>
							<li><a href="AddVehicle.jsp"> <i class="icon-database"></i>
									Add Vehicle
							</a></li>
							<li><a href="UpdateServlet?action=loadAddVehicleSpec"> <i
									class="icon-database"></i> Add Vehicle Spec
							</a></li>
							<li><a href="DeleteVehicle.jsp"> <i class="icon-tag"></i>
									Delete Vehicle
							</a></li>
							<li><a href="UpdateServlet?action=loadUpdateVehicle"> <i
									class="icon-survey"></i> Update Vehicle
							</a></li>
							<li><a href="UpdateServlet?action=loadUpdateVehicleSpec"> <i
									class="icon-survey"></i> Update Vehicle Spec
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
									<h5>Update Info</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="form-wizard" class="form-horizontal" method="post"
										action="UpdateServlet?action=updateUser">
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label">First Name</label>
												<div class="controls">
													<input id="firstName" type="text" name="firstName"
														value="<%=user.getFirstName()%>" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Last Name</label>
												<div class="controls">
													<input id="lastName" type="text" name="lastName"
														value="<%=user.getLastName()%>" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">E-Mail</label>
												<div class="controls">
													<input id="email" type="email" name="email"
														value="<%=user.getEmail()%>" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Area Code</label>
												<div class="controls">
													<input id="areacode" type="text" name="areacode"
														value="<%=user.getAreacode()%>" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Gender</label>
												<div class="controls">
													<label><input type="radio" name="gender" id="male"
														value="male" /> Male</label> <label><input type="radio"
														name="gender" id="female" value="female" /> Female</label>
													<script type="text/javascript" defer="defer">
													<!--
														if (document.getElementById) {
															if (value =
													<%=user.getGender()%>
														== 1) {
																document
																		.getElementById('male').checked = true;
																document
																		.getElementById('female').checked = false;
															} else if (
													<%=user.getGender()%>
														== 0) {
																// Radiobutton "Yes" should be selected.
																document
																		.getElementById('male').checked = false;
																document
																		.getElementById('female').checked = true;
															}
														}
													// -->
													</script>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Birthdate</label>
												<div class="controls">
													<select name="month" id="month">
														<option value="0">Month</option>
														<%
															int month = user.getMonth();
															for (int i = 1; i <= 12; i++) {
														%>
														<%
															if (i == month) {
														%>
														<option selected value=<%=i%>><%=i%></option>
														<%
															} else {
														%>
														<option value=<%=i%>><%=i%></option>
														<%
															}
															}
														%>
													</select>
												</div>
												<div class="controls">
													<select name="day" id="day">
														<option value="0">Day</option>
														<%
															int day = user.getDay();
															for (int i = 1; i <= 31; i++) {
														%>
														<%
															if (i == day) {
														%>
														<option selected value=<%=i%>><%=i%></option>
														<%
															} else {
														%>
														<option value=<%=i%>><%=i%></option>
														<%
															}
															}
														%>
													</select>
												</div>
												<div class="controls">
													<select name="year" id="year">
														<option value="0">Year</option>
														<%
															int selectedYear = user.getYear();
															int year = Calendar.getInstance().get(Calendar.YEAR);
															for (int i = 1900; i <= year; i++) {
														%>
														<%
															if (i == selectedYear) {
														%>
														<option selected value=<%=i%>><%=i%></option>
														<%
															} else {
														%>
														<option value=<%=i%>><%=i%></option>
														<%
															}
															}
														%>
													</select>
												</div>
											</div>

										</div>
										<div class="form-actions">
											<a href="RegistrationPageStage2.jsp"><input
												class="btn btn-primary" type="submit" value="Submit" /></a>
											<div id="status"></div>
										</div>
										<div id="submitted"></div>
									</form>
								</div>
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
