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
		<% 
		try {
		
			String name = request.getParameter("uname");
			String pass = request.getParameter("upass");
			String email = request.getParameter("email");
			String passc = request.getParameter("upassc");
			String dob = request.getParameter("dob");
			String addr = request.getParameter("address");
			
			if(!pass.equals(passc)){
		    	out.println("Password and confirm password have to match.");
		    	out.println("<a href='Register.jsp'>try again</a>");
		    	return;
		    }
			
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			
			Statement stmt = con.createStatement();
			String insert = "INSERT INTO user(name,password,email,dob,address)" + "VALUES (?, ?, ?, ?,?)";
			PreparedStatement ps = con.prepareStatement(insert);
			
			ps.setString(1, name);
			ps.setString(2, pass);
			ps.setString(3, email);
			ps.setString(4, dob);
			ps.setString(5, addr);
			//Run the query against the DB
			ps.executeUpdate();
			//parse out the results
			con.close();
			
			out.print("User created!");
			response.sendRedirect("Hi.jsp");
			
		} 
		catch (Exception ex) {
			out.print(ex);
			out.print("Insert failed");
		}
%>
	
	</body>
</html>