<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SellInput</title>
</head>
<body>
<h1>Selling Item</h1>
	<%  {
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			//Declaring variables
			
			float newMinprice = Float.valueOf(request.getParameter("minprice"));
			String newExpDate = request.getParameter("expdate");
			String newExpTime = request.getParameter("exptime");
			String nET = newExpDate + " " + newExpTime;
			String newCondition = request.getParameter("condition");
			String newDimensions = request.getParameter("dimensions");
			String newStoragesize = request.getParameter("ssize");
			String newBrand = request.getParameter("brand");
			String newPcolor = request.getParameter("color");
			String newName = request.getParameter("name");
			float newMinbidincrement = Float.valueOf(request.getParameter("minbidincrement"));
			
			int newCurrentBid = 0;
			int newAuctionID = 0;
			String newaSeller = (String)session.getAttribute("user"); 
			
			//CREATIONDATETIME
			java.util.Date d = new java.util.Date();
			java.text.SimpleDateFormat dtf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String newCreationdate = dtf.format(d);
			
			//ID
			int highestID = 0;
			String auctionid;
			ResultSet rn;
		    rn = stmt.executeQuery("select MAX(a.auctionID), count(a.auctionID) from auction a");
		    while (rn.next()) {
		    	newAuctionID = rn.getInt("count(a.auctionID)");
		    	highestID = rn.getInt("MAX(a.auctionID)");
		    }
		    if (highestID >= newAuctionID) {
		    	newAuctionID = highestID +1;
		    }
		    else {
		    	newAuctionID +=1;
		    }
		    
			//Sets up for query
			String insert = "INSERT INTO auction(creationdate, expdate, seller, current_bid, min_price, auctionId, minbidincrement)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);
			ps.setString(1, newCreationdate);
			ps.setString(2, nET);
			ps.setString(3, newaSeller);
			ps.setString(4, "0");
			ps.setFloat(5, newMinprice);
			ps.setInt(6, newAuctionID);
			ps.setFloat(7, newMinbidincrement);
			ps.executeUpdate();
			
			insert = "INSERT INTO electronics(name, color, scondition, auction_Id, brand, storagesize, dimensions)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(insert);
			ps.setString(1, newName);
			ps.setString(2, newPcolor);
			ps.setString(3, newCondition);
			ps.setInt(4, newAuctionID);
			ps.setString(5, newBrand);
			ps.setString(6, newStoragesize);
			ps.setString(7, newDimensions);
			ps.executeUpdate();
			
			insert = "INSERT INTO holds(auction_Id, auctionId)"
					+ "VALUES (?, ?)";
			ps = con.prepareStatement(insert);
			ps.setInt(1, newAuctionID);
			ps.setInt(2, newAuctionID);
			ps.executeUpdate();
			
			insert = "INSERT INTO posts(email, auctionId)"
					+ "VALUES (?, ?)";
			ps = con.prepareStatement(insert);
			ps.setString(1, newaSeller);
			ps.setInt(2, newAuctionID);
			ps.executeUpdate();
			
			String newSellType = (String)session.getAttribute("selltype");	
			
			if(newSellType.equals("sp")) {
				String newProvider = request.getParameter("provider");
				String newCPU = request.getParameter("cpu");
				String newConnectivity = request.getParameter("connectivity");
				insert = "INSERT INTO smartphone(auction_Id, provider, cpu, connectivity)"
						+ "VALUES (?, ?, ?, ?)";
				ps = con.prepareStatement(insert);
				ps.setInt(1, newAuctionID);
				ps.setString(2, newProvider);
				ps.setString(3, newCPU);
				ps.setString(4, newConnectivity);
				ps.executeUpdate();
			}
			
			if(newSellType.equals("tablet")) {
				String newDisplaytype = request.getParameter("displaytype");
				String newResolution = request.getParameter("tresolution");
				String newOS = request.getParameter("OS");
				String newInputmethod = request.getParameter("Input");
				insert = "INSERT INTO tablet(auction_Id, displaytype, resolution, os, inputmethod)"
						+ "VALUES (?, ?, ?, ?, ?)";
				ps = con.prepareStatement(insert);
				ps.setInt(1, newAuctionID);
				ps.setString(2, newDisplaytype);
				ps.setString(3, newResolution);
				ps.setString(4, newOS);
				ps.setString(5, newInputmethod);
				ps.executeUpdate();
			}
			
			if(newSellType.equals("laptop")) {
				String newCPU = request.getParameter("lcpu");
				String newGPU = request.getParameter("lgpu");
				String newStoragetype = request.getParameter("storagetype");
				String newOS = request.getParameter("OS");
				String newRAM = request.getParameter("lram");
				insert = "INSERT INTO laptop(auction_Id, cpu, gpu, storagetype, os, ram)"
						+ "VALUES (?, ?, ?, ?, ?, ?)";
				ps = con.prepareStatement(insert);
				ps.setInt(1, newAuctionID);
				ps.setString(2, newCPU);
				ps.setString(3, newGPU);
				ps.setString(4, newStoragetype);
				ps.setString(5, newOS);
				ps.setString(6, newRAM);
				ps.executeUpdate();
			}
			
			
			con.close();
			out.println("Sell success!");
        	out.println("<a href='Welcome.jsp'>Go back</a>");
        	//response.sendRedirect("Welcome.jsp");
	} 
	%>
</body>
</html>