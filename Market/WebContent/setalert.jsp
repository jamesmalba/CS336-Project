<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Set Alerts</title>
	</head>
	<body>
		<h2>Set an alert to get notified when an item becomes available</h2>
		<form method="post" action="alerts.jsp">
		<table>
			<tr>    
				<td>Item type:</td>
				<td>
					<select name="type" size=1>
						<option value="Smartphone">Smartphone</option>
						<option value="Tablet">Tablet</option>
						<option value="Laptop">Laptop</option>
					</select>  
				</td>
			</tr>
			<tr>
				<td>Item name:</td><td><input type = "text" name = "item"></td>
			</tr>
		</table>
		<br>
			<input type = "submit" value = "Set alert!">
		</form>	
		<br><br>
					

			<a href='Welcome.jsp'>Return to Home Page</a>
			<a href='logout.jsp'>Log out</a>
	</body>	
</html>