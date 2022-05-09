<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy</title>
</head>
<body>
<h1>Bid on an item</h1>

What item do you want to bid on?

<% try {
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			
			String str = "select * from auction,electronics where auction.auctionID=electronics.auction_ID and auction.expdate > now();";
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>Name</td>
			<td>Brand</td>
			<td>Condition</td>
			<td>Current Bid</td>
			<td>Minimum Bid Increment</td>
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
					<td><%= result.getString("minbidincrement") %></td>
					<td><%= result.getString("expdate") %></td>
					<td><%= result.getString("seller") %></td>
					<td><%= result.getString("auctionId") %></td>
				</tr>
				

			<% }
			//close the connection.
			con.close();
			%>
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	<br><br>
	<form method="post" action="bidinput.jsp">
	<table>
		<tr>    
		<td>What is the Auction Id?</td><td><input type="text" name="auctionId"></td>
		</tr>
		<tr>    
		<td>Bid amount</td><td><input type=text name="bidamount"></td>
		</tr>		
		<tr>    
		<td>Automatic Bidding?</td>
			<td><input type="radio" name="command" value="yes"/>Yes <br> <input type="radio" name="command" value="No"/>No<br> </td>
		</tr>
		<tr>    
		<td>Auto Bid Increment (Leave empty if no auto bid)</td><td><input type="text" name="increment"></td>
		</tr>
		<tr>    
		<td>Auto Bid Limit (Leave empty if no auto bid)</td><td><input type="text" name="autolimit"></td>
		</tr>
	</table>
		<br>
	<input type="submit" value="Add me!">
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br>
	<a href='Welcome.jsp'>Go back</a> <br><br>
	<a href='logout.jsp'>Log out</a>
</body>
<style type="text/css">
td
{
    padding:0 15px;
}
</style>
</html>