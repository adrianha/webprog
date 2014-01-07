<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
		String connectionURL = "jdbc:mysql://localhost:3306/test";
		Connection connection = null; 
		Statement st=null;
		ResultSet rs=null;
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root", "root");
		if(!connection.isClosed()){
			st=connection.createStatement();
		}
%>