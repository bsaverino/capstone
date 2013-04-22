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
		<li class="btn btn-inverse"><a title="" href="LoginPage.jsp"><i
				class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
	</ul>
</div>

<jsp:include page="Nav.jspf" />

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
							<span>524.23</span>
						</div>
						<div class="right">
							<strong>WHP</strong>
						</div>
					</li>
					<li>
						<div class="left peity_bar_good">
							<span>10.234</span> 111mph
						</div>
						<div class="right">
							<strong>ET</strong> Fastest 1/4
						</div>
					</li>
					<li>
						<div class="left peity_bar_good">
							<span>504.12</span>
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
						<span title="54 total posts" class="label label-info tip-left">3</span>
					</div>
					<div class="widget-content nopadding">
						<ul class="recent-posts">
							<li>Race time here:</li>
							<li>Race time 2 here:</li>
							<li>Race time 3 here:</li>
							<li class="viewall"><a title="View all posts"
								class="tip-top" href="#"> + View all + </a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="span6">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"><i class="icon-list"></i></span>
						<h5>Current Mod List</h5>
						<span title="88 total comments" class="label label-info tip-left">4</span>
					</div>
					<div class="widget-content nopadding">
						<ul class="recent-comments">
							<li>Headers Kooks Custom Headers P3245 $1200</li>
							<li>Cam 234/238 112+7LSA .610/.622Lift $399.00</li>
							<li>Toque Converter 3200Stall Pricision Industries</li>
							<li class="viewall"><a title="View all comments"
								class="tip-top" href="#"> + View all + </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="Footer.jspf" />