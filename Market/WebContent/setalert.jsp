<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Set Alerts</title>
	</head>
	<body>
		<h2>Set an alert to get notified when an item becomes available</h2>
		<form method="post" action="setalert.jsp">
		<table>
			<tr>    
				<td>Item type:</td>
				<td>
					<select name="type" size=1>
						<option value="Smartphone">Smartphone</option>
						<option value="Tablet">Tablet</option>
						<option value="Laptop">Laptop</option>
					</select>  
				</td>
			</tr>
			<tr>
				<td>Item name:</td><td><input type = "text" name = "item"></td>
			</tr>
		</table>
		<br>
			<input type = "submit" value = "Set alert!">
		</form>	
		<br><br>
		<%
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
				Statement stmt = con.createStatement();
				String uemail = (String)session.getAttribute("user");
				ResultSet rn;
				int existitem = 0;
				String itemname = request.getParameter("item");
				String itemtype = request.getParameter("type");
				
				rn = stmt.executeQuery("select count(*) from requests where requests.item_name = '"+itemname+"';");
				while (rn.next()) {
					existitem = rn.getInt("count(*)");
				}
				
				if (existitem == 1) {
					out.println("You have already set an alert for this item.");
			    	return;
				}
				else{
					String str = "INSERT INTO requests(email, item_name) values('"+uemail+"', '"+itemname+"');";
					PreparedStatement ps = con.prepareStatement(str);
					ps.executeUpdate();
					out.print("Your alert has been set <br><br>");
				}
				con.close();
				
			}
			catch(Exception e){
				out.print(e);
			}
		%>
					

			<a href='Welcome.jsp'>Return to Home Page</a>
			<a href='logout.jsp'>Log out</a>
	</body>	
</html>