<%@ page import="java.sql.*" %>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con3 = DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + application.getRealPath("WEB-INF/nimbrung_db.accdb"));
	Statement st3 = con3.createStatement(1004,1008);
%>
