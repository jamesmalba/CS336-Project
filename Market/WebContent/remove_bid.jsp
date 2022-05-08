<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>removing bid...</title>
	</head>
	<body>
		<% {
	
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the customer_rep_credentials.jsp
			int aucID = Integer.parseInt(request.getParameter("aucID"));
			String newBidder = request.getParameter("bidder");
			
			ResultSet rs;
		    stmt.execute("Delete from bidsto where auction_Id='" + aucID + "' and bidder='"+newBidder+"'");
		    stmt.execute("Delete from bidsin where auction_id='" + aucID + "' and bidder='"+newBidder+"'");
		    
		    stmt.execute("Delete from auctionbuyer where auction_Id='" + aucID + "' and bidder='"+newBidder+"'");
		    
		    out.println("removed bid with ID: "+aucID+" and bidder: "+newBidder);
		} %>
		<a href='customer_rep_welcome.jsp'>Go back</a> <br><br>
	</body>
</html>