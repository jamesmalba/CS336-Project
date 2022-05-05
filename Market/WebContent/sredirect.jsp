<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome!</title>
</head>
<body>
<h1>Sell an item</h1>
	
<% { 
	String entity = request.getParameter("command");
	session.setAttribute("selltype",entity);
	if (entity.equals("sp")) {
		response.sendRedirect("sellphone.jsp");
		return;
	}
	if (entity.equals("tablet")) {
		response.sendRedirect("selltablet.jsp");
		return;
	}
	if (entity.equals("laptop")) {
		response.sendRedirect("selllaptop.jsp");
		return;
	}
	
} %>
	<br>
	<a href='Welcome.jsp'>Go back</a> <br><br>
	<a href='logout.jsp'>Log out</a>
</body>
</html>