<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="java.util.Calendar"%>
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
	function validateForm() {

		var firstName = document.forms["reg1"]["firstName"].value;
		var lastName = document.forms["reg1"]["lastName"].value;
		var email = document.forms["reg1"]["email"].value;
		var areacode = document.forms["reg1"]["areacode"].value;
		var username = document.forms["reg1"]["username"].value;
		var password = document.forms["reg1"]["password"].value;
		var password2 = document.forms["reg1"]["password2"].value;
		var month = document.forms["reg1"]["month"].value;
		var day = document.forms["reg1"]["day"].value;
		var year = document.forms["reg1"]["year"].value;

		if (firstName == null || firstName == "") {
			alert("First name must be filled out");
			reg1.firstName.focus();
			return false;
		}
		if (lastName == null || lastName == "") {
			alert("Last name must be filled out");
			reg1.lastName.focus();
			return false;
		}
		if (email == null || email == "") {
			alert("E-Mail must be filled out");
			reg1.email.focus();
			return false;
		}
		if (areacode == null || areacode == "") {
			alert("Area code must be filled out");
			reg1.areacode.focus();
			return false;
		}
		if (username == null || username == "") {
			alert("Username must be filled out");
			reg1.username.focus();
			return false;
		}
		if (password == null || password == "") {
			alert("Password must be filled out");
			reg1.password.focus();
			return false;
		}
		if (password2 == null || password2 == "") {
			alert("Confirm Password must be filled out");
			reg1.password2.focus();
			return false;
		}
		if (password != "" && password == password2) {
			if (password.length < 6) {
				alert("Error: Password must contain at least six characters!");
				reg1.password.focus();
				return false;
			}
			if (password == username) {
				alert("Error: Password must be different from Username!");
				reg1.password.focus();
				return false;
			}
			re = /[0-9]/;
			if (!re.test(password)) {
				alert("Error: password must contain at least one number (0-9)!");
				reg1.password.focus();
				return false;
			}
			re = /[a-z]/;
			if (!re.test(password)) {
				alert("Error: password must contain at least one lowercase letter (a-z)!");
				reg1.password.focus();
				return false;
			}
			re = /[A-Z]/;
			if (!re.test(password)) {
				alert("Error: password must contain at least one uppercase letter (A-Z)!");
				reg1.password.focus();
				return false;
			}
		} else {
			alert("Error: Please check that you've entered and confirmed your password!");
			reg1.password.focus();
			return false;
		}
		if (reg1.gender[0].checked == false && reg1.gender[1].checked == false) {
			alert("Gender must be selected");
			return false;
		}
		if (year == 0 || year == "" || year == "Year") {
			alert("Year must be selected");
			reg1.year.focus();
			return false;
		}
		if (month == 0 || month == "" || month == "Month") {
			alert("Month must be selected");
			reg1.month.focus();
			return false;
		}
		if (day == 0 || day == "" || day == "Day") {
			alert("Day must be selected");
			reg1.day.focus();
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
			<li><a href="LoggedOutIndex.jsp"><i class="icon icon-home"></i>
					<span>Dashboard</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="guestCubicInchCalc.jsp">Cubic Inch Calc</a></li>
					<li><a href="guestCompressionRatioCalc.jsp">Compression
							Ratio Calc</a></li>
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
				class="icon-home"></i> Home</a> <a href="#" class="current">Personal
				Info</a>
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
							<form name="reg1" id="form-wizard" class="form-horizontal"
								method="post" action="RegistrationServlet?action=registerUser"
								onsubmit="return validateForm()">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">First Name*</label>
										<div class="controls">
											<input id="firstName" type="text" name="firstName" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Last Name*</label>
										<div class="controls">
											<input id="lastName" type="text" name="lastName" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">E-Mail*</label>
										<div class="controls">
											<input id="email" type="email" name="email" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Area Code*</label>
										<div class="controls">
											<input id="areacode" type="text" name="areacode" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Username*</label>
										<div class="controls">
											<input id="username" type="text" name="username" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Password*</label>
										<div class="controls">
											<a href="#"
												title="Password must be: At least 6 characters, have a capital letter, a lower case letter, and at least 1 number"
												class="tip-bottom"><input id="password" type="password"
												name="password" /></a>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Confirm Password*</label>
										<div class="controls">
											<input id="password2" type="password" name="password2" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Gender*</label>
										<div class="controls">
											<label><input type="radio" id="genderMale"
												name="gender" value="male" /> Male</label> <label><input
												type="radio" id="genderFemale" name="gender" value="female" />
												Female</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Birthdate*</label>
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
										value="Clear" /><input id="next" class="btn btn-primary"
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