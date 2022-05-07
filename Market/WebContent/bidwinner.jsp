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
		<% try {
	
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
			//queries ended auctions not in history 
			String str = "select * FROM auction WHERE NOT EXISTS (SELECT * FROM acontains WHERE acontains.auctionid = auction.auctionid) and auction.expdate < now();";
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
				
				String insert;
				//inserts final auction info to auctionhistory
				if (minprice < exCB) {
				insert = "INSERT INTO bidhistory(seller, bidder, expdt, creationdt, buyer_price, auction_id)"
						+ "VALUES (?, ?, ?, ?, ?, ?)";
				ps = con.prepareStatement(insert);
				ps.setString(1, exSeller);
				ps.setString(2, exHB);
				ps.setString(3, exEdate);
				ps.setString(4, exCdate);
				ps.setFloat(5, fsale);
				ps.setInt(6, exAuctionid);
				ps.executeUpdate(); 
				}
				else {
					ps.close();
					insert = "INSERT INTO bidhistory(seller, bidder, expdt, creationdt, buyer_price, auction_id)"
							+ "VALUES (?, ?, ?, ?, ?, ?)";
					ps = con.prepareStatement(insert);
					ps.setString(1, exSeller);
					ps.setString(2, null);
					ps.setString(3, exEdate);
					ps.setString(4, exCdate);
					ps.setFloat(5, 0);
					ps.setInt(6, exAuctionid);
					ps.executeUpdate(); 
					
				}
				
				insert = "INSERT INTO acontains(auctionId, auction_Id, seller)"
						+ "VALUES (?, ?, ?)";
				ps = con.prepareStatement(insert);
				ps.setInt(1, exAuctionid);
				ps.setInt(2, exAuctionid);
				ps.setString(3, exSeller);
				ps.executeUpdate();
			}
			
			
			//queries ended auctions 
			str = "select * FROM bidhistory;";
			result = stmt.executeQuery(str);			
		%>
			
		<!-- PRINTS ALL ENDED AUCTIONS -->
	<table>
		<tr>    
			<td>Auction ID</td>
			<td>Sale Price</td>
			<td>Creation Date/Time</td>
			<td>Expiration Date/Time</td>
			<td>Highest Bidder</td>
			<td>Seller</td>
		</tr>
			<%
			//parse out the results
			while (result.next() ) { %>
				<tr>    
					<td><%= result.getString("auction_id") %></td>
					<td><%= result.getString("buyer_price") %></td>
					<td><%= result.getString("creationdt") %></td>
					<td><%= result.getString("expdt") %></td>
					<td><%= result.getString("Bought By") %></td>
					<td><%= result.getString("seller") %></td>
				</tr>
				

			<% }
		
			
			
			
			
			%>
		</table>
		<% {
		
		
		
		
		
		con.close();
		}
		%>
			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		<br>
		<a href='bid.jsp'>Make a bid</a>
		<br><br>
	
		
<a href='Welcome.jsp'>Go back</a>
<a href='logout.jsp'>Log out</a>
	</body>
</html>