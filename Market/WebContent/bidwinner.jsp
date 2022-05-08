<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Ended Auctions</title>
	</head>
	<body>
	<h1>Ended Auctions</h1>
		<% {
	
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			
			
			//Gets current time 
			java.util.Date d = new java.util.Date();
			java.text.SimpleDateFormat dtf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datetimes = dtf.format(d);
			
			String exCdate;
			String exEdate;
			String exHB;
			String exSeller;
			float exCB;
			int exAuctionid;
			float minprice;
			//queries ended auctions without sale price 
			String str = "select * FROM auction where auction.expdate < now() and auction.sale_price is null;";
			ResultSet result = stmt.executeQuery(str);
			while (result.next()) {
				exCdate = result.getString("creationdate");
				exEdate = result.getString("expdate");
				exHB = result.getString("highestbidder");
				exSeller = result.getString("seller");
				exCB = result.getFloat("current_bid");
				exAuctionid = result.getInt("auctionId");
				minprice = result.getFloat("min_price");
				float fsale = 0;
				PreparedStatement ps = null;
				//we need to update sale_price using currentbid and insert that info to bidhistory and contains
				if (minprice < exCB) {
					str = "update auction set sale_price = (?) where auction.auctionId = (?);";
					ps = con.prepareStatement(str);
					ps.setFloat(1, exCB);
					ps.setInt(2, exAuctionid);
					ps.executeUpdate();
					fsale = exCB; 
				}				
				}
			{
				
			}
			//queries ended auctions 
			
			
		%>
			
		<!-- PRINTS ALL ENDED AUCTIONS -->
	<table>
		<tr>    
			<td>Auction ID</td>
			<td>Sale Price</td>
			<td>Creation Date/Time</td>
			<td>Expiration Date/Time</td>
			<td>Bought By</td>
			<td>Seller</td>
		</tr>
			<%
			String st = "select * FROM auction where auction.expdate < now() and not auction.sale_price is null;";
			result = stmt.executeQuery(st);	
			while (result.next() ) { %>
				<tr>    
					<td><%= result.getString("auctionid") %></td>
					<td><%= result.getString("sale_price") %></td>
					<td><%= result.getString("creationdate") %></td>
					<td><%= result.getString("expdate") %></td>
					<td><%= result.getString("highestbidder") %></td>
					<td><%= result.getString("seller") %></td>
				</tr>
				

			<% }
		
			
			
			
			
			%>
		</table>
		<% {
		
		
		
		
		
		con.close();
		}
		%>
			
		<%} %>
		<br>
		<a href='bid.jsp'>Make a bid</a>
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

