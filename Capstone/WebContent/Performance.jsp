<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*, java.util.*"%>

	<jsp:include page="Header.jspf" />
	
	<%
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
			<li class="btn btn-inverse"><a title="" href="RegistrationServlet?action=logOff"><i
					class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>

	<jsp:include page="Nav.jspf" />

	<%
		ArrayList<Modification> mods = (ArrayList<Modification>) request
				.getAttribute("mods");
		ArrayList<RaceTime> times = (ArrayList<RaceTime>) request
				.getAttribute("times");
	%>

	<div id="content">
		<div id="content-header">
			<h1>Performance</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#" class="current">Performance</a>
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
												<th>Type</th>
												<th>Total Time</th>
												<th>Speed</th>
												<th>60ft / lap time</th>
												<th>Date</th>
											</tr>
										</thead>
										<tbody>
											<%
												for (RaceTime t : times) {
											%>
											<tr class="time">
												<td><input type="radio" name="raceId"
													value="<%=t.getRaceId()%>"/></td>
												<td><%=t.getRaceType()%></td>
												<td><%=t.getTime()%></td>
												<td><%=t.getSpeed()%></td>
												<td><%=t.getDistanceTime()%></td>
												<td><%=t.getDate()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
										<div class="widget-title">

											<h5>Racing Times</h5>
											<div class="btn-group">
												<button class="btn btn-mini">Actions</button>
												<button data-toggle="dropdown"
													class="btn btn-mini dropdown-toggle">
													<span class="caret"></span>
												</button>
												<ul class="dropdown-menu">
													<li><input id="next" class="btn btn-primary"
														type="submit" value="Add Time"
														onclick="form.action='TrackingServlet?action=addForwardTime';" />
													</li>
													<li><input id="next" class="btn btn-primary"
														type="submit" value="Edit Time"
														onclick="form.action='TrackingServlet?action=editForwardTime';" /></li>
													<li><input id="next" class="btn btn-primary"
														type="submit" value="Delete Time"
														onclick="form.action='TrackingServlet?action=deleteTime';" /></li>
												</ul>
											</div>
											<div id="status"></div>
										</div>


									</table>

								</div>
								<div id="submitted"></div>

							</form>
						</div>
					</div>

					<div class="widget-box">
						<div class="widget-content nopadding">
							<form id="form-wizard" class="form-vertical" method="post"
								action="TrackingServlet?action=addMaintenance">
								<div id="form-wizard-1" class="step">
									<table class="table table-bordered data-table">
										<thead>
											<tr>
												<th></th>
												<th>Type</th>
												<th>Brand</th>
												<th>Part</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<%
												for (Modification m : mods) {
											%>
											<tr class="time">
												<td><input type="radio" name="modId"
													value=<%=m.getModificationId()%> /></td>
												<td><%=m.getModType()%></td>
												<td><%=m.getBrand()%></td>
												<td><%=m.getPart()%></td>
												<td><%=m.getPrice()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
										<div class="widget-title">

											<h5>Modification List</h5>
											<div class="btn-group">
												<button class="btn btn-mini">Actions</button>
												<button data-toggle="dropdown"
													class="btn btn-mini dropdown-toggle">
													<span class="caret"></span>
												</button>
												<ul class="dropdown-menu">
													<li><input id="next" class="btn btn-primary"
														type="submit" value="Add Modification"
														onclick="form.action='TrackingServlet?action=addForwardMod';" />
													</li>
													<li><input id="next" class="btn btn-primary"
														type="submit" value="Edit Modification"
														onclick="form.action='TrackingServlet?action=editForwardMod';" /></li>
													<li><input id="next" class="btn btn-primary"
														type="submit" value="Delete Modification"
														onclick="form.action='TrackingServlet?action=deleteMod';" /></li>
												</ul>
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
