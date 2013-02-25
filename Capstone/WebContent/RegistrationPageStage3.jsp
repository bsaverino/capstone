<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="java.util.Calendar"%>
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
			<li><a href="#"><i class="icon icon-home"></i> <span>Dashboard</span></a></li>
			<li><a href="#"><i class="icon-road"></i> <span>Performance</span></a></li>
			<li><a href="#"><i class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li><a href="#"><i class="icon icon-th-list"></i> <span>Calculators</span>
					<span class="label">3</span></a>
				<ul>
					<li><a href="form-common.html">Cubic Inch Cal</a></li>
					<li><a href="form-validation.html">Compression Ratio Cal</a></li>
					<li><a href="form-wizard.html">Fuel Injector Cal</a></li>
				</ul></li>
		</ul>
	</div>


	<div id="content">
		<div id="content-header">
			<h1>Registration</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#">Registration 1</a> <a
				href="#">Registration 2</a><a href="#" class="current">Registration
				3</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>Registration Page 3</h5>
						</div>
						<div class="widget-content nopadding">
							<form name="reg3" id="form-wizard" class="form-horizontal" method="post">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">Is your car Naturally
											Aspirate, Boosted, or does it use Nitrous?
										</label>
										<div class="controls">
											<label><input type="checkbox" name="nitrous"
												onClick="return KeepCount()" /> Nitrous</label> <label><input
												type="checkbox" name="fi" onClick="return KeepCount()" />
												Boosted (Superchared or Turbocharged)</label> <label><input
												type="checkbox" name="na" onClick="return KeepCount()" />
												Naturally Aspirated (All motor, no power adders)</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Is your nitrous system wet or dry?</label>
										<div class="controls">
											<label><input type="radio" name="radios" value="1" />
												Wet</label> <label><input type="radio" name="radios"
												value="2" /> Dry</label><label><input type="radio" name="radios"
												value="0" /> I don't have Nitrous</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Do you use Synthetic Oil?</label>
										<div class="controls">
											<label><input type="radio" name="radios" value="yes" />
												Yes</label> <label><input type="radio" name="radios"
												value="no" /> No</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">What Octane fuel do you
											use?</label>
										<div class="controls">
											<select>
												<option value="0" selected="selected">Octane</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">How many cylinders does
											your motor have? </label>
										<div class="controls">
											<select>
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
										<label class="control-label">How much Horespower does
											your motor have at the wheel?</label>
										<div class="controls">
											<input id="horsepower" type="text" name="horsepower" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">How much Torque does your
											motor have at the wheel?</label>
										<div class="controls">
											<input id="torque" type="text" name="torque" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">What is the bore of your
											cylinders? </label>
										<div class="controls">
											<input id="pistonBore" type="text" name="pistonBore" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">What is the Stroke of
											your motor? </label>
										<div class="controls">
											<input id="stroke" type="text" name="stroke" />
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">Are your pistons Domed or
											Dished?</label>
										<div class="controls">
											<label><input type="radio" name="radios"
												value="domed" /> Domed</label> <label><input type="radio"
												name="radios" value="dished" /> Dished</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">What is the cc of your
											piston? </label>
										<div class="controls">
											<input id="pistonCC" type="text" name="pistonCC" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">How thick are your head
											gaskets?</label>
										<div class="controls">
											<input id="headGasketThickness" type="text"
												name="headGasketThickness" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Bore of your head
											gaskets?</label>
										<div class="controls">
											<input id="headGasketBore" type="text" name="headGasketBore" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">What is the cc of your
											heads?</label>
										<div class="controls">
											<input id="headCC" type="text" name="headCC" />
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