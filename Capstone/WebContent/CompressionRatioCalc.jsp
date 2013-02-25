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
<script language="JavaScript">
	function doCalcTotal() {
		var bore = parseFloat(document.calc.bore.value);
		var stroke = parseFloat(document.calc.stroke.value);
		var pistonDeckHeight = parseFloat(document.calc.pistonDeckHeight.value);
		var headCC = parseInt(document.calc.headCC.value);
		var pistonType="test";
		if(document.calc.pistonType.value=="pistonTypeDome")
			pistonType = "dome";
		else if(document.calc.pistonType.value=="pistonTypeDish")
			pistonType = "dish";
		else
			alert('Select a Piston Type');
		var headGasketThickness = parseFloat(document.calc.headGasketThickness.value);
		var headGasketBore = parseFloat(document.calc.headGasketBore.value);
		var total = bore+stroke+pistonDeckHeight+headCC+headGasketThickness+headGasketBore;
		document.calc.compressionRatioTotal.value =total;
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
			<li class="btn btn-inverse"><a title="" href="#"><i
					class="icon icon-user"></i> <span class="text">Profile</span></a></li>
			<li class="btn btn-inverse"><a title="" href="login.html"><i
					class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>

	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-th-list"></i>
			rCal Tracer</a>
		<ul>
			<li><a href="LoggedOutIndex.jsp"><i class="icon icon-home"></i>
					<span>Dashboard</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="CubicInchCalc.jsp">Cubic Inch Calc</a></li>
					<li><a href="FuelInjectorCalc.jsp">Compression Ratio Calc</a></li>
					<li><a href="CompressionRatioCalc.jsp">Fuel Injector Calc</a></li>
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
											<input type="text" id="bore" name="bore">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Stroke</label>
										<div class="controls">
											<input type="text" id="stroke" name="stroke">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Piston Deck Height</label>
										<div class="controls">
											<input type="text" id="pistonDeckHeight"
												name="pistonDeckHeight">
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Head CC</label>
									<div class="controls">
										<input type="text" id="headCC" name="headCC">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Piston Type</label>
									<div class="controls">
										<label><input type="radio" id="pistonTypeDome" name="pistonType" value="pistonTypeDome" /> Dome</label> 
										<label><input type="radio" id="pistonTypeDish" name="pistonType" value="pistonTypeDish" /> Dish</label>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Head Gasket Thickness</label>
									<div class="controls">
										<input type="text" id="headGasketThickness"
											name="headGasketThickness">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Head Gasket Bore</label>
									<div class="controls">
										<input type="text" id="headGasketBore"
											name="headGasketBore">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Compression Ratio</label>
									<div class="controls">
										<input type="text" id="compressionRatioTotal"
											name="compressionRatioTotal" disabled>
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

