<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Dashboard</title>
</head>
<body>
<h1>Welcome Admin</h1>
Hello <%=session.getAttribute("user")%> <br>
	<a href="representative_register.jsp">Create customer representative account</a> <br> <br>
	<a href='logout.jsp'>Log out</a>
</body>
</html>