<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>rCal Update Vehicle</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />
<script>
	function KeepCount() {

		var NewCount = 0;

		if (document.reg3.nitrous.checked) {
			NewCount = NewCount + 1;
		}

		if (document.reg3.fi.checked) {
			NewCount = NewCount + 1;
		}

		if (document.reg3.na.checked) {
			NewCount = NewCount + 1;
		}

		if (NewCount == 3) {
			alert('Pick Just Two Please');
			document.reg3;
			return false;
		}
	}
</script>
</head>
<body>
	<%
		Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");
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
							class="icon icon-ok"></i><%=newVehicle.getYear() + " - " + newVehicle.getMake()
						+ " "+ newVehicle.getTrim()%></a></li>
					<%
						}else{
					%>
					<li><a class="sAdd" title=""
						href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
							class="icon icon-space"></i><%=newVehicle.getYear() + " - " + newVehicle.getMake()
						+ " "+ newVehicle.getTrim()%></a></li>
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
				class="icon-home"></i> Home</a> <a href="#">Profile</a><a href="#"
				class="current">Update Vehicle</a>
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
									<h5>Update Vehicle</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="form-wizard" class="form-horizontal" method="post"
										action="UpdateServlet?action=updateVehicle">
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label">Select Vehicle</label>
												<div class="controls">
													<select onchange="window.location=this.value"
														name="Vehicle">
														<%
															for (Vehicle newVehicle : vehicleList) {
														%>
														<%
															if(vehicleId == newVehicle.getVehicleId()){
														%>
														<option selected
															value="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><%=newVehicle.getYear() + " - " + newVehicle.getMake()
						+ " "+ newVehicle.getTrim()%></option>
														<%
															}else{
														%>
														<option
															value="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><%=newVehicle.getYear() + " - " + newVehicle.getMake()
						+ " "+ newVehicle.getTrim()%></option>
														<%
															}
																																																																																																				}
														%>
													</select>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Year</label>
												<div class="controls">
													<input id="year" type="text" name="year"
														value=<%=vehicle.getYear()%>>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Make</label>
												<div class="controls">
													<input id="make" type="text" name="make"
														value=<%=vehicle.getMake()%>>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Model</label>
												<div class="controls">
													<input id="model" type="text" name="model"
														value=<%=vehicle.getModel()%>>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Trim</label>
												<div class="controls">
													<input id="trim" type="text" name="trim"
														value=<%=vehicle.getTrim()%>>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Engine</label>
												<div class="controls">
													<input id="engine" type="text" name="engine"
														value=<%=vehicle.getEngine()%>>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Transmission</label>
												<div class="controls">
													<input id="trans" type="text" name="trans"
														value=<%=vehicle.getTrans()%>>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Car Color</label>
												<div class="controls">
													<input id="color" type="text" name="color"
														value=<%=vehicle.getColor()%>>
												</div>
											</div>
											<!-- Auto populate Not working -->
											<div class="control-group">
												<label class="control-label">Is this the main
													vehicle you will be tracking?</label>
												<div class="controls">
													<label><input type="radio" name="default" id="yes"
														value="1" />Yes</label> <label><input type="radio"
														name="default" id="no" value="0" /> No</label>
													<script type="text/javascript" defer="defer">
													<!--
														if (document.getElementById) {
															if (
													<%=vehicleId%>
														==
													<%=vehicle.getVehicleId()%>
														) {
																document
																		.getElementById('yes').checked = true;
																document
																		.getElementById('no').checked = false;
															} else if (
													<%=vehicleId%>
														!=
													<%=vehicle.getVehicleId()%>
														) {
																// Radiobutton "Yes" should be selected.
																document
																		.getElementById('yes').checked = false;
																document
																		.getElementById('no').checked = true;
															}
														}
													// -->
													</script>
												</div>
											</div>
										</div>
										<div class="form-actions">
											<input id="next" class="btn btn-primary" type="submit" value="Submit" />
											<div id="status"></div>
										</div>
										<div id="submitted"></div>
									</form>
								</div>
							</div>
						</div>

						<div class="row-fluid">
							<div id="footer" class="span12">2012 &copy; Brought to you
								by Unity Productions</div>
						</div>
					</div>
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
