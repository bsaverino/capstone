<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
<jsp:include page="Header.jspf" />
<%
	int userId = (Integer) session.getAttribute("userId");
	int vehicleId = (Integer) session.getAttribute("vehicleId");
	ArrayList<Vehicle> vehicleList = (ArrayList<Vehicle>) session
			.getAttribute("vehicleList");
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
					if (vehicleId == newVehicle.getVehicleId()) {
				%>
				<li><a class="sAdd" title=""
					href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
						class="icon icon-ok"></i><%=newVehicle.getYear() + " - "
							+ newVehicle.getMake() + " "
							+ newVehicle.getModel() + " "
							+ newVehicle.getTrim()%></a></li>
				<%
					} else {
				%>
				<li><a class="sAdd" title=""
					href="UpdateServlet?action=changeDefaultVehicle&selectedVehicle=<%=newVehicle.getVehicleId()%>"><i
						class="icon icon-space"></i><%=newVehicle.getYear() + " - "
							+ newVehicle.getMake() + " "
							+ newVehicle.getModel() + " "
							+ newVehicle.getTrim()%></a></li>
				<%
					}
					}
				%>
			</ul></li>
		<li class="btn btn-inverse"><a title="" href="Profile.jsp"><i
				class="icon icon-cog"></i> <span class="text">Profile</span></a></li>
		<li class="btn btn-inverse"><a title="" href="LoginPage.jsp"><i
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
			class="icon-home"></i> Home</a> <a href="#">Profile</a><a href="#"
			class="current">Delete Vehicle</a>
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
						</a>
						</li>
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
								<h5>Delete Vehicle</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="form-wizard" class="form-horizontal" method="post"
									action="UpdateServlet?action=deleteVehicle">
									<div id="form-wizard-1" class="step">
										<div class="control-group">
											<label class="control-label">Vehicle</label>
											<div class="controls">
												<select name="Vehicle">
													<%
														for (Vehicle vehicle : vehicleList) {
															if (vehicle.getVehicleId() == vehicleId) {

															} else {
													%>
													<option value=<%=vehicle.getVehicleId()%>><%=vehicle.getYear() + " - " + vehicle.getMake()
							+ " " + vehicle.getModel() + " "
							+ vehicle.getTrim()%></option>
													<%
														}
														}
													%>

												</select>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Delete Vehicle</label>
											<div class="controls">
												<input type="checkbox" name="delete">
											</div>
										</div>

									</div>
									<div class="form-actions">
										<input id="next" class="btn btn-primary" type="submit"
											value="Submit" />
										<div id="status"></div>
									</div>
									<div id="submitted"></div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<jsp:include page="Footer.jspf" />