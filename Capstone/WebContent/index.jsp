<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="JavaScript">
function doCalcTotal() {
 var input1 = parseInt(document.all.textbox1.value);
 var input2 = parseInt(document.all.textbox2.value);

 var myTotal = input1 + input2;

 document.all.textbox3.value = myTotal;
}
</script>

</head>
<body>
<input type="text" name="textbox1"> +
<input type="text" name="textbox2"> =
<input type="text" name="textbox3">
<input type="button" value="Calculate Total" onClick="doCalcTotal()">

	This is where the header will go.  
making a change.

another change.


Have fun wiht the manual merge 
</body>
</html>
