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
<link rel="stylesheet" href="css/unicorn.blue.css" class="skin-color" />
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
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="guestCubicInchCalc.jsp">Cubic Inch Calc</a></li>
					<li><a href="guestCompressionRatioCalc.jsp">Compression Ratio Calc</a></li>
					<li><a href="guestFuelInjectorCalc.jsp">Fuel Injector Calc</a></li>
				</ul></li>
		</ul>
	</div>


	<div id="content">
		<div id="content-header">
			<h1>Registration</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#" class="current">Personal Info</a> 
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>Registration Page 1</h5>
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
											<input id="areacode" type="text" name="areacode" />
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
											<label><input type="radio" id="gender" name="gender" value="male"/> Male</label> <label><input
												type="radio" id="gender" name="gender" value="female"/> Female</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Birthdate</label>
										<div class="controls">
											<select id="month" name="month">
												<option value="0" selected="selected">Month</option>
												<%
													for (int i = 1; i <= 12; i++) {
												%>
												<option value=<%=i%>><%=i%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="controls">
											<select id="day" name="day">
												<option value="0" selected="selected">Day</option>
												<%
													for (int i = 1; i <= 31; i++) {
												%>
												<option value=<%=i%>><%=i%></option>
												<%
													}
												%>
											</select>
										</div>
										<div class="controls">
											<select id="year" name="year">
												<option value="0" selected="selected">Year</option>
												<%
													int year = Calendar.getInstance().get(Calendar.YEAR);
													for (int i = 1900; i <= year; i++) {
												%>
												<option value=<%=i%>><%=i%></option>
												<%
													}
												%>
											</select>
										</div>
									</div>

								</div>
								<div class="form-actions">
									<input id="clear" class="btn btn-primary" type="reset"
										value="Clear" /> <a href="RegistrationPageStage2.jsp"><input id="next" class="btn btn-primary"
										type="submit" value="Next" /></a>
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

