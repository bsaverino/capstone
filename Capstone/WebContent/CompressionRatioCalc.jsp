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
<script type="text/javascript">
	function doCalcTotal() {
		var pistonType = 0;
		var bore = parseFloat(document.calc.bore.value);
		var stroke = parseFloat(document.calc.stroke.value);
		var pistonDeckHeight = parseFloat(document.calc.pistonDeckHeight.value);
		var headCC = parseInt(document.calc.headCC.value);
		var pistonCC = parseInt(document.calc.pistonCC.value);

		if (getValue() == "-1")
			pistonType = -1;
		if (getValue() == "1")
			pistonType = 1;
		var headGasketThickness = parseFloat(document.calc.headGasketThickness.value);
		var headGasketBore = parseFloat(document.calc.headGasketBore.value);

		var CYV = 0.7853982 * Math.pow(bore, 2) * stroke;
		var CLV = 0.7853982 * Math.pow(bore, 2) * pistonDeckHeight;
		var PCC = (pistonType * pistonCC) * 0.0610237;
		var HG = 0.7853982 * Math.pow(headGasketBore, 2) * headGasketThickness;
		var HCC = 0.0610237 * headCC;
		var total = (CYV + CLV + PCC + HG + HCC) / (CLV + PCC + HG + HCC);
		document.calc.compressionRatioTotal.value = total;
	}

	function getValue() {

		var radios = document.getElementsByName('pistonType');

		for ( var i = 0, length = radios.length; i < length; i++) {
			if (radios[i].checked) {
				/* alert(radios[i].value); */
				return radios[i].value;
			}
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
			<h1>Compression Ratio Calculator</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#">Calculators</a><a href="#"
				class="current">Compression Ratio Calculator</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>Compression Ratio Calculator</h5>
						</div>
						<div class="widget-content nopadding">
							<form name="calc" id="form-wizard" class="form-horizontal">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">Bore</label>
										<div class="controls">
											<input type="text" id="bore" name="bore"
												value="<%=request.getAttribute("bore")%>">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Stroke</label>
										<div class="controls">
											<input type="text" id="stroke" name="stroke"
												value="<%=request.getAttribute("stroke")%>">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Piston Deck Height</label>
										<div class="controls">
											<input type="text" id="pistonDeckHeight"
												name="pistonDeckHeight"
												value="<%=request.getAttribute("pistonDeckHeight")%>">
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Head CC</label>
									<div class="controls">
										<input type="text" id="headCC" name="headCC"
											value="<%=request.getAttribute("headCC")%>">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Piston Type</label>
									<div class="controls">
										<label><input type="radio" id="dome" name="pistonType"
											onClick="return getValue()" value="1" /> Dome</label> <label><input
											type="radio" id="dish" name="pistonType"
											onClick="return getValue()" value="-1" /> Dish</label>
										<script type="text/javascript" defer="defer">
										<!--
											if (document.getElementById) {
												if (
										<%=request.getAttribute("pistonType")%>
											== 1) {
													document
															.getElementById('dome').checked = true;
													document
															.getElementById('dish').checked = false;
												} else if (
										<%=request.getAttribute("pistonType")%>
											== 2) {
													// Radiobutton "Yes" should be selected.
													document
															.getElementById('dome').checked = false;
													document
															.getElementById('dish').checked = true;
												}
											}
										// -->
										</script>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Piston CC</label>
									<div class="controls">
										<input type="text" id="pistonCC" name="pistonCC"
											value="<%=request.getAttribute("pistonCC")%>">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Head Gasket Thickness</label>
									<div class="controls">
										<input type="text" id="headGasketThickness"
											name="headGasketThickness"
											value="<%=request.getAttribute("headGasketThickness")%>">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Head Gasket Bore</label>
									<div class="controls">
										<input type="text" id="headGasketBore" name="headGasketBore"
											value="<%=request.getAttribute("headGasketBore")%>">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Compression Ratio</label>
									<div class="controls">
										<input type="text" id="compressionRatioTotal"
											name="compressionRatioTotal"
											value="<%=request.getAttribute("resultCompressionRatio")%>"
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
		<jsp:include page="Footer2.jspf" />