<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
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
			<li class="btn btn-inverse"><a title="" href="profile.jsp"><i
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
			<li><a href="performance.jsp"><i class="icon-road"></i> <span>Performance</span></a></li>
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
			<h1>Profile</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a> <a href="#">Profile</a><a href="#" class="current">Change Password</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12 center" style="text-align: center;">
					<ul class="quick-actions">
						<li><a href="UpdateProfile.jsp"> <i class="icon-user"></i>
								Update User Profile
						</a></li>
						<li><a href="ChangePassword.jsp"> <i class="icon-lock"></i>
								Change Password
						</a></li>
						<li><a href="AddVehicle.jsp"> <i class="icon-database"></i>
								Add Vehicle
						</a></li>
						<li><a href="DeleteVehicle.jsp"> <i class="icon-tag"></i>
								Delete Vehicle
						</a></li>
						<li><a href="UpdateVehicle.jsp"> <i class="icon-survey"></i>
								Update Vehicle
						</a></li>
					</ul>
				</div>
			</div>
			
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-pencil"></i>
								</span>
								<h5>Change Password</h5>
							</div>
							<div class="widget-content nopadding">
								<form class="form-horizontal" method="post" action="#" name="password_validate" id="password_validate" novalidate="novalidate">
										<div class="control-group">
											<label class="control-label">Current Password</label>
											<div class="controls">
												<input type="password" name="currentPassword" id="currentPassword" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">New Password</label>
											<div class="controls">
												<input type="password" name="newPassword" id="newPassword" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">Confirm password</label>
											<div class="controls">
												<input type="password" name="newPassword2" id="newPassword2" />
											</div>
										</div>
										<div class="form-actions">
											<input type="submit" value="Submit" class="btn btn-primary">
										</div>
									</form>
							</div>
						</div>
					</div>
				</div>

			<div class="row-fluid">
				<div id="footer" class="span12">2012 &copy; Brought to you by
					Unity Productions</div>
			</div>
		</div>
	</div></div>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.gritter.min.js"></script>
	<script src="js/jquery.peity.min.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.interface.js"></script>
</body>
</html>
