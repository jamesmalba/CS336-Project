<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Q and A</title>
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