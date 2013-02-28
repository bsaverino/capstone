<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
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
			<li class="btn btn-inverse"><a title="" href="profile.jsp"><i
					class="icon icon-cog"></i> <span class="text">Profile</span></a></li>
			<li class="btn btn-inverse"><a title="" href="LoggedOutIndex.jsp"><i
					class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>

	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Home</a>
		<ul>
			<li><a href="LoggedInIndex.jsp"><i class="icon icon-home"></i> <span>Dashboard</span></a></li>
			<li><a href="performance.jsp"><i
					class="icon-road"></i> <span>Performance</span></a></li>
			<li class="active"><a href="maintenance.jsp"><i class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="CubicInchCalc.jsp">Cubic Inch Cal</a></li>
					<li><a href="CompressionRatioCalc.jsp">Compression Ratio
							Cal</a></li>
					<li><a href="FuelInjectorCalc.jsp">Fuel Injector Cal</a></li>
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
									<li><a href="/maintenanceAddService.jsp">Add Service</a></li>
									<li><a href="/maintenanceEditService.jsp">Edit Service</a></li>
									<li><a href="#">Delete Time</a></li>
								</ul>
							</div>
							<span class="label label-info">Times</span>
						</div>
						<div class="widget-content">
							<table class="table table-bordered table-striped with-check">
								<thead>
									<tr>
										<th><input type="checkbox" id="title-table-checkbox"
											name="title-table-checkbox" /></th>
										<th>Service</th>
										<th>Mileage</th>
										<th>Cost $</th>
										<th>Date</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="widget-box widget-calendar">
						<div class="widget-title">
							<span class="icon"><i class="icon-calendar"></i></span>
							<h5>Scheduled Services</h5>
							<div class="buttons">
								<a id="add-event" data-toggle="modal" href="#modal-add-event"
									class="btn btn-success btn-mini"><i
									class="icon-plus icon-white"></i> Add new event</a>
								<div class="modal hide" id="modal-add-event">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">×</button>
										<h3>Add a new event</h3>
									</div>
									<div class="modal-body">
										<p>Enter event name:</p>
										<p>
											<input id="event-name" type="text" />
										</p>
									</div>
									<div class="modal-footer">
										<a href="#" class="btn" data-dismiss="modal">Cancel</a> <a
											href="#" id="add-event-submit" class="btn btn-primary">Add
											event</a>
									</div>
								</div>
							</div>
						</div>
						<div class="widget-content nopadding">
							<div class="panel-left">
								<div id="fullcalendar"></div>
							</div>
							<div id="external-events" class="panel-right">
								<div class="panel-title">
									<h5>Events</h5>
								</div>
								<div class="panel-content">
									<div class="external-event ui-draggable label label-inverse">My
										Event 1</div>
									<div class="external-event ui-draggable label label-inverse">My
										Event 2</div>
									<div class="external-event ui-draggable label label-inverse">My
										Event 3</div>
									<div class="external-event ui-draggable label label-inverse">My
										Event 4</div>
									<div class="external-event ui-draggable label label-inverse">My
										Event 5</div>
								</div>
							</div>
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
