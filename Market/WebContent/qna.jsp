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
<h1>Customer Question and Answer</h1>
<h4>Hello <%=session.getAttribute("user")%></h4>
<form action = "ask.jsp" method="post">
	<table>
		<tr><td>Ask a Question:</td></tr>
		<tr><td>Enter here: <input type= text name="question"> </td></tr>
	</table>
	</form>
Search for a question
<form method="post" action="keyword.jsp">
	<td>Keyword </td><td><input type="text" name="word"></td>
<input type="submit" value="Search" />
</form>	
List of questions and answers:
	<% try {
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			
			String str = "select * from qna";
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>Question Id</td>
			<td>Question</td>
			<td>Answer</td>
		</tr>
			<%
			//parse out the results
			while (result.next() ) { %>
				<tr>    
					<td><%= result.getString("qId") %></td>
					<td><%= result.getString("question") %></td>
					<td><%= result.getString("answer") %></td>
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
		
	<a href='Welcome.jsp'>Go back</a>
</body>
<style type="text/css">
td
{
    padding:0 15px;
}
</style>
</html>