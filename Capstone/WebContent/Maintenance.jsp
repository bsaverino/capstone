<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.Maintenance,java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Unicorn Maintenance</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />
</head>
<body>


	<div id="header">
		<h1>
			<a href="./dashboard.html">rCal Tracer</a>
		</h1>
	</div>


	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">
			<li class="btn btn-inverse"><a title="" href="Profile.jsp"><i
					class="icon icon-cog"></i> <span class="text">Profile</span></a></li>
			<li class="btn btn-inverse"><a title="" href="LoginPage.jsp"><i
					class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>

	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Home</a>
		<ul>
			<li><a href="LoggedInIndex.jsp"><i class="icon icon-home"></i>
					<span>Dashboard</span></a></li>
			<li><a href="Performance.jsp"><i class="icon-road"></i> <span>Performance</span></a></li>
			<li class="active"><a
				href="TrackingServlet?action=getMaintenance"><i
					class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="CubicInchCalc.jsp">Cubic Inch Calc</a></li>
					<li><a href="CompressionRatioCalc.jsp">Compression Ratio
							Calc</a></li>
					<li><a href="FuelInjectorCalc.jsp">Fuel Injector Calc</a></li>
				</ul></li>
		</ul>
	</div>


	<div id="content">
		<div id="content-header">
			<h1>Dashboard</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#" class="current">Maintenance</a>
		</div>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<%
						ArrayList<Maintenance> record = (ArrayList<Maintenance>) request
								.getAttribute("maintenanceRecord");
					%>
					<div class="widget-box">
						<div class="widget-title">

							<span class="icon"> <i class="icon-th"></i>
							</span>
							<h5>Current Maintenance</h5>
							<div class="btn-group">
								<button class="btn btn-mini">Actions</button>
								<button data-toggle="dropdown"
									class="btn btn-mini dropdown-toggle">
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="TrackingServlet?action=addForwardMaintenance">Add
											Record</a></li>
									<li><a href="TrackingServlet?action=editMaintenance">Edit
											Record</a></li>
									<li><a href="TrackingServlet?action=deleteMaintenance">Delete
											Record</a></li>
								</ul>
							</div>
							<span class="label label-info">Maintenance</span>
						</div>
						<div class="widget-content nopadding">
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

									<tr class="gradeX">
										<td><input type="radio" name="mRecord"
											value=<%=m.getMaintenanceId()%> /></td>
										<td><%=m.getService()%></td>
										<td><%=m.getMileage()%></td>
										<td><%=m.getDiscription()%></td>
										<td><%=m.getDate()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
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
	<script src="js/fullcalendar.min.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.calendar.js"></script>
</body>
</html>
