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
<h1>Welcome to BuyMe</h1>
Hello <%=session.getAttribute("user")%> <br>

<a href='alerts.jsp'>View Alerts</a> <br>

	<h2>What to do?</h2>
	
	<table>
		<tr>    
			<td>Want to sell something?</td>
			<td>
				<form action="Usell.jsp" method="post">
				<input type="submit" value="Sell"> 
				</form>
			</td>
		</tr>
		<tr>    
			<td><a href='selling.jsp'>Want to see your auctions?</a></td>
		</tr>
		<tr>    
			<td>Want to buy something?</td>
			<td>
				<form action="Ubuy.jsp" method="post">
				<input type="submit" value="Search"> 
				</form>
			</td>
		</tr>
		<tr>    
			<td><a href='bids.jsp'>Want to see your bids?</a></td>
		</tr>
	</table>
	<br><br>

	<br><br>
	<a href='uchange.jsp'>Want to add/change credentials?</a>
	<br>
	<a href='logout.jsp'>Log out</a>
</body>
</html>