<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%
	// jika user sudah login akan redirect ke home
	if(session.getAttribute("username")!=null)
	{
		response.sendRedirect("index.jsp");
	}
%>

<%@ include file="header.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
<h1>Registration</h1>
<hr />
<form method="post" action="process/dosignup.jsp"/>
<legend>
<fieldset><h3><b>Sign up Form</b></h3>
<table border="0">
	<tr>
		<td><label>Username</label></td><td>:</td>
		<td><input type="text" name="usrusrName"></td>
	</tr>
	<tr>
		<td><label>Password</label></td><td>:</td>
		<td><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td><label>Verify Password</label></td><td>:</td>
		<td><input type="password" name="verpwd"></td>
	</tr>
	<tr>
		<td><label>Name</label></td><td>:</td>
		<td><input type="text" name="usrName"></td>
	</tr>
	<tr>
		<td><label>Nickname</label></td><td>:</td>
		<td><input type="text" name="usrNickName"></td>
	</tr>
	<tr>
		<td><label>Email</label></td><td>:</td>
		<td><input type="text" name="usrmail"></td>
	</tr>
	<tr>
		<td><label>Gender</label></td><td>:</td>
		<td><input type="radio" name="gender" value="Male">Male <input type="radio" name="gender" value="Female">Female</td>
	</tr>
	<tr>
		<td><label>Birthdate</label></td><td>:</td>
		<td><input type="text" id="datepicker"></td>
	</tr>
	<tr>
		<td><label>Birthplace</label></td><td>:</td>
		<td><input type="text" name="birthplace"></td>
	</tr>
	<tr>
		<td colspan='2' style='color:red;' align='center'>
		<%
			String error= request.getParameter("msg");
			if(error!=null)
			out.print(error);
		%>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center"/>
			<input type="submit" id="signup" name="signup" value="Sign Up"/>
		</td>
	</tr>
</table>
</form>
</fieldset>
</legend>
<%@ include file="footer.jsp" %>
