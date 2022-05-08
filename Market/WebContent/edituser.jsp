<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Q and A</title>
</head>
<body>
<h1>Hello <%=session.getAttribute("user")%></h1>
<form action = "editeduser.jsp" method="post">
	<table>
		<tr><td>Edit a user:</td></tr>
		<tr><td>User Email: <input type= text name="email"> </td></tr>
		<tr><td>New User Email: <input type= text name="newemail"> </td></tr>
		<tr><td>User Name: <input type= text name="name"> </td></tr>
		<tr><td>User Password: <input type= text name="password"> </td></tr>
		<tr><td>User Dob: <input type= text name="dob"> </td></tr>
		<tr><td>User Balance: <input type= text name="balance"> </td></tr>
		<tr><td>User Address: <input type= text name="address"> </td></tr>
		<tr><td>User ccnum: <input type= text name="ccnum"> </td></tr>
		<tr><td>User ccv: <input type= text name="ccv"> </td></tr>
		<tr><td>User exp: <input type= text name="exp"> </td></tr>
		<tr><td><input type="submit" value="Submit"> </td></tr>
		
	</table>
	</form>
List of Users:
	<% try {
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			
			String str = "select * from user";
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>name </td>
			<td>email </td>
			<td>password </td>
			<td>DoB </td>
			<td>balance </td>
			<td>address </td>
			<td>CCNum </td>
			<td>CCV </td>
			<td>Exp </td>
		</tr>
			<%
			//parse out the results
			while (result.next() ) { %>
				<tr>    
					<td><%= result.getString("name") %></td>
					<td><%= result.getString("email") %></td>
					<td><%= result.getString("password") %></td>
					<td><%= result.getString("dob") %></td>
					<td><%= result.getString("balance") %></td>
					<td><%= result.getString("address") %></td>
					<td><%= result.getString("ccnum") %></td>
					<td><%= result.getString("ccv") %></td>
					<td><%= result.getString("exp") %></td>
				</tr>
				

			<% }
			//close the connection.
			con.close();
			%>
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		<br>
		
	<a href='customer_rep_welcome.jsp'>Go back</a>
</body>
</html>