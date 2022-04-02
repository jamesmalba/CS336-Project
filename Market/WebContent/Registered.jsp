<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>done</title>
	</head>
	<body>
	You are registered go back to main page 
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			
			Statement stmt = con.createStatement();
		
			char q='"';
			String name = request.getParameter("uname");
			String pass=request.getParameter("upass");
			String email=request.getParameter("email");
			
			String insert = "Insert into user(name, password,email) "+ "VALUES (?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);
			
			ps.setString(1, name);
			ps.setString(2, pass);
			ps.setString(3, email);
			//Run the query against the DB
			ps.executeUpdate();
			//parse out the results
			
			
		%>
			

		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>