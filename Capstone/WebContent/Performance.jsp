<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page
	import="edu.ben.cmsc398.model.RaceTime, edu.ben.cmsc398.model.Modification,java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>rCal Home</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
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
			<li class="active"><a href="Performance.jsp"><i
					class="icon-road"></i> <span>Performance</span></a></li>
			<li><a href="TrackingServlet?action=getMaintenance"><i
					class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="CalculatorServlet?action=loacCICalc">Cubic
							Inch Calc</a></li>
					<li><a href="CalculatorServlet?action=loacCRCalc">Compression
							Ratio Calc</a></li>
					<li><a href="CalculatorServlet?action=loacFICalc">Fuel
							Injector Calc</a></li>
				</ul></li>
		</ul>
	</div>

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
				class="icon-home"></i> Home</a> <a href="#" class="current">Dashboard</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">

					<div class="widget-box">
						<div class="widget-title">

							<h5>Racing Times</h5>
						</div>
						<div class="widget-content nopadding">
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
								<%for(RaceTime t : times){ %>
									<tr class="time">
										<td><input type="radio" name="mRecord"
											value=<%=t.getRaceId()%> /></td>
										<td><%=t.getRaceType()%></td>
										<td><%=t.getTime()%></td>
										<td><%=t.getSpeed()%></td>
										<td><%=t.getDistanceTime()%></td>
										<td><%=t.getDate()%></td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="widget-box">
						<div class="widget-title">

							<h5>Modification List</h5>
						</div>
						<div class="widget-content nopadding">
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
								<%for(Modification m : mods){ %>
									<tr class="time">
										<td><input type="radio" name="mRecord"
											value=<%=m.getModificationId()%> /></td>
										<td><%=m.getModType()%></td>
										<td><%=m.getBrand()%></td>
										<td><%=m.getPart()%></td>
										<td><%=m.getPrice()%></td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
				<div id="footer" class="span12">2012 &copy; Brought to you by
					Unity Productions</div>
			</div>
		</div>
	</div>




	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.uniform.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.tables.js"></script>
</body>
</html>
