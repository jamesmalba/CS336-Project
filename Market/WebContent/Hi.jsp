<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
</head>
<body>
<h1>Welcome to Eebay</h1>
	
	<form action="Login.jsp" method="post">
		Username: <input type= text name="uname"><br><br>
		Password: <input type= text name="upass"><br>
		<input type="submit" value="Submit">
	</form>
	
	<br><br><br>
	   No account?? Register then
	   <form method="get" action="Register.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
		    <!-- <input type="radio" name="command" value="beers"/> -->
		  <input type="submit" value="Register Here"/>
		</form>
		<br>
	   
	   Are you an Admin? Login here
	   <form method="get" action="admin_login.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
		    <!-- <input type="radio" name="command" value="beers"/> -->
		  <input type="submit" value="Login Here"/>
		</form>
	
</body>
</html>