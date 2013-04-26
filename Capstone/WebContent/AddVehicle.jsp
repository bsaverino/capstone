<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
<jsp:include page="Header.jspf" />
	<%
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
			<li class="btn btn-inverse"><a title="" href="RegistrationServlet?action=logOff"><i
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
				class="current">Add Vehicle</a>
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
									<h5>Add Vehicle</h5>
								</div>
								<div class="widget-content nopadding">
									<form id="form-wizard" class="form-horizontal" method="post"
										action="UpdateServlet?action=addVehicle">
										<div id="form-wizard-1" class="step">
											<div class="control-group">
												<label class="control-label">Year</label>
												<div class="controls">
													<input id="year" type="text" name="year" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Make</label>
												<div class="controls">
													<input id="make" type="text" name="make" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Model</label>
												<div class="controls">
													<input id="model" type="text" name="model" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Trim</label>
												<div class="controls">
													<input id="trim" type="text" name="trim" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Engine</label>
												<div class="controls">
													<input id="engine" type="text" name="engine" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Transmission</label>
												<div class="controls">
													<input id="trans" type="text" name="trans" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Car Color</label>
												<div class="controls">
													<input id="color" type="text" name="color" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Is this the main
													vehicle you will be tracking?</label>
												<div class="controls">
													<label><input type="radio" name="default" value="1" />Yes</label>
													<label><input type="radio" name="default" value="0" />
														No</label>
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
					<jsp:include page="Footer2.jspf" />