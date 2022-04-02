<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Logined</title>
	</head>
	<body>
	Hello User 
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			char q='"';
			String entity = request.getParameter("uname");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM user U Where U.name = "+q + entity+q;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("email") %></td>
					<td>
					</td>
				</tr>
				

			<% }
			
		%>
			

		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>