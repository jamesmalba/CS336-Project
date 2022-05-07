<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Bids</title>
	</head>
	<body>
	<H1>Your Bids</H1>
		<% try {
	
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			String user = (String)session.getAttribute("user");
			String str = "select * from auction a, user u, posts p where u.email = '" + user + "' and u.email = p.email and p.auctionId = a.auctionId; ";
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>AuctionID</td>
			<td>Name</td>
			<td>Current Bid</td>
			<td>Expiration Date/Time</td>
			<td>Item Name</td>
		</tr>
			<%
			//parse out the results
			while (result.next() ) { %>
				<tr>    
					<td><%= result.getString("auctionId") %></td>
					<td><%= result.getString("name") %></td>
					<td><%= result.getString("current_bid") %></td>
					<td><%= result.getString("expdate") %></td>
					
				</tr>
				

			<% }
			//close the connection.
			con.close();
			%>
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		
<a href='Welcome.jsp'>Go back</a>
<a href='logout.jsp'>Log out</a>
	</body>
</html>