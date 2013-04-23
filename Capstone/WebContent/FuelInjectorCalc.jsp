<!DOCTYPE html>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
<html lang="en">
<head>
<title>rCal Tracer</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />
<script>
	function doCalcTotal() {
		var hp = parseInt(document.calc.hp.value);
		if (document.calc.dutyCycle.value == "0.0")
			var dutyCycle = .8;
		else
			var dutyCycle = parseFloat(document.calc.dutyCycle.value);
		var cylinders = parseInt(document.calc.cylinders.value);
		var bsfc = parseFloat(document.calc.bsfc.value);
		var total = ((hp * bsfc) / (cylinders * dutyCycle)).toPrecision(3);
		document.calc.fuelInjectorTotal.value = total;
	}
	function dutyCycle() {
		System.out.println("test2");
		if (vehicle.getDutyCycle() == 0) {
			document.calc.dutyCycle.value = "0.8";
			System.out.println("test");
		}
	}
</script>
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
							+ newVehicle.getMake() + " "+ newVehicle.getModel()+ " " + newVehicle.getTrim()%></a></li>
					<%
						} else {
					%>
					<li><a class="sAdd" title=""
						href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
							class="icon icon-space"></i><%=newVehicle.getYear() + " - "
							+ newVehicle.getMake() + " "+ newVehicle.getModel()+ " " + newVehicle.getTrim()%></a></li>
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

	<jsp:include page="Nav.jspf" />


	<div id="content">
		<div id="content-header">
			<h1>Fuel Injector Calculator</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#">Calculators</a><a href="#"
				class="current">Fuel Injector Calculator</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>Fuel Injector Calculator</h5>
						</div>
						<div class="widget-content nopadding">
							<form name="calc" id="form-wizard" class="form-horizontal">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">Horsepower at rear wheels</label>
										<div class="controls">
											<input type="text" id="hp" name="hp"
												value="<%=request.getAttribute("hp")%>">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Cylinders</label>
										<div class="controls">
											<input type="text" id="cylinders" name="cylinders"
												value="<%=request.getAttribute("cylinders")%>">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Duty Cycle</label>
										<div class="controls">
											<input type="text" id="dutyCycle" name="dutyCycle"
												value="<%=request.getAttribute("dutyCycle")%>">
										</div>
									</div>
								</div>
								<script type="text/javascript" defer="defer">
								<!--
									if (document.getElementById) {
										if (
								<%=request.getAttribute("dutyCycle")%>
									== 0) {
											document
													.getElementById('dutyCycle').value = 0.8;
										}
									}
								// -->
								</script>
								<div class="control-group">
									<label class="control-label">BSFC</label>
									<div class="controls">
										<input type="text" id="bsfc" name="bsfc"
											value="<%=request.getAttribute("bsfc")%>">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Fuel Injector</label>
									<div class="controls">
										<input type="text" id="fuelInjectorTotal"
											name="fuelInjectorTotal"
											value="<%=request.getAttribute("resultFuelInjector")%>"
											readonly>
									</div>
								</div>
								<div class="form-actions">
									<input id="calc" class="btn btn-primary" type="button"
										value="Calculate" onClick="doCalcTotal()" />
									<div id="status"></div>
								</div>
								<div id="submitted"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="Footer.jspf" />