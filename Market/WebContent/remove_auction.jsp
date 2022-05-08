<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>removing auction...</title>
	</head>
	<body>
		<% {
	
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the customer_rep_credentials.jsp
			int entity = Integer.parseInt(request.getParameter("aucID"));
			
			ResultSet rs;
		    stmt.execute("Delete from posts where auctionId='" + entity + "'");
		    stmt.execute("Delete from holds where auctionId='" + entity + "'");
		    stmt.execute("Delete from bidsto where auctionId='" + entity + "'");
		    stmt.execute("Delete from acontains where auctionId='" + entity + "'");
		    stmt.execute("Delete from moderated_by where auctionId='" + entity + "'");
		    stmt.execute("Delete from records where auctionId='" + entity + "'");
		    stmt.execute("Delete from searches where auctionId='" + entity + "'");
		    
		    stmt.execute("Delete from auction where auctionId='" + entity + "'");
		    out.println("removed auction with ID: "+entity);
		} %>
		<a href='customer_rep_welcome.jsp'>Go back</a> <br><br>
	</body>
</html>