<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Alerts</title>
	</head>
	<body>
		<% try {
	
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			

		
			//Gets current time 
			java.util.Date d = new java.util.Date();
			java.text.SimpleDateFormat dtf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datetimes = dtf.format(d);
			
			String bidder = (String)session.getAttribute("user"); 
			
			String str = "select e.name, a.current_bid, a.seller, a.expdate, a.auctionid, aa.bidamount from auction a, bidsto, holds h, electronics e, auctionbuyer aa where aa.bidder = '"+bidder+"' and aa.auction_id = bidsto.auction_id and bidsto.auctionid = a.auctionid and now() < a.expdate and a.auctionid = h.auctionid and h.auction_id = e.auction_id and not a.highestbidder = '"+bidder+"' group by aa.bidder;";
			ResultSet result = stmt.executeQuery(str);
		%>
	<h1>Alerts</h1>	
	<style>table, tr, td {border: 1px solid black;}tr, td {padding: 10px;}</style>	
	<caption>Auctions where you have been outbid</caption>
	<table>
		<tr>    
			<td>Auction ID</td>
			<td>Item Name</td>
			<td>Current Bid</td>
			<td>Seller</td>
			<td>Expiration Date</td>
			<td>Your bid</td>
		</tr>
			<%
			String name;
			//parse out the results
			while (result.next() ) { 
			name = result.getString("e.name");
			if (!name.equals(null)) {
				out.println("Oh no! Looks like you have been outbid on.");
			}
			else {
				out.println("Everything is good!");
			}
			%>
				<tr>    
					<td><%= result.getString("a.auctionid") %></td>
					<td><%= result.getString("e.name") %></td>
					<td><%= result.getString("a.current_bid") %></td>
					<td><%= result.getString("a.seller") %></td>
					<td><%= result.getString("a.expdate") %></td>
					<td><%= result.getString("aa.bidamount") %></td>
				</tr>
			<% } %>
			<% {
	
			//Get the database connection
			//Gets current time 
			d = new java.util.Date();
			dtf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			datetimes = dtf.format(d);
			
			bidder = (String)session.getAttribute("user"); 
			
			str = "select e.name, a.current_bid, a.seller, a.expdate, a.auctionid, aa.bidamount from auction a, bidsto, holds h, electronics e, auctionbuyer aa where aa.bidder = '"+bidder+"' and aa.auction_id = bidsto.auction_id and bidsto.auctionid = a.auctionid and now() < a.expdate and a.auctionid = h.auctionid and h.auction_id = e.auction_id and not a.highestbidder = '"+bidder+"' and aa.autolimit = 0 group by aa.bidder;";
			result = stmt.executeQuery(str);
			%>
			
			
	</table>
	<br>
	<br>
	<br>
	<caption>Auctions where your upper limit has been outbid</caption>
			<table>
			<tr>    
				<td>Auction ID</td>
				<td>Item Name</td>
				<td>Current Bid</td>
				<td>Seller</td>
				<td>Expiration Date</td>
				<td>Your bid</td>
			</tr>
				<%
				
				//parse out the results
				while (result.next() ) { 
				name = result.getString("e.name");
				if (!name.equals(null)) {
					out.println("Oh no! Looks like you have been outbid on.");
				}
				else {
					out.println("Everything is good!");
				}
				%>
					<tr>    
						<td><%= result.getString("a.auctionid") %></td>
						<td><%= result.getString("e.name") %></td>
						<td><%= result.getString("a.current_bid") %></td>
						<td><%= result.getString("a.seller") %></td>
						<td><%= result.getString("a.expdate") %></td>
						<td><%= result.getString("aa.bidamount") %></td>
					</tr>
				<% } %>
			

		</table>
		<br>
		<%
			String item_type = request.getParameter("type");
			String item_name = request.getParameter("item");
			str = "select e.name, a.current_bid, a.seller, a.expdate, a.auctionid from auction a, electronics e where e.name = '"+item_name+"' and e.auction_id = a.auctionid group by e.name;";
			result = stmt.executeQuery(str);
		%>
		<caption>Items you set an alert for</caption>
		<table>
			<tr>    
				<td>Auction ID</td>
				<td>Item Name</td>
				<td>Current Bid</td>
				<td>Seller</td>
				<td>Expiration Date</td>
			</tr>
				<%
				
				//parse out the results
				while (result.next() ) { 
				%>
					<tr>    
						<td><%= result.getString("a.auctionid") %></td>
						<td><%= result.getString("e.name") %></td>
						<td><%= result.getString("a.current_bid") %></td>
						<td><%= result.getString("a.seller") %></td>
						<td><%= result.getString("a.expdate") %></td>
					</tr>
					<% } 
			
			//close the connection.
			con.close();
			} %>
		</table>
		
		<br><br><br>
		<a href='bid.jsp'>Bid again</a>
		<br><br>
		<% } catch (Exception e) {
			out.print(e);
		}%>
		
		

<a href='Welcome.jsp'>Go back</a>
<a href='logout.jsp'>Log out</a>
	</body>
</html>