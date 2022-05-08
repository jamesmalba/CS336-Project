<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Auctions</title>
	</head>
	<center>
	<h1>All Active Auctions</h1>
	<body>
		<% try {
	
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			
			String str = "select * from auction,electronics where auction.auctionID=electronics.auction_ID and auction.expdate > now();";
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<style>table, tr, td {border: 1px solid black;}tr, td {padding: 5px;}</style>
	
	<table>
		<tr>    
			<td>Name</td>
			<td>Brand</td>
			<td>Condition</td>
			<td>Current Bid</td>
			<td>Expiration Date/Time</td>
			<td>Seller</td>
			<td>AuctionId</td>
		</tr>
			<%
			//parse out the results
			while (result.next() ) { %>
				<tr>    
					<td><%= result.getString("name") %></td>
					<td><%= result.getString("Brand") %></td>
					<td><%= result.getString("scondition") %></td>
					<td><%= result.getString("current_bid") %></td>
					<td><%= result.getString("expdate") %></td>
					<td><%= result.getString("seller") %></td>
					<td><%= result.getString("auctionId") %></td>
				</tr>
				

			<% }
			//close the connection.
			con.close();
			%>
		</table>
		</center>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		<br><br><br>
		<a href='bid.jsp'>Make a bid</a>
		<br><br>
		<a href='setalert.jsp'>Set an alert for an item you want</a>
		<br><br>
		
<a href='Welcome.jsp'>Go back</a>
<a href='logout.jsp'>Log out</a>
	</body>
</html>