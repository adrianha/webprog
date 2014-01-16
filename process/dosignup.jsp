<%@page import="java.sql.*,java.io.*,java.util.Date,javax.servlet.*,java.text.*"%>
<%@include file ="connect1.jsp"%>

<%
	String user = request.getParameter("usrusrName");
	String pass = request.getParameter("pwd");
	String conPass = request.getParameter("verpwd");
	String name = request.getParameter("usrName");
	String nick = request.getParameter("usrNickName");
	String email = request.getParameter("usrmail");
	String gender = request.getParameter("gender");
	String bday = request.getParameter("bdate");
	String birthplace = request.getParameter("birthplace");
	String pattern = "[a-zA-Z]*";
	Date tgl = new Date();
	DateFormat df = new SimpleDateFormat("mm-dd-yyyy");
	String formattedDate = df.format(tgl);
	//username
	if (user.equals("") || user==null) {
		response.sendRedirect("../signup.jsp?msg=Username must be filled");
		return;
	}
	else {
		String q="SELECT * FROM MsUser WHERE Username = '" + user + "'";
		ResultSet rs = st1.executeQuery(q);
		if(rs.next())
		{
			response.sendRedirect("../signup.jsp?msg=Username already used");
			return;
		}
	}
	
	//password
	if (pass.equals("") || pass==null){
		response.sendRedirect("../signup.jsp?msg=Password must be filled");
		return;
	}
	else if (conPass.equals("") || conPass==null){
		response.sendRedirect("../signup.jsp?msg=Confirm Password must be filled");
		return;
	}
	else if (!conPass.equals(pass)){
		response.sendRedirect("../signup.jsp?msg=Wrong Confirm Password");
		return;
	}
	
	//name
	if (name.equals("") || name==null){
		response.sendRedirect("../signup.jsp?msg=Name must be filled");
		return;
	}
	else if (name.length()<5){
		response.sendRedirect("../signup.jsp?msg=Name length must higher than 5 characters");
		return;
	}
	/*else if (!name.contains(" ")){
		response.sendRedirect("../signup.jsp?msg=Name must contain your family name");
		return;
	}*/
	else if(name.charAt(0)==' '){
		response.sendRedirect("../signup.jsp?msg=Incorrect name format");
		return;
	}
	else if(!name.matches(pattern))
	{
		response.sendRedirect("../signup.jsp?msg=Incorrect name format");
	}
	//email
	if (email.equals("") || email==null){
		response.sendRedirect("../signup.jsp?msg=Email must be filled");
		return;
	}
	else{
		if(!email.contains("@")){
			response.sendRedirect("../signup.jsp?msg=Wrong email format 1");
			return;
		}
		else if(!email.contains(".")){
			response.sendRedirect("../signup.jsp?msg=Wrong email format 2");
			return;
		}
		else if(email.charAt(0)=='.' || email.charAt(0)=='.'){
			response.sendRedirect("../signup.jsp?msg=Wrong email format 3");
			return;
		}
		else if(email.charAt(email.length()-1)=='@' || email.charAt(email.length()-1)=='.')
		{
			response.sendRedirect("../signup.jsp?msg=Wrong email format 4");
			return;
		}
		else if(email.contains("@.") || email.contains(".@")){
			response.sendRedirect("../signup.jsp?msg=Wrong email format 5");
			return;
		}
	}
	
	//gender
	if(gender==null||gender.equals(""))
	{
		response.sendRedirect("../signup.jsp?msg=Choose your gender");
		return;
	}
	
	//bday
	if(bday==null || bday.equals("")){
		response.sendRedirect("../signup.jsp?msg=Choose your birthday");
		return;
	}
	else if(bday.equals(formattedDate))
	{
		response.sendRedirect("../signup.jsp?msg=Birthday incorrect");
	}
	//birthplace
	if(birthplace==null||birthplace.equals(""))
	{
		response.sendRedirect("../signup.jsp?msg=Birthplace must be filed");
		return;
	}else if(!birthplace.matches(pattern))
	{
		response.sendRedirect("../signup.jsp?msg=Incorrect birthplace");
		return;
	}
	
	String query = "insert into msuser (Username,Password,FullName,Nickname,Email,Gender,BirthDate,Birthplace) values ('"+user+"','"+pass+"','"+name+"','"+nick+"','"+email+"', '"+gender+"', '"+bday+"', '"+birthplace+"')";
	st1.executeUpdate(query);
	con.close();
	session.setAttribute("username", user);
	response.sendRedirect("../index.jsp?err=Sign up Success, Now you can sign in");
	
%>