<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Dashboard</title>
</head>
<body>
<h1>Welcome Representative</h1>
Hello <%=session.getAttribute("user")%> <br>
	<h2>What to do?</h2>
	<form action = "remove_auction.jsp" method="post">
	<table>
		<tr><td>Remove an auction by its ID:</td></tr>
		<tr><td>Auction ID: <input type= text name="aucID"> </td></tr>
	</table>
	</form>
	List of auctions:
	<% try {
	
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			
			String str = "select * from auction,electronics where auction.auctionID=electronics.auction_ID;";
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
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

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		<br>
	<form action="remove_bid.jsp" method="post">
	remove a bid: <br>
	Auction ID: <input type= text name="aucID"> <br>
	Bidder: <input type= text name="bidder"> <br> <br>
	<input type="submit" value="Submit">
	</form>
	<br>
	<a href='repqna.jsp'>Customer Service Question and Answer</a> <br>
	
	<a href='edituser.jsp'>Edit User Account Info</a> <br>
	
	<a href='logout.jsp'>Log out</a>
</body>
</html>