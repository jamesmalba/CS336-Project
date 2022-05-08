<!DOCTYPE html>
<html>
<head>
    <title>Itemlist</title>
<%@ page import="java.io.*,java.util.*,java.sql.*"%></head>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<body bgcolor=white>
<h1>Browse</h1>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ebay","root","Qwe123456");
        Statement st=con.createStatement();
        String entity = request.getParameter("Sort by");
        ResultSet rs;
        if(entity==null)
        {
        	 rs=st.executeQuery("select * from auction,electronics where auction.auctionID=electronics.auction_ID;");
        }
        else if(entity.equals("name"))
        {
        	rs=st.executeQuery("select * from auction,electronics where auction.auctionID=electronics.auction_ID Order by(electronics.name);");
        }
        else if(entity.equals("zname"))
        {
        	rs=st.executeQuery("select * from auction,electronics where auction.auctionID=electronics.auction_ID Order by(electronics.name) DESC;");
        }
        else if(entity.equals("shprice"))
        {
        	rs=st.executeQuery("select * from auction,electronics where auction.auctionID=electronics.auction_ID Order by(auction.sale_price) DESC;");
        }
        else if(entity.equals("slprice"))
        {
        	rs=st.executeQuery("select * from auction,electronics where auction.auctionID=electronics.auction_ID Order by(auction.sale_price);");
        }
        else if(entity.equals("mhprice"))
        {
        	rs=st.executeQuery("select * from auction,electronics where auction.auctionID=electronics.auction_ID Order by(auction.current_bid) DESC;");
        }
        else if(entity.equals("mlprice"))
        {
        	rs=st.executeQuery("select * from auction,electronics where auction.auctionID=electronics.auction_ID Order by(auction.current_bid);");
        }
        else
        {
        	 rs=st.executeQuery("Select S.name, A.current_bid From smartphone S, auction A, holds h Where A.auctionID=h.auctionID AND h.product_id=S.product_id;");
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
    
<form method="post" action="Browse.jsp">
Sort by <select name="Sort by">
    <option value="name">Product Name A-Z</option>
    <option value="zname">Product Name Z-A</option>
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