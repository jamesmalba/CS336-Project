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
	
	<h2>User Login</h2>
	<form action="Login.jsp" method="post">
		Username (Email): <input type= text name="uname"> <br><br>
		Password: <input type= text name="upass"><br>
		<input type="submit" value="Submit">
	</form>
	
	<br> 
	Example: <br>Username: test@rutgers.edu <br>password: qwe123
	<br> <br>
	Make sure db username/password is set as:<br> user: root <br>password: Qwe123456
	<br><br><br>
	
		<a href="Register.jsp">No account?? Register then</a> <br> <br>
	   	<a href="customer_rep_login.jsp">Are you an Employee? Login here</a> <br> <br>
		<a href="admin_login.jsp">Are you an Admin? Login here</a> <br> 
	
	
</body>
</html>