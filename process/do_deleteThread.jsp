<%@ include file = "connect1.jsp" %>
<%
	String id = request.getParameter("id");
	String cg = request.getParameter("category");

	String query = "delete from MsThread where ThreadID = " + id;

	st1.executeUpdate(query);

	con.close();

	response.sendRedirect("../contentthread.jsp?category="+cg);
%>