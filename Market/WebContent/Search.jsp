<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction History</title>
</head>
<body>
 <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ebay","root","Qwe123456");
        Statement st=con.createStatement();
        String entity = request.getParameter("history");
        ResultSet rs;
       
       rs=st.executeQuery("select * from bidhistory,auction where bidhistory.auction_id=auction.auctionID;");
        
       
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
                <th>Seller</th>
                <th>bidder</th>
                 <th>time</th>
                  <th>buy_price</th>
             
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("Seller") %></td>
              	<td><%=rs.getString("bidder") %></td>
              	<td><%=rs.getString("time") %></td>
              	<td><%=rs.getString("buyer_price") %></td>
              	
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