<!DOCTYPE html>
<%@ page import="edu.ben.cmsc398.dao.*"%>
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

		if(getValue()=="-1")
			pistonType = -1;
		if(getValue()=="1")
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

		for (var i = 0, length = radios.length; i < length; i++) {
		    if (radios[i].checked) {
		        /* alert(radios[i].value); */
		        return radios[i].value;
		    }
		}

	}
</script>

</head>
<body>
	getValue();
	<%
	VehicleSpecDao aDao= new VehicleSpecDao();
	VehicleSpecs vehicle = aDao.getVehicleSpec(2); 
%>
	<div id="header">
		<h1>
			<a href="./dashboard.html">rCal Tracer</a>
		</h1>
	</div>


	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">
			<li class="btn btn-inverse"><a title="" href="profile.jsp"><i
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
			<li><a href="Maintenance.jsp"><i class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li class="submenu active open"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="CubicInchCalc.jsp">Cubic Inch Calc</a></li>
					<li class="active"><a href="CompressionRatioCalc.jsp">Compression Ratio Calc</a></li>
					<li><a href="FuelInjectorCalc.jsp">Fuel Injector Calc</a></li>
				</ul></li>
		</ul>
	</div>


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
											<input type="text" id="bore" name="bore" value=<%=vehicle.getBore() %>>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Stroke</label>
										<div class="controls">
											<input type="text" id="stroke" name="stroke" value=<%=vehicle.getStroke() %>>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Piston Deck Height</label>
										<div class="controls">
											<input type="text" id="pistonDeckHeight"
												name="pistonDeckHeight" value=<%=vehicle.getHeadGasketThickness() %>>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Head CC</label>
									<div class="controls">
										<input type="text" id="headCC" name="headCC" value=<%=vehicle.getHeadCC() %>>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Piston Type</label>
									<div class="controls">
										<label><input type="radio" id="dome"
											name="pistonType" onClick="return getValue()" value="1"/>
											Dome</label> <label><input type="radio" id="dish"
											name="pistonType" onClick="return getValue()" value="-1" /> Dish</label>
											<script type="text/javascript" defer="defer">
											<!-- 
											if(document.getElementById){
											if (<%=vehicle.getPistonType()%> == 1){
											document.getElementById('dome').checked = true;
											document.getElementById('dish').checked = false;
											}
											else if (<%=vehicle.getPistonType()%> == 2){
											// Radiobutton "Yes" should be selected.
											document.getElementById('dome').checked = false;
											document.getElementById('dish').checked = true;
											}
											}
											// -->
											</script>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Piston CC</label>
									<div class="controls">
										<input type="text" id="pistonCC" name="pistonCC" value=<%=vehicle.getPistonCC() %>>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Head Gasket Thickness</label>
									<div class="controls">
										<input type="text" id="headGasketThickness"
											name="headGasketThickness" value=<%=vehicle.getHeadGasketThickness() %>>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Head Gasket Bore</label>
									<div class="controls">
										<input type="text" id="headGasketBore" name="headGasketBore" value=<%=vehicle.getHeadGasketBore() %>>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Compression Ratio</label>
									<div class="controls">
										<input type="text" id="compressionRatioTotal"
											name="compressionRatioTotal">
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
		<div class="row-fluid">
			<div id="footer" class="span12">2012 &copy; Brought to you by
				Unity Productions</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/jquery.wizard.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.wizard.js"></script>
</body>
</html>

