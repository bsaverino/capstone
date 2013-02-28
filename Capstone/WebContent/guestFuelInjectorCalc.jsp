<!DOCTYPE html>
<html lang="en">
<head>
<title>rCal Tracer</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.blue.css" class="skin-color" />
<script>
	function doCalcTotal() {
		var hp = parseInt(document.calc.hp.value);
		if (document.calc.dutyCycle.value == "")
			var dutyCycle = .8;
		else
			var dutyCycle = parseFloat(document.calc.dutyCycle.value);
		var cylinders = parseInt(document.calc.cylinders.value);
		var bsfc = parseFloat(document.calc.bsfc.value);
		var total = ((hp*bsfc)/(cylinders*dutyCycle)).toPrecision(3);
		document.calc.fuelInjectorTotal.value = total;
	}
</script>
</head>
<body>


	<div id="header">
		<h1>
			<a href="./dashboard.html">rCal Tracer</a>
		</h1>
	</div>

	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">
			<li class="btn btn-inverse"><a title="" href="LoginPage.jsp"><i
					class="icon icon-share-alt"></i> <span class="text">Login</span></a></li>
			<li class="btn btn-inverse"><a title=""
				href="RegistrationPageStage1.jsp"><i
					class="icon icon-align-left"></i> <span class="text">Register</span></a></li>
		</ul>
	</div>

	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-th-list"></i>
			rCal Tracer</a>
		<ul>
			<li><a href="LoggedOutIndex.jsp"><i class="icon icon-home"></i>
					<span>Dashboard</span></a></li>
			<li class="submenu active open"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="guestCubicInchCalc.jsp">Cubic Inch Calc</a></li>
					<li><a href="guestCompressionRatioCalc.jsp">Compression Ratio Calc</a></li>
					<li class="active"><a href="guestFuelInjectorCalc.jsp">Fuel Injector Calc</a></li>
				</ul></li>
		</ul>
	</div>


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
											<input type="text" id="hp" name="hp">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Cylinders</label>
										<div class="controls">
											<input type="text" id="cylinders" name="cylinders">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Duty Cycle</label>
										<div class="controls">
											<input type="text" id="dutyCycle" name="dutyCycle">
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">BSFC</label>
									<div class="controls">
										<input type="text" id="bsfc" name="bsfc">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Fuel Injector</label>
									<div class="controls">
										<input type="text" id="fuelInjectorTotal" name="fuelInjectorTotal" disabled>
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

