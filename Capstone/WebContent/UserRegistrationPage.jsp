<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter your information</title>
</head>
<body>
<h3>Enter User Information</h3>
	<form method="post" action="RegistrationServlet">
		<table border="0">
			<tbody>
				<tr>
					<td>Name</td>
					<td><input type="text" title="First Name" name="firstname" id="firstname" size="32" maxlength="32" placeholder="First Name"></td>
					<td><input type="text" title="Last Name" name="lastname" id="lastname" size="32" maxlength="32" placeholder="Last Name"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" title="Email" name="email" id="email" size="32" maxlength="32" placeholder="Email Address"></td>
				</tr>
				<tr>
					<td>Username:</td>
					<td><input type="text" title="Username" name="username" id="username" size="32" maxlength="32" placeholder="Username"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" id="password" size="32" maxlength="32" placeholder="Password"></td>
				</tr>
				<tr>
					<td>Confirm Password:</td>
					<td><input type="password" name="confirm_password" id="confirm_password" size="32" maxlength="32" placeholder="Confirm Password"></td>
				</tr>
				<tr>
				<td>Birthdate</td>
				<td>Dropdown for month</td>
				<td><input title="Day" type="text" name="day" id="day" size ="2" maxlength="2" placeholder="DD"></td>
				<td><input title="Year" type="text" name="year" id="year" size="4" maxlength="4" placeholder="YYYY"></td>
				</tr>
				<tr>
				<td>Gender</td>
				<td>Dropdown/radio buttons/checkbox</td>
				</tr>
				<tr>
				<td>Postal Code</td>
				<td><input type="text" name="postalcode" id="postalcode" value="" size="16" maxlength="16" placeholder="Postal Code"></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="Submit" name="submit">
	</form>
</body>
</html>