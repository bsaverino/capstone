<!DOCTYPE html>
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
			<li><a href="index.html"><i class="icon icon-home"></i> <span>Dashboard</span></a></li>
			<li><a href="buttons.html"><i class="icon-road"></i> <span>Performance</span></a></li>
			<li><a href="buttons.html"><i class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li class="submenu active open"><a href="#"><i
					class="icon icon-th-list"></i> <span>Calculators</span> <span
					class="label">3</span></a>
				<ul>
					<li><a href="form-common.html">Cubic Inch Cal</a></li>
					<li><a href="form-validation.html">Compression Ratio Cal</a></li>
					<li class="active"><a href="form-wizard.html">Fuel
							Injector Cal</a></li>
				</ul></li>

		</ul>

	</div>


	<div id="content">
		<div id="content-header">
			<h1>Registration</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#">Registration 1</a> <a href="#">Registration 2</a><a
				href="#" class="current">Registration 3</a>
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
							<form id="form-wizard" class="form-horizontal" method="post">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">First Name</label>
										<div class="controls">
											<input id="firstName" type="text" name="firstName" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Last Name</label>
										<div class="controls">
											<input id="lastName" type="text" name="lastName" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">E-Mail</label>
										<div class="controls">
											<input id="email" type="email" name="email" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Area Code</label>
										<div class="controls">
											<input id="areaCode" type="text" name="areaCode" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Username</label>
										<div class="controls">
											<input id="username" type="text" name="username" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Password</label>
										<div class="controls">
											<input id="password" type="password" name="password" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Confirm Password</label>
										<div class="controls">
											<input id="password2" type="password" name="password2" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Gender</label>
										<div class="controls">
											<label><input type="radio" name=" Male" />Male</label> <label><input
												type="radio" name=" Female" /> Female</label>
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
				<div id="footer" class="span12">
					2012 &copy; Brought to you by Unity Productions
				</div>
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