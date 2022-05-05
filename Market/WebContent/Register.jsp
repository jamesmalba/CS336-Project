<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registering</title>
</head>
<body>
<h1>Register Here</h1>
<form action="Registered.jsp" method="post">
<table>
	<tr><td>Email:</td> <td><input type= text name="email"></td> </tr>
	<tr><td>Full Name:</td> <td> <input type= text name="uname"> </td> </tr>
	<tr><td>Date of Birth: (YYYY/MM/DD)</td> <td> <input type= text name="dob"> </td> </tr>
	<tr><td>Address:</td> <td> <input type= text name="address"> </td> </tr>
	<tr><td>Password:</td> <td> <input type= text name="upass"> </td> </tr>
	<tr><td>Confirm Password:</td> <td> <input type= text name="upassc"> </td> </tr>
</table> <br>
	
<input type="submit" value="Submit">
	
</form>
	
</body>
</html>