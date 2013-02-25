<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>rCal Home</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" type="text/css" href="css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="css/unicorn.main.css" />
<link rel="stylesheet" type="text/css" href="css/unicorn.grey.css"
	class="skin-color" />
</head>
<body>


	<div id="header">
		<h1>
			<a href="./dashboard.html">rCal Tracer</a>
		</h1>
	</div>


	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">
			<li class="btn btn-inverse"><a title="" href="#"><i
					class="icon icon-cog"></i> <span class="text">Profile</span></a></li>
			<li class="btn btn-inverse"><a title="" href="login.html"><i
					class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>

	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Home</a>
		<ul>
			<li class="active"><a href="index.html"><i
					class="icon icon-home"></i> <span>Dashboard</span></a></li>
			<li><a href="buttons.html"><i class="icon-road"></i> <span>Performance</span></a></li>
			<li><a href="interface.html"><i class="icon-wrench"></i> <span>Maintenance</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="invoice.html">Cubic Inch Cal</a></li>
					<li><a href="chat.html">Compression Ratio Cal</a></li>
					<li><a href="calendar.html">Fuel Injector Cal</a></li>
				</ul></li>
		</ul>

	</div>


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
						Welcome to <strong>rCal Tracer</strong>.<a href="#" data-dismiss="alert" class="close">Welcome!</a>
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
								<li>
									Race time here:
								</li>
								<li>
									Race time 2 here:
								</li>
								<li>
									Race time 3 here:
								</li>
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
								<li>
									Headers   Kooks Custom Headers P3245 $1200
								</li>
								<li>
									Cam 234/238 112+7LSA .610/.622Lift $399.00
								</li>
								<li>
									Toque Converter 3200Stall Pricision Industries
								</li>
								<li class="viewall"><a title="View all comments"
									class="tip-top" href="#"> + View all + </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box widget-calendar">
						<div class="widget-title">
							<span class="icon"><i class="icon-calendar"></i></span>
							<h5>Calendar</h5>
						</div>
						<div class="widget-content nopadding">
							<div class="calendar"></div>
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
	</div>


	<script src="js/excanvas.min.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<script src="js/jquery.peity.min.js"></script>
	<script src="js/fullcalendar.min.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.dashboard.js"></script>
</body>
</html>
