<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>question answered!</title>
</head>
<body>
		<% 
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			
			ResultSet rn;
			
			String answer = request.getParameter("answer");
			int qId = Integer.parseInt(request.getParameter("qId"));
			
			String update = "Update qna set answer='"+answer+"' where qId ="+qId;
			PreparedStatement ps = con.prepareStatement(update);
			ps.executeUpdate();

			con.close();
			
			response.sendRedirect("repqna.jsp");
			
		} 
		catch (Exception ex) {
			out.print(ex);
			out.print("ask failed");
		}
%>
	
	</body>