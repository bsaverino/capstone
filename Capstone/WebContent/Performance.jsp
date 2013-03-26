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
			<li><a href="LoggedInIndex.jsp"><i class="icon icon-home"></i> <span>Dashboard</span></a></li>
			<li class="active"><a href="Performance.jsp"><i
					class="icon-road"></i> <span>Performance</span></a></li>
			<li><a href="Maintenance.jsp"><i class="icon-wrench"></i> <span>Maintenance</span></a></li>
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
							<span class="icon"> <i class="icon-th"></i>
							</span>
							<h5>Racing Times</h5>
							<div class="btn-group">
								<button class="btn btn-mini">Actions</button>
								<button data-toggle="dropdown"
									class="btn btn-mini dropdown-toggle">
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="racingTimeAdd.jsp">Add Time</a></li>
									<li><a href="racingTimeEdit.jsp">Edit Time</a></li>
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
										<th>Type of Race</th>
										<th>ET</th>
										<th>60 Foot</th>
										<th>MPH</th>
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

					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-th"></i>
							</span>
							<h5>Modification List</h5>
							<div class="btn-group">
								<button class="btn btn-mini">Actions</button>
								<button data-toggle="dropdown"
									class="btn btn-mini dropdown-toggle">
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="modificationAdd.jsp">Add Time</a></li>
									<li><a href="modificationEdit.jsp">Edit Time</a></li>
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
										<th>Type of Modifiaction</th>
										<th>Part Name</th>
										<th>Brand</th>
										<th>Part #(s)</th>
										<th>Price $</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
										<td>Row 5</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
										<td>Row 5</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
										<td>Row 5</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
										<td>Row 5</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
										<td>Row 5</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>Row 1</td>
										<td>Row 2</td>
										<td>Row 3</td>
										<td>Row 4</td>
										<td>Row 5</td>
									</tr>
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
										<th>Type of Modifiaction</th>
										<th>Part Name</th>
										<th>Brand</th>
										<th>Part #(s)</th>
										<th>Price $</th>
									</tr>
								</thead>
								<tbody>
									<tr class="gradeX">
										<td>Trident</td>
										<td></td>
										<td>Internet Explorer 4.0</td>
										<td>Win 95+</td>
										<td class="center">4</td>
									</tr>
									<tr class="gradeC">
										<td>Trident</td>
										<td></td>
										<td>Internet Explorer 5.0</td>
										<td>Win 95+</td>
										<td class="center">5</td>
									</tr>
									<tr class="gradeA">
										<td>Trident</td>
										<td></td>
										<td>Internet Explorer 5.5</td>
										<td>Win 95+</td>
										<td class="center">5.5</td>
									</tr>
									<tr class="gradeA">
										<td>Trident</td>
										<td></td>
										<td>Internet Explorer 6</td>
										<td>Win 98+</td>
										<td class="center">6</td>
									</tr>
									<tr class="gradeA">
										<td>Trident</td>
										<td></td>
										<td>Internet Explorer 7</td>
										<td>Win XP SP2+</td>
										<td class="center">7</td>
									</tr>
									<tr class="gradeA">
										<td>Trident</td>
										<td></td>
										<td>AOL browser (AOL desktop)</td>
										<td>Win XP</td>
										<td class="center">6</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Firefox 1.0</td>
										<td>Win 98+ / OSX.2+</td>
										<td class="center">1.7</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Firefox 1.5</td>
										<td>Win 98+ / OSX.2+</td>
										<td class="center">1.8</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Firefox 2.0</td>
										<td>Win 98+ / OSX.2+</td>
										<td class="center">1.8</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Firefox 3.0</td>
										<td>Win 2k+ / OSX.3+</td>
										<td class="center">1.9</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Camino 1.0</td>
										<td>OSX.2+</td>
										<td class="center">1.8</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Camino 1.5</td>
										<td>OSX.3+</td>
										<td class="center">1.8</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Netscape 7.2</td>
										<td>Win 95+ / Mac OS 8.6-9.2</td>
										<td class="center">1.7</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Netscape Browser 8</td>
										<td>Win 98SE+</td>
										<td class="center">1.7</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Netscape Navigator 9</td>
										<td>Win 98+ / OSX.2+</td>
										<td class="center">1.8</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Mozilla 1.0</td>
										<td>Win 95+ / OSX.1+</td>
										<td class="center">1</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Mozilla 1.1</td>
										<td>Win 95+ / OSX.1+</td>
										<td class="center">1.1</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Mozilla 1.2</td>
										<td>Win 95+ / OSX.1+</td>
										<td class="center">1.2</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Mozilla 1.3</td>
										<td>Win 95+ / OSX.1+</td>
										<td class="center">1.3</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Mozilla 1.4</td>
										<td>Win 95+ / OSX.1+</td>
										<td class="center">1.4</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Mozilla 1.5</td>
										<td>Win 95+ / OSX.1+</td>
										<td class="center">1.5</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Mozilla 1.6</td>
										<td>Win 95+ / OSX.1+</td>
										<td class="center">1.6</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Mozilla 1.7</td>
										<td>Win 98+ / OSX.1+</td>
										<td class="center">1.7</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Mozilla 1.8</td>
										<td>Win 98+ / OSX.1+</td>
										<td class="center">1.8</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Seamonkey 1.1</td>
										<td>Win 98+ / OSX.2+</td>
										<td class="center">1.8</td>
									</tr>
									<tr class="gradeA">
										<td>Gecko</td>
										<td></td>
										<td>Epiphany 2.20</td>
										<td>Gnome</td>
										<td class="center">1.8</td>
									</tr>
									<tr class="gradeA">
										<td>Webkit</td>
										<td></td>
										<td>Safari 1.2</td>
										<td>OSX.3</td>
										<td class="center">125.5</td>
									</tr>
									<tr class="gradeA">
										<td>Webkit</td>
										<td></td>
										<td>Safari 1.3</td>
										<td>OSX.3</td>
										<td class="center">312.8</td>
									</tr>
									<tr class="gradeA">
										<td>Webkit</td>
										<td></td>
										<td>Safari 2.0</td>
										<td>OSX.4+</td>
										<td class="center">419.3</td>
									</tr>
									<tr class="gradeA">
										<td>Webkit</td>
										<td></td>
										<td>Safari 3.0</td>
										<td>OSX.4+</td>
										<td class="center">522.1</td>
									</tr>
									<tr class="gradeA">
										<td>Webkit</td>
										<td></td>
										<td>OmniWeb 5.5</td>
										<td>OSX.4+</td>
										<td class="center">420</td>
									</tr>
									<tr class="gradeA">
										<td>Webkit</td>
										<td></td>
										<td>iPod Touch / iPhone</td>
										<td>iPod</td>
										<td class="center">420.1</td>
									</tr>
									<tr class="gradeA">
										<td>Webkit</td>
										<td></td>
										<td>S60</td>
										<td>S60</td>
										<td class="center">413</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Opera 7.0</td>
										<td>Win 95+ / OSX.1+</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Opera 7.5</td>
										<td>Win 95+ / OSX.2+</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Opera 8.0</td>
										<td>Win 95+ / OSX.2+</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Opera 8.5</td>
										<td>Win 95+ / OSX.2+</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Opera 9.0</td>
										<td>Win 95+ / OSX.3+</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Opera 9.2</td>
										<td>Win 88+ / OSX.3+</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Opera 9.5</td>
										<td>Win 88+ / OSX.3+</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Opera for Wii</td>
										<td>Wii</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Nokia N800</td>
										<td>N800</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Presto</td>
										<td></td>
										<td>Nintendo DS browser</td>
										<td>Nintendo DS</td>
										<td class="center">8.5</td>
									</tr>
									<tr class="gradeC">
										<td>KHTML</td>
										<td></td>
										<td>Konqureror 3.1</td>
										<td>KDE 3.1</td>
										<td class="center">3.1</td>
									</tr>
									<tr class="gradeA">
										<td>KHTML</td>
										<td></td>
										<td>Konqureror 3.3</td>
										<td>KDE 3.3</td>
										<td class="center">3.3</td>
									</tr>
									<tr class="gradeA">
										<td>KHTML</td>
										<td></td>
										<td>Konqureror 3.5</td>
										<td>KDE 3.5</td>
										<td class="center">3.5</td>
									</tr>
									<tr class="gradeX">
										<td>Tasman</td>
										<td></td>
										<td>Internet Explorer 4.5</td>
										<td>Mac OS 8-9</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeC">
										<td>Tasman</td>
										<td></td>
										<td>Internet Explorer 5.1</td>
										<td>Mac OS 7.6-9</td>
										<td class="center">1</td>
									</tr>
									<tr class="gradeC">
										<td>Tasman</td>
										<td></td>
										<td>Internet Explorer 5.2</td>
										<td>Mac OS 8-X</td>
										<td class="center">1</td>
									</tr>
									<tr class="gradeA">
										<td>Misc</td>
										<td></td>
										<td>NetFront 3.1</td>
										<td>Embedded devices</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeA">
										<td>Misc</td>
										<td></td>
										<td>NetFront 3.4</td>
										<td>Embedded devices</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeX">
										<td>Misc</td>
										<td></td>
										<td>Dillo 0.8</td>
										<td>Embedded devices</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeX">
										<td>Misc</td>
										<td></td>
										<td>Links</td>
										<td>Text only</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeX">
										<td>Misc</td>
										<td></td>
										<td>Lynx</td>
										<td>Text only</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeC">
										<td>Misc</td>
										<td></td>
										<td>IE Mobile</td>
										<td>Windows Mobile 6</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeC">
										<td>Misc</td>
										<td></td>
										<td>PSP browser</td>
										<td>PSP</td>
										<td class="center">-</td>
									</tr>
									<tr class="gradeU">
										<td>Other browsers</td>
										<td></td>
										<td>All others</td>
										<td>-</td>
										<td class="center">-</td>
									</tr>
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
