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
<link rel="stylesheet" type="text/css" href="css/unicorn.blue.css"
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
			<li class="btn btn-inverse"><a title="" href="LoginPage.jsp"><i
					class="icon icon-share-alt"></i> <span class="text">Login</span></a></li>
			<li class="btn btn-inverse"><a title=""
				href="RegistrationPageStage1.jsp"><i
					class="icon icon-align-left"></i> <span class="text">Register</span></a></li>
		</ul>
	</div>

	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Home</a>
		<ul>
			<li class="active"><a href="LoggedOutIndex"><i
					class="icon icon-home"></i> <span>Dashboard</span></a></li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>Calculators</span> <span class="label">3</span></a>
				<ul>
					<li><a href="guestCubicInchCalc.jsp">Cubic Inch Cal</a></li>
					<li><a href="guestCompressionRatioCalc.jsp">Compression
							Ratio Cal</a></li>
					<li><a href="guestFuelInjectorCalc.jsp">Fuel Injector Cal</a></li>
				</ul></li>
		</ul>

	</div>


	<div id="content">
		<div id="content-header">
			<h1>Dashboard</h1>
		</div>
		<div id="breadcrumb">
			<a href="#" class="current" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> Home</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12 center" style="text-align: center;">
					<h1>Register or Login to take full advantage of all rCal
						Tracer can do for you!</h1>
				</div>
			</div>
			<jsp:include page="Footer.jspf" />