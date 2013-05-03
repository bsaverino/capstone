<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
<jsp:include page="Header.jspf" />
<script>
	function validateForm() {

		var firstName = document.forms["up"]["firstName"].value;
		var lastName = document.forms["up"]["lastName"].value;
		var email = document.forms["up"]["email"].value;
		var areacode = document.forms["up"]["areacode"].value;
		var month = document.forms["up"]["month"].value;
		var day = document.forms["up"]["day"].value;
		var year = document.forms["up"]["year"].value;

		if (firstName == null || firstName == "") {
			alert("First name must be filled out");
			up.firstName.focus();
			return false;
		}
		if (lastName == null || lastName == "") {
			alert("Last name must be filled out");
			up.lastName.focus();
			return false;
		}
		if (email == null || email == "") {
			alert("E-Mail must be filled out");
			up.email.focus();
			return false;
		}
		if (areacode == null || areacode == "") {
			alert("Area code must be filled out");
			up.areacode.focus();
			return false;
		}
		if (up.gender[0].checked == false && up.gender[1].checked == false) {
			alert("Gender must be selected");
			return false;
		}
		if (year == 0 || year == "" || year == "Year") {
			alert("Year must be selected");
			up.year.focus();
			return false;
		}
		if (month == 0 || month == "" || month == "Month") {
			alert("Month must be selected");
			up.month.focus();
			return false;
		}
		if (day == 0 || day == "" || day == "Day") {
			alert("Day must be selected");
			up.day.focus();
			return false;
		}

	}
</script>
<%
	if(null == session.getAttribute("userId")){
	     response.sendRedirect("Index.jsp");
	     return;
}
		User user = (User) request.getAttribute("user");
		ArrayList<Vehicle> vehicleList = (ArrayList<Vehicle>)session.getAttribute("vehicleList");
		int vehicleId = (Integer) session.getAttribute("vehicleId");
%>

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
					if(vehicleId == newVehicle.getVehicleId()){
				%>
				<li><a class="sAdd" title=""
					href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
						class="icon icon-ok"></i><%=newVehicle.getYear() + " - " + newVehicle.getMake()+ " "+ newVehicle.getModel()
						+ " "+ newVehicle.getTrim()%></a></li>
				<%
					}else{
				%>
				<li><a class="sAdd" title=""
					href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
						class="icon icon-space"></i><%=newVehicle.getYear() + " - " + newVehicle.getMake()+ " "+ newVehicle.getModel()
						+ " "+ newVehicle.getTrim()%></a></li>
				<%
					}
																																																												}
				%>
			</ul></li>
		<li class="btn btn-inverse"><a title="" href="Profile.jsp"><i
				class="icon icon-cog"></i> <span class="text">Profile</span></a></li>
		<li class="btn btn-inverse"><a title=""
			href="RegistrationServlet?action=logOff"><i
				class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
	</ul>
</div>

<jsp:include page="Nav.jspf" />

<div id="content">
	<div id="content-header">
		<h1>Profile</h1>
	</div>
	<div id="breadcrumb">
		<a href="#" title="Go to Home" class="tip-bottom"><i
			class="icon-home"></i> Home</a> <a href="#">Profile</a> <a href="#"
			class="current">Update User Profile</a>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12 center" style="text-align: center;">
				<div class="widget-box">
					<ul class="quick-actions">
						<li><a href="UpdateServlet?action=loadUserProfile"> <i
								class="icon-user"></i> Update User Profile
						</a></li>
						<li><a href="ChangePassword.jsp"> <i class="icon-lock"></i>
								Change Password
						</a></li>
						<li><a href="AddVehicle.jsp"> <i class="icon-database"></i>
								Add Vehicle
						</a></li>
						<li><a href="UpdateServlet?action=loadAddVehicleSpec"> <i
								class="icon-database"></i> Add Vehicle Spec
						</a></li>
						<li><a href="DeleteVehicle.jsp"> <i class="icon-tag"></i>
								Delete Vehicle
						</a></li>
						<li><a href="UpdateServlet?action=loadUpdateVehicle"> <i
								class="icon-survey"></i> Update Vehicle
						</a></li>
						<li><a href="UpdateServlet?action=loadUpdateVehicleSpec">
								<i class="icon-survey"></i> Update Vehicle Spec
						</a></li>
					</ul>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon"> <i class="icon-pencil"></i>
								</span>
								<h5>Update Info</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="up" class="form-horizontal" method="post"
									action="UpdateServlet?action=updateUser" onsubmit="return validateForm()">
									<div id="form-wizard-1" class="step">
										<div class="control-group">
											<label class="control-label">First Name</label>
											<div class="controls">
												<input id="firstName" type="text" name="firstName"
													value="<%=user.getFirstName()%>" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Last Name</label>
											<div class="controls">
												<input id="lastName" type="text" name="lastName"
													value="<%=user.getLastName()%>" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">E-Mail</label>
											<div class="controls">
												<input id="email" type="email" name="email"
													value="<%=user.getEmail()%>" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Area Code</label>
											<div class="controls">
												<input id="areacode" name="areacode"type="number" min="00000" max="99999"
													value="<%=user.getAreacode()%>" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Gender</label>
											<div class="controls">
												<label><input type="radio" name="gender" id="male"
													value="male" /> Male</label> <label><input type="radio"
													name="gender" id="female" value="female" /> Female</label>
												<script type="text/javascript" defer="defer">
												<!--
													if (document.getElementById) {
														if (value =
												<%=user.getGender()%>
													== 1) {
															document
																	.getElementById('male').checked = true;
															document
																	.getElementById('female').checked = false;
														} else if (
												<%=user.getGender()%>
													== 0) {
															// Radiobutton "Yes" should be selected.
															document
																	.getElementById('male').checked = false;
															document
																	.getElementById('female').checked = true;
														}
													}
												// -->
												</script>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Birthdate</label>
											<div class="controls">
												<select name="month" id="month">
													<option value="0">Month</option>
													<%
														int month = user.getMonth();
														for (int i = 1; i <= 12; i++) {
													%>
													<%
														if (i == month) {
													%>
													<option selected value=<%=i%>><%=i%></option>
													<%
														} else {
													%>
													<option value=<%=i%>><%=i%></option>
													<%
														}
														}
													%>
												</select>
											</div>
											<div class="controls">
												<select name="day" id="day">
													<option value="0">Day</option>
													<%
														int day = user.getDay();
														for (int i = 1; i <= 31; i++) {
													%>
													<%
														if (i == day) {
													%>
													<option selected value=<%=i%>><%=i%></option>
													<%
														} else {
													%>
													<option value=<%=i%>><%=i%></option>
													<%
														}
														}
													%>
												</select>
											</div>
											<div class="controls">
												<select name="year" id="year">
													<option value="0">Year</option>
													<%
														int selectedYear = user.getYear();
														int year = Calendar.getInstance().get(Calendar.YEAR);
														for (int i = 1900; i <= year; i++) {
													%>
													<%
														if (i == selectedYear) {
													%>
													<option selected value=<%=i%>><%=i%></option>
													<%
														} else {
													%>
													<option value=<%=i%>><%=i%></option>
													<%
														}
														}
													%>
												</select>
											</div>
										</div>

									</div>
									<div class="form-actions">
										<input
											class="btn btn-primary" type="submit" value="Submit" />
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