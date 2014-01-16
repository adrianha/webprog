<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%
	// jika user sudah login akan redirect ke home
	if(session.getAttribute("username")!=null)
	{
		response.sendRedirect("index.jsp");
	}
%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<%@ include file="header.jsp" %>
<script>
  <!--$(function() {
    //$('#datepicker').datepicker({
			//format: 'mm-dd-yyyy'
		//});
  //});-->
  </script>
  <style type="text/css">
  input{
  margin-left: 10px;
  }
  </style>
<h1>Registration</h1>
<hr />
<form method="post" action="process/dosignup.jsp"/>
<legend>
<fieldset><h3><b>Sign up Form</b></h3>
<table border="0">
	<tr>
		<td><label>Username</label></td><td>:</td>
		<td><input type="text" name="usrusrName" placeholder="Username"></td>
	</tr>
	<tr>
		<td><label>Password</label></td><td>:</td>
		<td><input type="password" name="pwd" placeholder="Password"></td>
	</tr>
	<tr>
		<td><label>Verify Password</label></td><td>:</td>
		<td><input type="password" name="verpwd" placeholder="Verify password"></td>
	</tr>
	<tr>
		<td><label>Name</label></td><td>:</td>
		<td><input type="text" name="usrName" placeholder="Full name"></td>
	</tr>
	<tr>
		<td><label>Nickname</label></td><td>:</td>
		<td><input type="text" name="usrNickName" placeholder="Nickname"></td>
	</tr>
	<tr>
		<td><label>Email</label></td><td>:</td>
		<td><input type="text" name="usrmail" placeholder="Email"></td>
	</tr>
	<tr>
		<td><label>Gender</label></td><td>:</td>
		<td>&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="Male">Male <input type="radio" name="gender" value="Female">Female</td>
	</tr>
	<tr>
		<td><label>Birthdate</label></td><td>:</td>
		<td><input type="date" id="datepicker" name="bdate"></td>
	</tr>
	<tr>
		<td><label>Birthplace</label></td><td>:</td>
		<td><input type="text" name="birthplace" placeholder="Birthplace"></td>
	</tr>
	<tr>
		<td colspan='2' style='color:red;' align='center'>
		<strong><%
			String error= request.getParameter("msg");
			if(error!=null)
			out.print(error);
		%></strong>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center"/>
			<input type="submit" id="signup" name="signup" value="Sign Up"/><input type="reset" id="reset" name="reset" value="Reset"/>
		</td>
	</tr>
</table>
</form>
</fieldset>
</legend>
<%@ include file="footer.jsp" %>
