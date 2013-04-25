<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
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
<script type="text/javascript">
	function validateForm() {

		var year = document.forms["reg1"]["year"].value;
		var make = document.forms["reg1"]["make"].value;
		var model = document.forms["reg1"]["model"].value;

		if (year == null || year == "") {
			alert("Year must be filled out");
			reg1.year.focus();
			return false;
		}
		if (make == null || make == "") {
			alert("Make name must be filled out");
			reg1.make.focus();
			return false;
		}
		if (model == null || model == "") {
			alert("Model must be filled out");
			reg1.model.focus();
			return false;
		}
		if (reg1.other[0].checked == false && reg1.other[1].checked == false) {
			alert("Select if this will be your default vehicle");
			return false;
		}
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
			<li><a href="Index.jsp"><i class="icon icon-home"></i>
					<span>Dashboard</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="GuestCubicInchCalc.jsp">Cubic Inch Calc</a></li>
					<li><a href="GuestCompressionRatioCalc.jsp">Compression
							Ratio Calc</a></li>
					<li><a href="GuestFuelInjectorCalc.jsp">Fuel Injector Calc</a></li>
				</ul></li>
		</ul>
	</div>

	<div id="content">
		<div id="content-header">
			<h1>Registration</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#">Personal Info</a> <a
				href="#" class="current">Car Info</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>Registration Page 2</h5>
						</div>
						<div class="widget-content nopadding">
							<form name="reg1" id="form-wizard" class="form-horizontal"
								method="post"
								action="RegistrationServlet?action=registerVehicle"
								onsubmit="return validateForm()">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">Year*</label>
										<div class="controls">
											<input id="year" type="text" name="year" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Make*</label>
										<div class="controls">
											<input id="make" type="text" name="make" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Model*</label>
										<div class="controls">
											<input id="model" type="text" name="model" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Trim</label>
										<div class="controls">
											<input id="trim" type="text" name="trim" value=" " />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Engine (cubic inches)</label>
										<div class="controls">
											<input id="engine" type="text" name="engine" value="0" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Transmission</label>
										<div class="controls">
											<input id="trans" type="text" name="trans" value=" " />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Car Color</label>
										<div class="controls">
											<input id="color" type="text" name="color" value=" " />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Is this the main vehicle
											you will be tracking?*</label>
										<div class="controls">
											<label><input type="radio" name="other" value="1" />Yes</label>
											<label><input type="radio" name="other" value="0" />
												No</label>
										</div>
									</div>

								</div>
								<div class="form-actions">
									<input id="back" class="btn btn-primary" type="reset"
										value="Back" /> <input id="next" class="btn btn-primary"
										type="submit" value="Next" />
									<div id="status"></div>
								</div>
								<div id="submitted"></div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="Footer2.jspf" />