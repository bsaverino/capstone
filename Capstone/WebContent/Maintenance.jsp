<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*, java.util.*"%>
<jsp:include page="Header.jspf" />
<%
	if (null == session.getAttribute("userId")) {
		response.sendRedirect("Index.jsp");
		return;
	}
	User user = (User) request.getAttribute("user");
	ArrayList<Vehicle> vehicleList = (ArrayList<Vehicle>) session
			.getAttribute("vehicleList");
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
		<li class="btn btn-inverse"><a title=""
			href="RegistrationServlet?action=logOff"><i
				class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
	</ul>
</div>

<jsp:include page="Nav.jspf" />

<%
	ArrayList<Maintenance> record = (ArrayList<Maintenance>) request
			.getAttribute("maintenanceRecord");
%>

<div id="content">
	<div id="content-header">
		<h1>Maintenance</h1>
	</div>
	<div id="breadcrumb">
		<a href="RegistrationServlet?action=dashboard" title="Go to Home"
			class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#"
			class="current">Maintenance</a>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">

				<div class="widget-box">
					<div class="widget-content nopadding">
						<form id="form-wizard" class="form-vertical" method="post"
							action="TrackingServlet?action=addMaintenance">
							<div id="form-wizard-1" class="step">
								<table class="table table-bordered data-table">
									<thead>
										<tr>
											<th></th>
											<th>Service</th>
											<th>Mileage</th>
											<th>Discription</th>
											<th>Date</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (Maintenance m : record) {
										%>
										<tr class="time">
											<td><input type="radio" name="mRecord"
												value="<%=m.getMaintenanceId()%>" /></td>
											<td><%=m.getService()%></td>
											<td><%=m.getMileage()%></td>
											<td><%=m.getDiscription()%></td>
											<td><%=m.getDate()%></td>
										</tr>
										<%
											}
										%>
									</tbody>
									<div class="widget-title">

										<h5>Racing Times</h5>
										<div class="btn-group">
											<input style="margin: 5px; padding: 0px 5px;" id="next"
												class="btn btn-primary" type="submit" value="Add Record"
												onclick="form.action='TrackingServlet?action=addForwardMaintenance';" />
											<input style="margin: 5px; padding: 0px 5px;" id="next"
												class="btn btn-primary" type="submit" value="Edit Record"
												onclick="form.action='TrackingServlet?action=editForwardMaintenance';" />
											<input style="margin: 5px; padding: 0px 5px;" id="next"
												class="btn btn-primary" type="submit" value="Delete Record"
												onclick="form.action='TrackingServlet?action=deleteMaintenance';" />
										</div>
										<div id="status"></div>
									</div>


								</table>

							</div>
							<div id="submitted"></div>

						</form>
					</div>
				</div>
				<jsp:include page="Footer.jspf" />