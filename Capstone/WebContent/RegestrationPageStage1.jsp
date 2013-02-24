<!DOCTYPE html>
<%@ page import="java.util.Calendar"%>
<html lang="en">
<head>
<title>rCalc Tracer</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/unicorn.register.css" />
</head>
<body>
	<div id="logo">
		<img src="img/logo.png" alt="" />
	</div>
	<div id="loginbox">
		<form id="loginform" class="form-vertical"
			action="RegistrationServlet">
			<p>Enter User Information</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<input type="text" title="First Name" name="firstname"
							id="firstname" size="32" maxlength="32" placeholder="First Name">
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<input type="text" title="Last Name" name="lastname" id="lastname"
							size="32" maxlength="32" placeholder="Last Name">
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<input type="email" title="Email" name="email" id="email"
							size="32" maxlength="32" placeholder="Email Address">
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<input type="number" title="Postal Code" name="postalcode"
							id="postalcode" size="9" maxlength="9" placeholder="Postal Code">
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<input type="text" title="Username" name="username" id="username"
							size="32" maxlength="32" placeholder="Username">
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<input type="password" name="password" id="password" size="32"
							maxlength="32" placeholder="Password">
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<input type="password" name="confirm_password"
							id="confirm_password" size="32" maxlength="32"
							placeholder="Confirm Password">
					</div>
				</div>
			</div>
			<p>Birthdate</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<select name="MonthDropdown">
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
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<select name="DayDropdown">
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
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
						<select name="YearDropdown">
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
			<p>Gender</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-prepend">
					
						   <input type="radio" name="sex" value="male">
						   <label for="male">Male&nbsp;</label> 
						   <input type="radio" name="sex" value="female">
							<label for="female">Female&nbsp;</label>
						<!-- <label for="male">Male&nbsp;<input type="radio" name="sex" id="male" VALUE="no" class="required" /></label> 
							<label for="female">Female&nbsp;<input type="radio" name="sex" id="female" VALUE="no" /></label> -->
					</div>
				</div>
			</div>
			<p></p>
			<div class="form-actions">
				<span class="pull-left"></span><span class="pull-right"><input
					type="submit" class="btn btn-inverse" value="Next" /></span>
			</div>
		</form>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/unicorn.register.js"></script>
</body>
</html>
