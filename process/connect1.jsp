<%@ page import="java.sql.*" %>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + application.getRealPath("WEB-INF/nimbrung_db.accdb"));
	Statement st1 = con.createStatement(1004,1008);
	Statement st2 = con.createStatement(1004,1008);
	Statement st3 = con.createStatement(1004,1008);
%>
