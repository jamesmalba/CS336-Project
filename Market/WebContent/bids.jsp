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
			String str = "select * from auctionbuyer a where a.bidder = '" + user + "';";
			ResultSet result = stmt.executeQuery(str);
			
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>Auction ID</td>
			<td>Your Bid</td>
			<td>Auto Limit</td>
			<td>Auto Increment</td>
		</tr>
			<%
			//parse out the results
			while (result.next() ) { 
			%>
				<tr>    
					<td><%= result.getString("auction_Id") %></td>
					<td><%= result.getString("bidamount") %></td>
					<td><%= result.getString("autolimit") %></td>
					<td><%= result.getString("min_increment") %></td>
					
				</tr>
				

			<% }
			%>
		</table>
		<br><br>
		<h2>Bids you won</h2>
		
		<% {
	
			//Get the database connection
			
		 	user = (String)session.getAttribute("user");
			str = "select * from auction a where a.highestbidder = '"+user+"' and not a.sale_price is null;";
			result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>AuctionID</td>
			<td>Price</td>
			<td>Expiration Date/Time</td>
			<td>Seller</td>
		</tr>
			<%
			//parse out the results
			while (result.next() ) { %>
				<tr>    
					<td><%= result.getString("auctionid") %></td>
					<td><%= result.getString("sale_price") %></td>
					<td><%= result.getString("expdate") %></td>
					<td><%= result.getString("seller") %></td>
					
				</tr>
				

			<% } 
			//close the connection.
			con.close();
			}%>
		</table>
		
		<%}  catch (Exception e) {
			out.print(e);
		}%>
		<br><br>
<a href='Welcome.jsp'>Go back</a>
<a href='logout.jsp'>Log out</a>
	</body>
	<style type="text/css">
td
{
    padding:0 15px;
}
</style>
</html>