<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="edu.ben.cmsc398.model.*"%>
<%@ page import="java.util.*"%>
<jsp:include page="Header.jspf" />
<%
	if (null == session.getAttribute("userId")) {
		response.sendRedirect("Index.jsp");
		return;
	}
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
		<li class="btn btn-inverse"><a title=""
			href="RegistrationServlet?action=logOff"><i
				class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
	</ul>
</div>

<jsp:include page="Nav.jspf" />

<%
	ArrayList<ModificationLookup> modLookup = (ArrayList<ModificationLookup>) request
			.getAttribute("modLookup");
%>

<div id="content">
	<div id="content-header">
		<h1>Performance</h1>
	</div>
	<div id="breadcrumb">
		<a href="RegistrationServlet?action=dashboard" title="Go to Home"
			class="tip-bottom"><i class="icon-home"></i> Home</a> <a
			href="TrackingServlet?action=getPerformance">Performance</a><a
			href="#" class="current">Add Mod</a>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"> <i class="icon-pencil"></i>
						</span>
						<h5>Add your modification!</h5>
					</div>
					<div class="widget-content nopadding">
						<form id="form-wizard" class="form-horizontal" method="post"
							action="TrackingServlet?action=addMod">
							<div id="form-wizard-1" class="step">
								<div class="control-group">
									<label class="control-label">Modification Type</label>
									<div class="controls">
										<select id="services" name="modType">
											<option value="0" selected="selected">Modification
												Type</option>
											<%
												for (ModificationLookup m : modLookup) {
											%>
											<option value="<%=m.getModLookupId()%>"><%=m.getMod()%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Brand</label>
									<div class="controls">
										<input type="text" id="brand" name="brand">
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Part #</label>
								<div class="controls">
									<input type="text" id="part" name="part">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Price ($)</label>
								<div class="controls">
									<input type="text" id="price" name="price">
								</div>
							</div>
							<div class="form-actions">
								<input id="next" class="btn btn-primary" type="submit"
									value="Next" />
								<div id="status"></div>
							</div>
							<div id="submitted"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jspf" />