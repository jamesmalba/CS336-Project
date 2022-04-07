<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome</title>
	</head>
	<body>
		<% {
	
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("uname");
			String pass = request.getParameter("upass");
			
			ResultSet rs;
		    rs = stmt.executeQuery("select * from user where email='" + entity + "' and password='" + pass + "'");
		
			if (rs.next()) {
        		session.setAttribute("user", entity); // the username will be stored in the session
        		out.println("Welcome " + entity + "!!!");
        		out.println("<a href='logout.jsp'>Log out</a>");
        		response.sendRedirect("Welcome.jsp");
    		} else {
        		out.println("Invalid password <a href='Hi.jsp'>try again</a>");
    		}
		} %>

	</body>
</html>