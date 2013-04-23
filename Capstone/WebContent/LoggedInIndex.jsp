<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
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
	VehicleSpecs specs = (VehicleSpecs) request
			.getAttribute("vehicleSpec");
	int mph = (Integer) request.getAttribute("mph");
	float min = (Float) request.getAttribute("min");
%>

<div id="content">
	<div id="content-header">
		<h1>Dashboard</h1>
	</div>
	<div id="breadcrumb">
		<a href="#" title="Go to Home" class="tip-bottom"><i
			class="icon-home"></i> Home</a> <a href="#" class="current">Dashboard</a>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12 center" style="text-align: center;">
				<ul class="stat-boxes">
					<li>
						<div class="left peity_bar_good">
							<span><%=specs.getHp()%></span>
						</div>
						<div class="right">
							<strong>WHP</strong>
						</div>
					</li>
					<li>
						<div class="left peity_bar_good">
							<span><%=min%></span>
							<%=mph%>MPH
						</div>
						<div class="right">
							<strong>ET</strong> Fastest 1/4
						</div>
					</li>
					<li>
						<div class="left peity_bar_good">
							<span><%=specs.getTorque()%></span>
						</div>
						<div class="right">
							<strong>WTQ</strong>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="alert alert-info">
					Welcome to <strong>rCal Tracer</strong>.<a href="#"
						data-dismiss="alert" class="close">Welcome!</a>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"><i class="icon-time"></i></span>
						<h5>Race Times</h5>
					</div>
					<div class="widget-content nopadding">
						<ul class="recent-posts">
							<%
								int count = 0;
								for (RaceTime t : times) {
									if (count <= 6) {
										count++;
							%>
							<li><%=t.getDate()%> <%=t.getRaceType()%> <%=t.getTime()%> <%=t.getTime()%></li>
							<%
								}
								}
							%>
							<li class="viewall"><a title="View all posts"
								class="tip-top" href="TrackingServlet?action=getPerformance"> + View all + </a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="span6">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"><i class="icon-list"></i></span>
						<h5>Current Mod List</h5>
					</div>
					<div class="widget-content nopadding">
						<ul class="recent-posts">
							<%
								count = 0;
								for (Modification m : mods) {
									if (count <= 6) {
										count++;
							%>

							<li><%=m.getModType()%> <%=m.getBrand()%> <%=m.getPart()%> <%=m.getPrice()%></li>

							<%
								}
								}
							%>
							<li class="viewall"><a title="View all posts"
								class="tip-top" href="TrackingServlet?action=getPerformance"> + View all + </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="Footer.jspf" />