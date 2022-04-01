<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
</head>
<body>
	<center>
	<form action="Login.jsp" method="post">
	Username :<input type= text name="uname">
	Password :<input type= text name="upass">
	<input type="submit">
	</form>
	</center>
	 <br>
	  <br>
	   <br>
	   No account?? Register then
	   <form method="post" action="Register.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
		  <input type="radio" name="command" value="beers"/>
		  <br>
		  <input type="submit" value="submit" />
		</form>
		<br>
	   
	
</body>
</html>