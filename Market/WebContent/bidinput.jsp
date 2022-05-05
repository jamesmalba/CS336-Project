<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bid Input</title>
</head>
<body>
<h1>Bid Item</h1>
	<% {
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			Statement stmt2 = con.createStatement();
			ResultSet rn;
			
			//Declaring variables
			String bidder = (String)session.getAttribute("user");
			float bidamount = Float.valueOf(request.getParameter("bidamount"));
			int newAuctionId = Integer.valueOf(request.getParameter("auctionId"));
			float newAutobidincrement = 0;
			float newAutobidlimit = 0;
			String checkauto = request.getParameter("command");
			if (checkauto.equals("yes")) {
				newAutobidincrement = Float.valueOf(request.getParameter("increment"));
				newAutobidlimit = Float.valueOf(request.getParameter("autolimit"));
			}
			float minbidincrement = 0; 
			float currentBid = 0; 
			float minBid = 0;
			
			String existbidder = null; 
			
			//checks if there is an existing bid
			rn = stmt.executeQuery("select a.bidder from auctionbuyer a where a.auction_Id = "+newAuctionId+" and a.bidder = '"+bidder+"';");
		    while (rn.next()) {
		    	existbidder = rn.getString("a.bidder");
		    }
			if(existbidder != null){
		    	out.println("You already have an existing bid on the item (AuctionID: "+newAuctionId+")");
		    	out.println("<a href='bid.jsp'>Go back</a>");
		    	return;
		    }
			
			//take current info on auction
		    rn = stmt.executeQuery("select a.minbidincrement,a.current_bid from auction a where a.auctionId = "+newAuctionId+";");
		    while (rn.next()) {
		    	minbidincrement = rn.getFloat("a.minbidincrement");
		    	currentBid = rn.getFloat("a.current_bid");
		    }
			minBid = minbidincrement + currentBid;
		    //see if bid amount is greater than auction.minbidincrement
			if(bidamount < minBid){
		    	out.println("Bid amount has to be greater than current bid + min increment.");
		    	out.println("<a href='bid.jsp'>try again</a>");
		    	return;
		    }
			String currentHighestbidder;
		    
		    
		    //inserts info
		    	String insert = "INSERT INTO auctionbuyer(auction_Id, min_increment, bidder, autolimit, bidamount)"
						+ "VALUES (?, ?, ?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setInt(1, newAuctionId);
				ps.setFloat(2, newAutobidincrement);
				ps.setString(3, bidder);
				ps.setFloat(4, newAutobidlimit);
				ps.setFloat(5, bidamount);
				ps.executeUpdate();
				int bdog;
				ResultSet bmax; 
		    	ResultSet mlimit;
		    	float malimit = 0;
		    	int acbnum = 0;
		    
		    	//counts the number of people who have autobid on 
			    rn = stmt.executeQuery("select count(*) from auctionbuyer a where a.auction_id = "+newAuctionId+" and NOT a.autolimit = 0;");
			    while (rn.next()){
	   				acbnum = rn.getInt("count(*)");
	   			}
		    			
		    			
		    //queries for all autobidders participating in the same auction
		    
		    //gets highest possible bid
		    rn = stmt.executeQuery("select MAX(a.autolimit) from auctionbuyer a where a.auction_id = "+newAuctionId+";");
		   	while (rn.next()) {
			   malimit = rn.getFloat("MAX(a.autolimit)");
		   	}
		   	//goes through each bidder 					
		    String currenthighestbidder = null;
   			float currentmax = 0;
   			float bbidamount;
   			float bidincre;
   			float bidlimits;
   			
   			rn = stmt.executeQuery("select * from auctionbuyer a where a.auction_id = "+newAuctionId+";");
		   	while (rn.next()) {
		    	//if there are competing bidders calculate autobid if possible
		    	if (acbnum > 1){
		    		//checks if bidlimit is higher than highest bid 
		    		bidlimits = rn.getFloat("autolimit");
		    		bidincre = rn.getFloat("min_increment");
		    		bbidamount = rn.getFloat("bidamount");
		    		String bbidder = rn.getString("bidder");
		    		while (bidlimits > malimit) {
		    			bbidamount += bidincre; 
		    		}
		    		bdog = stmt2.executeUpdate("UPDATE auctionbuyer set bidamount = "+bidamount+" where auction_id = 9 and bidder = "+bbidder+"");
		    	}
		    }		
		   
		   	rn = stmt.executeQuery("select a.bidder, MAX(bidamount) from auctionbuyer a where a.auction_id = "+newAuctionId+"");
   			//get current highest bid and bidder name
 
   			while (rn.next()) {
   				currentmax = rn.getFloat("MAX(bidamount)");
   				currenthighestbidder = rn.getString("a.bidder");
   			}
		    			
		    //checks if there is a bid on the auction already
		    /*rn = stmt.executeQuery("select a.highestbidder,a.seller from auction a where a.auctionId = "+newAuctionId+";");
		    while (rn.next()) {
		    	currentHighestbidder = rn.getString("a.highestbidder");
		    }			*/
		    //if there exists a bidder already move him to bid history might not need this
		    /*if (currentHighestBidder != null) {
		    	String insert = "INSERT INTO bidHistory(seller, bidder, time, bdate, )"
						+ "VALUES (?, ?)";
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setString(1, bidder);
				ps.setString(2, bidamount);
				ps.executeUpdate();
		    }*/
		    //move old highest bidder to bidder history
		    
		    //insert highest bidder to auction
			insert = "update auction set highestbidder = (?), current_bid = (?) where auction.auctionId = (?);";
			ps = con.prepareStatement(insert);
			ps.setString(1, currenthighestbidder);
			ps.setFloat(2, currentmax);
			ps.setInt(3, newAuctionId);
			ps.executeUpdate();
			
			
			insert = "INSERT INTO bidsIn(email, auction_id)"
					+ "VALUES (?, ?)";
			ps = con.prepareStatement(insert);
			ps.setString(1, bidder);
			ps.setFloat(2, newAuctionId);
			ps.executeUpdate();
			
			insert = "INSERT INTO bidsTo(bidder, auction_id, auctionid)"
					+ "VALUES (?, ?, ?)";
			ps = con.prepareStatement(insert);
			ps.setString(1, bidder);
			ps.setFloat(2, newAuctionId);
			ps.setFloat(3, newAuctionId);
			ps.executeUpdate();
			
			con.close();
			out.println("Bid success!");
        	out.println("<a href='Welcome.jsp'>Go back</a>");
        	//response.sendRedirect("Welcome.jsp");
	}
	%>
</body>
</html>