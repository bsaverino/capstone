<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.dao.*"%>
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
	function selectVehicle() {
		var a = document.update.Vehicle.value;
		Session.setAttribute("vehicleId", a);
		alert(Session.getAttribute("vehicleId"));
		document.update.color.value = (Session.getAttribute("vehicleId"));

	}
</script>
</head>
<body>
	<%
		int userId = (Integer) session.getAttribute("userId");
		int vehicleId = (Integer) session.getAttribute("vehicleId");
		ArrayList<Vehicle> vehicleList = (ArrayList<Vehicle>) session
				.getAttribute("vehicleList");
		ArrayList<Vehicle> vehicleWithSpecList = (ArrayList<Vehicle>) request
				.getAttribute("vehicleWithSpecList");
		Vehicle vehicle = (Vehicle) request
				.getAttribute("vehicleWithSpecList");
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
			<li><a href="TrackingServlet?action=getMaintenance"><i
					class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="CubicInchCalc.jsp">Cubic Inch Calc</a></li>
					<li><a href="CompressionRatioCalc.jsp">Compression Ratio
							Calc</a></li>
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
				class="current">Add Vehicle Specs</a>
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
							<li><a href="UpdateServlet?action=loadUpdateVehicleSpec">
									<i class="icon-survey"></i> Update Vehicle Spec
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
									<form name="reg3" id="form-wizard" class="form-horizontal"
										action="RegistrationServlet?action=addVehicleSpec"
										method="post">
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label">Select Vehicle</label>
												<div class="controls">
													<select onchange="window.location=this.value"
														name="Vehicle">
														<%
															for (Vehicle newVehicle : vehicleWithSpecList) {
														%>
														<%
															if (vehicleId == newVehicle.getVehicleId()) {
														%>
														<option selected
															value="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><%=newVehicle.getYear() + " - "
							+ newVehicle.getMake() + " " + newVehicle.getTrim()%></option>
														<%
															} else {
														%>
														<option
															value="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><%=newVehicle.getYear() + " - "
							+ newVehicle.getMake() + " " + newVehicle.getTrim()%></option>
														<%
															}
															}
														%>
													</select>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Is your car Naturally
													Aspirate, Boosted, or does it use Nitrous? </label>
												<div class="controls">
													<label><input type="checkbox" name="nitrous"
														value="nitrous" onClick="return KeepCount()" /> Nitrous</label> <label><input
														type="checkbox" name="fi" value="fi"
														onClick="return KeepCount()" /> Boosted (Superchared or
														Turbocharged)</label> <label><input type="checkbox"
														name="na" value="na" onClick="return KeepCount()" />
														Naturally Aspirated (All motor, no power adders)</label>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Is your nitrous system
													wet or dry?</label>
												<div class="controls">
													<label><input type="radio" name="radios" value="1" />Wet</label>
													<label><input type="radio" name="radios" value="2" />
														Dry</label> <label><input type="radio" name="radios"
														value="0" /> I don't have Nitrous</label>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Do you use Synthetic
													Oil?</label>
												<div class="controls">
													<label><input type="radio" name="syntheticOil"
														value="yes" /> Yes</label> <label><input type="radio"
														name="syntheticOil" value="no" /> No</label>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">What Octane fuel do you
													use?</label>
												<div class="controls">
													<select id="fuel" name="fuel">
														<%
															ArrayList<FuelType> fuel = (ArrayList<FuelType>) request
																	.getAttribute("fuelList");

															for (FuelType fuelType : fuel) {
														%>
														<option value=<%=fuelType.getFuelId()%>><%=fuelType.getFuelType()%></option>
														<%
															}
														%>

														<option value="0" name="octane" id="octane"
															selected="selected">Octane</option>
													</select>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">How many cylinders does
													your motor have? </label>
												<div class="controls">
													<select id="cylinders" name="cylinders">
														<option value="0" selected="selected">Cylinders</option>
														<%
															for (int i = 1; i <= 16; i++) {
														%>
														<option value=<%=i%>><%=i%></option>
														<%
															}
														%>
													</select>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">How much Horespower
													does your motor have at the wheel?</label>
												<div class="controls">
													<input id="hp" type="text" name="hp" value="0" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">How much Torque does
													your motor have at the wheel?</label>
												<div class="controls">
													<input id="torque" type="text" name="torque" value="0" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">What is the bore of
													your cylinders? </label>
												<div class="controls">
													<input id="bore" type="text" name="bore" value="0" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">What is the Stroke of
													your motor? </label>
												<div class="controls">
													<input id="stroke" type="text" name="stroke" value="0" />
												</div>
											</div>

											<div class="control-group">
												<label class="control-label">Are your pistons Domed
													or Dished?</label>
												<div class="controls">
													<label><input type="radio" id="pistonType"
														name="pistonType" value="dome" /> Domed</label> <label><input
														type="radio" id="pistonType" name="pistonType"
														value="dish" />Dished</label>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">What is the cc of your
													piston? </label>
												<div class="controls">
													<input id="pistonCC" type="text" name="pistonCC" value="0" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">What is the cc of your
													heads? </label>
												<div class="controls">
													<input id="headCC" type="text" name="headCC" value="0" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">How thick are your head
													gaskets?</label>
												<div class="controls">
													<input id="headGasketThickness" type="text"
														name="headGasketThickness" value="0" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Bore of your head
													gaskets?</label>
												<div class="controls">
													<input id="headGasketBore" type="text"
														name="headGasketBore" value="0" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">What is the piston deck
													heeight?</label>
												<div class="controls">
													<input id="pistonDeckHeight" type="text"
														name="pistonDeckHeight" value="0" />
												</div>
											</div>

										</div>
										<div class="form-actions">
											<input id="next" class="btn btn-primary" type="submit"
												value="Next" />
											<div id="status"></div>
										</div>
										<div id="submitted"></div>
									</form>
								</div>
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

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.peity.min.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.interface.js"></script>
</body>
</html>