<!DOCTYPE html>
<html>
<head>
    <title>Itemlist</title>
    <%@page import="java.sql.*;"%>
</head>
<body bgcolor=white>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ebay","root","Qwe123456");
        Statement st=con.createStatement();
        String type = request.getParameter("command");
        System.out.println(type);
        String brand = request.getParameter("brand");
        String cond = request.getParameter("condition");
        String name = request.getParameter("name");
        String color = request.getParameter("color");
        ResultSet rs;
        if(type==null)
        {
        	 rs=st.executeQuery("select * from auction,electronics where auction.auctionID=electronics.auction_ID;");
        }
        else 
        	rs=st.executeQuery("select * from " +type+", auction, electronics where "+type+ ".auction_ID= electronics.auction_Id AND electronics.auction_Id=auction.auctionId AND "+"'"+brand+"'"+"=electronics.brand"+" AND electronics.name"+" ="+"'"+name+"'"+" AND electronics.scondition= "+"'"+cond+"'"+" AND electronics.color ="+"'"+color+"'" );
        
     
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
    
<form method="post" action="Browse.jsp">
Sort by <select name="Sort by">
    <option value="name">Product Name A-Z</option>
    <option vale="zname">Product Name Z-A</option>
    <option value="shprice">sale_price-high to low</option> 
    <option value="slprice">sale_price-low to high</option>  
     <option value="mhprice">Current_bid-high to low</option> 
    <option value="mlprice">Current_bid-low to high</option> 
</select>
<input type="submit" value="load" />
</form>
<br>
Search for Bid history
<form method="post" action="Search.jsp">
	<td>AuctionID </td><td><input type="text" name="history"></td>
<input type="submit" value="Search" />
</form>
Search for User History
<form method="post" action="Suser.jsp">
	<td>User name </td><td><input type="text" name="name"></td>
<input type="submit" value="Search" />
</form>

Search for Similar items
<form method="post" action="SProduct.jsp">
	<td>Product name </td><td><input type="text" name="name"></td>
<input type="submit" value="Search" />
</form>
	<a href='Welcome.jsp'>Go back</a><br>
		<a href='advanceSe.jsp'>Advance Search</a>
<script>

</script>

</body>
</html>

<!--executeUpdate() mainupulation and executeQuery() for retriving-->