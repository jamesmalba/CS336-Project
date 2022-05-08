<!DOCTYPE html>
<html>
<head>
    <title>Q and A</title>
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
        String entity = request.getParameter("word");
        ResultSet rs;
        if(entity==null)
        {
        	 rs=st.executeQuery("select * from qna where qna.question regexp '^.*"+entity+".*$'");
        }
        else
        {
        	 rs=st.executeQuery("select * from qna where qna.question regexp '^.*"+entity+".*$'");
        }
       
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
              <td>qId</td>
			<td>Question</td>
			<td>Answer</td>
          </tr>
      </thead>
      <tbody>
      
        <%while(rs.next())
        {
            %>
            <tr>
               <td><%= rs.getString("qId") %></td>
					<td><%= rs.getString("question") %></td>
					<td><%= rs.getString("answer") %></td>
              	
            </tr>
            <%}%>
            
         
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    
    %>
    
<br>
	<a href='Welcome.jsp'>Go back</a>
<script>

</script>

</body>
</html>

<!--executeUpdate() mainupulation and executeQuery() for retriving-->