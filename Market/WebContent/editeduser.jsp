<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>done</title>
	</head>
	<body>
		<% 
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			ResultSet rn;
			
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String newemail = request.getParameter("newemail");
			String balance = request.getParameter("balance");
			String address = request.getParameter("address");
			String dob = request.getParameter("dob");
			String ccnum = request.getParameter("ccnum");
			String ccv = request.getParameter("ccv");
			String exp = request.getParameter("exp");
			
			String update;
			update = "set foreign_key_checks=0";
			PreparedStatement ps = con.prepareStatement(update);
			ps.executeUpdate();
			
			update = "update asks set email='"+newemail+"' where email='"+email+"'";
			ps = con.prepareStatement(update);
			ps.executeUpdate();
			
			update = "update assisted_by set email='"+newemail+"' where email='"+email+"'";
			ps = con.prepareStatement(update);
			ps.executeUpdate();
			
			update = "update bidsin set email='"+newemail+"' where email='"+email+"'";
			ps = con.prepareStatement(update);
			ps.executeUpdate();
			
			update = "update posts set email='"+newemail+"' where email='"+email+"'";
			ps = con.prepareStatement(update);
			ps.executeUpdate();
			
			update = "update searches set email='"+newemail+"' where email='"+email+"'";
			ps = con.prepareStatement(update);
			ps.executeUpdate();
			
			update = "update user set name='"+name+"' ,password='"+password+"',email='"+newemail+"',dob='"+dob+"',address='"+address+"',balance='"+balance+"',ccnum='"+ccnum+"',ccv='"+ccv+"',exp='"+exp+"' where email='"+email+"'";
			ps = con.prepareStatement(update);
			ps.executeUpdate();
			
			update = "set foreign_key_checks=1";
			ps = con.prepareStatement(update);
			ps.executeUpdate();
			
			//Run the query against the DB
			//parse out the results
			con.close();
			
			out.print("User altered!");
			response.sendRedirect("edituser.jsp");
			
		} 
		catch (Exception ex) {
			out.print(ex);
			out.print("alter failed");
		}
%>
	
	</body>
</html>