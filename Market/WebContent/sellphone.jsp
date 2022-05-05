<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome!</title>
</head>
<body>
<h1>Sell a Phone</h1>

Please input the information.

<br>

<form method="post" action="sellinput.jsp">
	<table>
		<tr>    
		<td>Brand of phone</td><td><select name="brand" size=1>
				<option value="Apple">Apple</option>
				<option value="Samsung">Samsung</option>
				<option value="Oneplus">Oneplus</option>
				<option value="Google">Google</option>
				<option value="Other">Other</option>
		</select> <br> </td>
		</tr>
		<tr>    
		<td>Condition of phone?</td><td><select name="condition" size=1>
				<option value="Brand New">Brand New</option>
				<option value="Used">Used</option>
				<option value="Broken">Broken</option>
				<option value="Opened">Opened but unused</option>
				<option value="Opened">Not specified</option>
		</select> <br> </td>
		</tr>
		<tr>    
		<td>Name of Phone</td><td><input type="text" name="name"></td>
		</tr>
				
		<tr>    
		<td>Color</td><td><input type="text" name="color"></td>
		</tr>	
		<tr>
		<td>Minimum price</td><td><input type="text" name="minprice"></td>
		</tr>	
		<tr>
		<td>Minimum bid increment</td><td><input type="text" name="minbidincrement"></td>
		</tr>
		<tr>
		<td>Phone Provider</td><td><input type="text" name="provider"></td>
		</tr>
		<tr>
		<td>Dimensions</td><td><input type="text" name="dimensions"></td>
		</tr>	
		<tr>
		<td>Storage Size</td><td><input type="text" name="ssize"></td>
		</tr>
		<tr>
		<td>CPU</td><td><input type="text" name="cpu"></td>
		</tr>
		<tr>
		<td>Connectivity</td><td><input type="text" name="connectivity"></td>
		</tr>			
		<tr>
		<td>Expiration Date (YYYY-MM-DD)</td><td><input type="text" name="expdate"></td>
		</tr>
		<tr>
		<td>Expiration Time (HH:MM:SS)</td><td><input type="text" name="exptime"></td>
		</tr>
		
		
	</table>
		<br>
	<input type="submit" value="Add me!">
</form>
	
	<br>
	<a href='Welcome.jsp'>Go back</a> <br><br>
	<a href='logout.jsp'>Log out</a>
</body>
</html>