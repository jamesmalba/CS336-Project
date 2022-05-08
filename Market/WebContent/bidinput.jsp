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
			int acbnum = 0;
			String existbidder = null; 
			float malimit = 0;
			//checks if there is an existing bid
			rn = stmt.executeQuery("select a.bidder from auctionbuyer a where a.auction_Id = "+newAuctionId+" and a.bidder = '"+bidder+"';");
		    while (rn.next()) {
		    	existbidder = rn.getString("a.bidder");
		    }
		   
		    String insert;
		    int bdog;
		    //if there exists a bid already
		                  
		    
			if(existbidder != null){
		    	/*out.println("You already have an existing bid on the item (AuctionID: "+newAuctionId+")");
		    	out.println("<a href='bid.jsp'>Go back</a>");
		    	return;*/
				
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
			    
			    //move old auctionbuyer to bidhistory
			    String oldseller = null;
			    int oldid = 0;
			    float oldincre = 0;
			    String oldbidder = null;
			    float oldalim = 0;
			    float oldbid = 0;
			    rn = stmt.executeQuery("select * from auctionbuyer ab where ab.auction_Id = "+newAuctionId+" and ab.bidder = '"+bidder+"';");
			    while (rn.next()) {
			    	oldid = rn.getInt("auction_id");
			    	oldincre = rn.getFloat("min_increment");
			    	oldbidder = rn.getString("bidder");
			    	oldalim = rn.getFloat("autolimit");
			    	oldbid = rn.getFloat("bidamount");
			    }
			    
			    //get seller name
			    rn = stmt.executeQuery("select * from auction ab where ab.auctionId = "+newAuctionId+";");
			    while (rn.next()) {
			    	oldseller = rn.getString("seller");
			    }
			    
			    //gets datetime
			    java.util.Date d = new java.util.Date();
				java.text.SimpleDateFormat dtf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String newCreationdate = dtf.format(d);
			    
			    //insert to bidhistory
			    insert = "INSERT INTO bidhistory(seller, bidder, biddt, bidamount, auction_id, minincrement, autolimitb)"
						+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			    PreparedStatement ps = con.prepareStatement(insert);
			    ps.setString(1, oldseller);
			    ps.setString(2, oldbidder);
			    ps.setString(3, newCreationdate);
			    ps.setFloat(4, oldbid);
			    ps.setInt(5, oldid);
			    ps.setFloat(6, oldincre);
			    ps.setFloat(7, oldalim);
			    ps.executeUpdate();
			    
			    //insert into acontains
			    insert = "INSERT INTO acontains(auctionId, auction_id, bidamount)"
						+ "VALUES (?, ?, ?)";
			    ps = con.prepareStatement(insert);
			    ps.setInt(1, oldid);
			    ps.setInt(2, oldid);
			    ps.setFloat(3, oldbid);
			    ps.executeUpdate();
			    
				String currentHighestbidder;			
			    //updateauctionbuyer
				insert = "update auctionbuyer set min_increment = (?), autolimit = (?), bidamount = (?) where auctionbuyer.auction_Id = (?) and bidder = (?);";
				ps = con.prepareStatement(insert);
				ps.setFloat(1, newAutobidincrement);
				ps.setFloat(2, newAutobidlimit);
				ps.setFloat(3, bidamount);
				ps.setInt(4, newAuctionId);
				ps.setString(5, bidder);
				ps.executeUpdate();
				
				ResultSet bmax; 
		    	ResultSet mlimit;
		    	
		    	acbnum = 0;
		    
		    	 //insert new bidder as highest
				insert = "update auction set highestbidder = (?), current_bid = (?) where auction.auctionId = (?);";
				ps = con.prepareStatement(insert);
				ps.setString(1, bidder);
				ps.setFloat(2, bidamount);
				ps.setInt(3, newAuctionId);
				ps.executeUpdate();
				
		    	
		    }
			
			else {
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
			    	 insert = "INSERT INTO auctionbuyer(auction_Id, min_increment, bidder, autolimit, bidamount)"
							+ "VALUES (?, ?, ?, ?, ?)";
					PreparedStatement ps = con.prepareStatement(insert);
					ps.setInt(1, newAuctionId);
					ps.setFloat(2, newAutobidincrement);
					ps.setString(3, bidder);
					ps.setFloat(4, newAutobidlimit);
					ps.setFloat(5, bidamount);
					ps.executeUpdate();
					ResultSet bmax; 
			    	ResultSet mlimit;
			    	
			    	acbnum = 0;
			    
			    	 //insert new bidder as highest
					insert = "update auction set highestbidder = (?), current_bid = (?) where auction.auctionId = (?);";
					ps = con.prepareStatement(insert);
					ps.setString(1, bidder);
					ps.setFloat(2, bidamount);
					ps.setInt(3, newAuctionId);
					ps.executeUpdate();
					
					
					insert = "INSERT INTO bidsIn(email, auction_id,bidder)"
							+ "VALUES (?, ?, ?)";
					ps = con.prepareStatement(insert);
					ps.setString(1, bidder);
					ps.setFloat(2, newAuctionId);
					ps.setString(3, bidder);
					ps.executeUpdate();
					
					insert = "INSERT INTO bidsTo(bidder, auction_id, auctionid)"
							+ "VALUES (?, ?, ?)";
					ps = con.prepareStatement(insert);
					ps.setString(1, bidder);
					ps.setFloat(2, newAuctionId);
					ps.setFloat(3, newAuctionId);
					ps.executeUpdate();
			}
		    
		    //------------------------------------------------------------------AUTOHERE		
		    
		    
		    
		    
		    //counts the number of people who have autobid on 
		    rn = stmt.executeQuery("select count(*) from auctionbuyer a where a.auction_Id = "+newAuctionId+" and a.autolimit > "+currentBid+" and a.bidamount < "+currentBid+";"); // where a.auction_id = "+newAuctionId+" and NOT a.autolimit = 0
			    
		    while (rn.next()){	
		    	acbnum = rn.getInt("count(*)");
		    }
		    			
		    			
		    //queries for all autobidders participating in the same auction
		    
		    //gets highest possible bid
		    float smax = 0; 
		    float numab = 0;
		    rn = stmt.executeQuery("select MAX(a.autolimit) from auctionbuyer a where a.auction_id = "+newAuctionId+";"); //and NOT a.bidder = '"+bidder+"' might need
		   	while (rn.next()) {
			   malimit = rn.getFloat("MAX(a.autolimit)");
		   	}
		   	rn = stmt.executeQuery("SELECT MAX(a.autolimit) FROM auctionbuyer a WHERE a.auction_id = "+newAuctionId+" and a.autolimit < (SELECT MAX(a.autolimit) FROM auctionbuyer a where a.auction_id = "+newAuctionId+");");
		   	while (rn.next()) {
				   smax = rn.getFloat("MAX(a.autolimit)");
			}
		   	//goes through each bidder 					
		    String currenthighestbidder = null;
   			float currentmax = 0;
   			float bbidamount;
   			float bidincre;
   			float bidlimits;
   			
   			//num of autobidders
   			rn = stmt.executeQuery("select count(*) from auctionbuyer a where a.auction_id = "+newAuctionId+" and not a.autolimit = 0;"); //and NOT a.bidder = '"+bidder+"' might need
		   	while (rn.next()) {
			   numab = rn.getFloat("count(*)");
		   	}
   			int obdog = 0;
   			
   			rn = stmt.executeQuery("select * from auctionbuyer a where a.auction_id = "+newAuctionId+";");
		   	while (rn.next()) {
		    	//if there are competing bidders calculate autobid if possible
		    	if (acbnum > 0){
		    		//checks if bidlimit is higher than highest bid 
		    		bidlimits = rn.getFloat("autolimit");
		    		bidincre = rn.getFloat("min_increment");
		    		bbidamount = rn.getFloat("bidamount");
		    		String bbidder = rn.getString("bidder");
		    		if (malimit != bidlimits) {
		    			while (malimit > bbidamount && bidlimits > bbidamount) {
			    			bbidamount += bidincre; 
			    		}
		    		}
		    		if (numab == 1 && bidlimits > bbidamount) {
		    			bbidamount += bidincre; 
		    		}
		    		
		    		if (malimit == bidlimits && bidlimits >= (smax + bidincre))  {
		    			bbidamount = smax + bidincre;
		    		}
		    		
		    		obdog = stmt2.executeUpdate("UPDATE auctionbuyer set bidamount = "+bbidamount+" where auction_id = "+newAuctionId+" and bidder = '"+bbidder+"';");
		    	}
		   
		    }		
		   
		   	rn = stmt.executeQuery("select a.bidder, MAX(bidamount) from auctionbuyer a where a.auction_id = "+newAuctionId+";");
   			//get current highest bid and bidder name
 
   			while (rn.next()) {
   				currentmax = rn.getFloat("MAX(bidamount)");
   				currenthighestbidder = rn.getString("a.bidder");
   			}
   			insert = "update auction set highestbidder = (?), current_bid = (?) where auction.auctionId = (?);";
			PreparedStatement pt = con.prepareStatement(insert);
			pt.setString(1, currenthighestbidder);
			pt.setFloat(2, currentmax);
			pt.setInt(3, newAuctionId);
			pt.executeUpdate();
		    	
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
			
		    //update new highest bidder
		    
			con.close();
			out.println("Bid success!");
        	out.println("<a href='Welcome.jsp'>Go back</a>");
        	//response.sendRedirect("Welcome.jsp");
	}
	%>
</body>
</html>