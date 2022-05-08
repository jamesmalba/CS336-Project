<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<body>
What type of item you want to search?

<form method="post" action="Aresult.jsp">	
	<input type="radio" name="command" value="smartphone"/>Smartphone <br>
	<input type="radio" name="command" value="tablet"/>Tablet<br>
	<input type="radio" name="command" value="laptop"/>Laptop<br>
	<tr>    
			<td>Brand</td><td><input type="text" name="brand"></td>
		</tr>
		<br>
		<tr>    
		<td>Condition of the product?</td><td><select name="condition" size=1>
				<option value="Brand New">Brand New</option>
				<option value="Used">Used</option>
				<option value="Broken">Broken</option>
				<option value="Opened">Opened but unused</option>
				<option value="Opened">Not specified</option>
		</select> <br> </td>
		</tr>
		<tr>    
		<td>Name of the Product</td><td><input type="text" name="name"></td>
		</tr>
		<br>
		<tr>    
		<td>Color</td><td><input type="text" name="color"></td>
		</tr>	
		<tr>
		<input type="submit" value="submit" />
</form>
</body>
</html>