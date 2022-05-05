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
        String entity = request.getParameter("Sort by");
        ResultSet rs;
        if(entity==null)
        {
        	 rs=st.executeQuery("Select S.name, A.current_bid From smartphone S, auction A, holds h Where A.auctionID=h.auctionID AND h.product_id=S.product_id;");
        }
        else
        {
        	 rs=st.executeQuery("Select S.name, A.current_bid From smartphone S, auction A, holds h Where A.auctionID=h.auctionID AND h.product_id=S.product_id;");
        }
       
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>Name</th>
              <th>current bid</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("name") %></td>
              	<td><%=rs.getString("current_bid") %></td>
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
    <option value="name">name A-Z</option>
    <option vale="zname">name Z-A</option>
    <option value="lprice">price-high to low</option> 
    <option value="lprice">price-low to high</option> 
    <option value="hprice">type</option> 
</select>
<input type="submit" value="load" />
</form>
<script>

</script>

</body>
</html>

<!--executeUpdate() mainupulation and executeQuery() for retriving-->