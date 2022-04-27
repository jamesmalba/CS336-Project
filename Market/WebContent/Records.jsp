<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Record</title>
</head>
<body>
	<%
		try {

			//Get the database connection
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "rosamygale");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the Admin-welcome.jsp
			String entity = request.getParameter("command");
			
			//Response for total earnings
			if(entity.equals("total")){
				String str = "select sum(item_price) from ledger";
				ResultSet result = stmt.executeQuery(str);
				while(result.next()){
				out.print("The total earnings are " + result.getString("sum(item_price)"));
				}
			}
			
			//Response for earnings per item
			else if(entity.equals("item")){
			String str = "select item, sum(item_price) from ledger group by item";
			ResultSet result = stmt.executeQuery(str);

			out.print("<style>table, tr, td {border: 1px solid black;}tr, td {padding: 10px;}</style>");
			out.print("<table>");
			out.print("<caption> Earnings per Item</caption>");
			
			out.print("<tr>");
			
			out.print("<td>");
			out.print("Item");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Earnings");
			out.print("</td>");
			
			out.print("</tr>");

			while (result.next()) {
				out.print("<tr>");

				out.print("<td>");
				out.print(result.getString("Item"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("sum(item_price)"));
				out.print("</td>");
				
				out.print("</tr>");
			}
			out.print("</table>");
			}
			
			//Response for item type
			else if(entity.equals("type")){
				String str = "select item_type, sum(item_price) from ledger group by item_type";
				ResultSet result = stmt.executeQuery(str);

				out.print("<style>table, tr, td {border: 1px solid black;}tr, td {padding: 10px;}</style>");
				out.print("<table>");
				out.print("<caption> Earnings per Item type</caption>");

				out.print("<tr>");

				out.print("<td>");
				out.print("Item type");
				out.print("</td>");

				out.print("<td>");
				out.print("Earnings");
				out.print("</td>");
				
				out.print("</tr>");

				while (result.next()) {
					out.print("<tr>");

					out.print("<td>");
					out.print(result.getString("item_type"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("sum(item_price)"));
					out.print("</td>");
					
					out.print("</tr>");
				}
				out.print("</table>");
				}
			
			//Response for end-user
			else if(entity.equals("user")){
				String str = "Select seller, sum(item_price) from ledger group by seller order by item_price desc";
				ResultSet result = stmt.executeQuery(str);

				out.print("<style>table, tr, td {border: 1px solid black;}tr, td {padding: 10px;}</style>");
				out.print("<table>");
				out.print("<caption> Earnings per End-user</caption>");

				out.print("<tr>");

				out.print("<td>");
				out.print("User");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Earnings");
				out.print("</td>");
				
				out.print("</tr>");

				while (result.next()) {
					out.print("<tr>");

					out.print("<td>");
					out.print(result.getString("seller"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("sum(item_price)"));
					out.print("</td>");
					
					out.print("</tr>");
				}
				out.print("</table>");
				}
			
			//Respnse for best selling
			else if(entity.equals("best-selling")){
				String str = "Select item, count(item), sum(item_price) from ledger group by item order by count(item) desc limit 5";
				ResultSet result = stmt.executeQuery(str);

				out.print("<style>table, tr, td {border: 1px solid black;}tr, td {padding: 10px;}</style>");
				out.print("<table>");
				out.print("<caption>5 Best-selling items</caption>");

				out.print("<tr>");

				out.print("<td>");
				out.print("Item");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Units sold");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Earnings");
				out.print("</td>");
				out.print("</tr>");

				while (result.next()) {
					out.print("<tr>");

					out.print("<td>");
					out.print(result.getString("item"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("count(item)"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("sum(item_price)"));
					out.print("</td>");
					
					out.print("</tr>");
				}
				out.print("</table>");
				}
			
			//Response for buyer
			else if(entity.equals("buyer")){
				String str = "Select buyer, count(buyer), sum(item_price) from ledger group by buyer order by sum(item_price) desc limit 5";
				ResultSet result = stmt.executeQuery(str);

				out.print("<style>table, tr, td {border: 1px solid black;}tr, td {padding: 10px;}</style>");
				out.print("<table>");
				out.print("<caption>5 Best Buyers</caption>");

				out.print("<tr>");

				out.print("<td>");
				out.print("Buyer");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Items purchased");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Earnings");
				out.print("</td>");
				out.print("</tr>");

				while (result.next()) {

					out.print("<tr>");

					out.print("<td>");
					out.print(result.getString("buyer"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("count(buyer)"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("sum(item_price)"));
					out.print("</td>");
					
					out.print("</tr>");
				}
				out.print("</table>");
				}
			
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>