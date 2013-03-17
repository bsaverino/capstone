<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>rCal Tracer</title>
<script language="JavaScript">
	function doCalcTotal() {
		var bore = parseFloat(document.all.bore.value);
		var stroke = parseFloat(document.all.stroke.value);
		var cylinders = parseInt(document.all.cylinders.value);
		var cubicInch = (Math.pow(bore, 2) * stroke * 0.7853982 * cylinders)
				.toPrecision(4);
		document.all.total.value = cubicInch;
	}
</script>

</head>
<body>
	<h3>Cubic Inch Calculator Sample</h3>
	<table>
		<tr>
			<td>Bore:</td>
			<td><input type="text" name="bore"></td>
		</tr>
		<tr>
			<td>Stroke:</td>
			<td><input type="text" name="stroke"></td>
		</tr>
		<tr>
			<td>Number of Cylinders:</td>
			<td><input type="text" name="cylinders"></td>
		</tr>
		<tr>
			<td>Cubic Inch:</td>
			<td><input type="text" name="total"></td>
		</tr>
	</table>
	<input type="button" value="Calculate Cubic Inch"
		onClick="doCalcTotal()">
	<br />
	<br />
	<a href="UserRegistrationPage.jsp">Register</a>
	<br /> This is where the header will go. making a change. another
	change. Have fun wiht the manual merge
</body>
</html>
