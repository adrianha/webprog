<%@page import="java.sql.*"%>
<%@include file ="connect.jsp"%>

<%
	String user = request.getParameter("txtUser");
	String pass = request.getParameter("txtPass");
	String conPass = request.getParameter("txtConPass");
	String addr = request.getParameter("txtAddr");
	String telp = request.getParameter("txtTelp");
	String email = request.getParameter("txtEmail");
	boolean isNumber=false;
	if (user.equals("") || user==null) {
		response.sendRedirect("../register.jsp?msg=Username must be filled");
	}
	else {
		String q="SELECT * FROM MsUser WHERE Username = '" + user + "'";
		ResultSet rs = st.executeQuery(q);
		if(rs.next())
		{
			response.sendRedirect("../register.jsp?msg=Username already used");
		}
		else if (pass.equals("") || pass==null){
		response.sendRedirect("../register.jsp?msg=Password must be filled");
		}

		else if (conPass.equals("") || conPass==null){
			response.sendRedirect("../register.jsp?msg=Confirm Password must be filled");
		}
		else if (!conPass.equals(pass)){
			response.sendRedirect("../register.jsp?msg=Wrong Confirm Password");
		}
		else if (addr.equals("") || addr==null){
		response.sendRedirect("../register.jsp?msg=Address must be filled");
		}
		else if (addr.length()<10){
			response.sendRedirect("../register.jsp?msg=Address length must higher than 9 characters");
		}
		else if (!addr.contains("street")){
			response.sendRedirect("../register.jsp?msg=Address must contain street");
		}
		else if (telp.equals("") || telp==null){
			response.sendRedirect("../register.jsp?msg=Telephone must be filled");
		}
		else {
			try{
				Long.parseLong(telp);
				isNumber=true;
			}
			catch(Exception e){
				isNumber=false;
			}
			if(!isNumber){				
				response.sendRedirect("../register.jsp?msg=Telephone must be number");
			}
			else if(telp.length()<12 || telp.length()>15){
				response.sendRedirect("../register.jsp?msg=Telephone length must between 12-15 digits");
			}
			else if (email.equals("") || email==null){
				response.sendRedirect("../register.jsp?msg=Email must be filled");
			}
			else {
				if(!email.contains("@")){
					response.sendRedirect("../register.jsp?msg=Wrong email format 1");
				}
				else if(!email.contains(".")){
					response.sendRedirect("../register.jsp?msg=Wrong email format 2");
				}
				else if(email.charAt(0)=='@' || email.charAt(0)=='.'){
					response.sendRedirect("../register.jsp?msg=Wrong email format 3");
				}
				else if(email.charAt(email.length()-1)=='@' || email.charAt(email.length()-1)=='.'){
					response.sendRedirect("../register.jsp?msg=Wrong email format 4");
				}
				else if(email.contains("@.") || email.contains(".@")){
					response.sendRedirect("../register.jsp?msg=Wrong email format 5");
				}
				else{
					String query = "insert into msuser (Username,Password,Address,Telephone,Email) values ('"+user+"','"+pass+"','"+addr+"','"+telp+"','"+email+"')";
					st.executeUpdate(query);
					con.close();
					response.sendRedirect("../register.jsp?msg=Registration Success");
				}
			}
		}
	}
%>