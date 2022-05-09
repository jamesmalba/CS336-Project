<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body>
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ebay","root","Qwe123456");
        Statement st=con.createStatement();
        String entity = request.getParameter("name");
        ResultSet rs;
        if(entity==null)
        {
        	rs=st.executeQuery("select * from bidhistory;");
        }
        else
        {
        	rs=st.executeQuery("select * from auction, electronics Where electronics.auction_id=auction.auctionId AND electronics.name="+"'"+entity+"';");
        }
  
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
               <td>Name</td>
			<td>Brand</td>
			<td>Condition</td>
			<td>Current Bid</td>
			<td>Expiration Date/Time</td>
			<td>Seller</td>
			<td>AuctionId</td>
			<td>Buy it now</td>
          </tr>
      </thead>
      <tbody>
      
        <%while(rs.next())
        {
            %>
            <tr>
                 <td><%= rs.getString("name") %></td>
					<td><%= rs.getString("Brand") %></td>
					<td><%= rs.getString("scondition") %></td>
					<td><%= rs.getString("current_bid") %></td>
					<td><%= rs.getString("expdate") %></td>
					<td><%= rs.getString("seller") %></td>
					<td><%= rs.getString("auctionId") %></td>
					<td><%= rs.getString("sale_price") %></td>
            </tr>
            <%}%>
            
         
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    
    %>


</body>
</html>