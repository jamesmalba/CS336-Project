<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>question posted!</title>
</head>
<body>
		<% 
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			
			ResultSet rn;
			
			String entity = request.getParameter("question");
			
			int newqId = 0;
			int highestqId = 0;
			
			rn = stmt.executeQuery("select MAX(qId), count(qId) from qna");
			
			while (rn.next()) {
				newqId = rn.getInt("count(qId)");
				highestqId = rn.getInt("MAX(qId)");
				    }
			if (highestqId >= newqId) {
		    	newqId = highestqId +1;
		    }
		    else {
		    	newqId +=1;
		    }
			
			String insert = "INSERT INTO qna(question, answer, qId)"
					+ "VALUES (?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);
			ps.setString(1, entity);
			ps.setString(2, null);
			ps.setString(3, Integer.toString(newqId));
			ps.executeUpdate();
			
			insert = "INSERT INTO asks(qId, email)"
					+ "VALUES (?, ?)";
			ps = con.prepareStatement(insert);
			String email = (String)session.getAttribute("user");
			ps.setString(1, Integer.toString(newqId));
			ps.setString(2, email);
			ps.executeUpdate();
			con.close();
			
			response.sendRedirect("qna.jsp");
			
		} 
		catch (Exception ex) {
			out.print(ex);
			out.print("ask failed");
		}
%>
	
	</body>