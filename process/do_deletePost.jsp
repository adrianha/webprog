<%@ include file = "connect1.jsp" %>
<%
	String id = request.getParameter("id");
	String thr = request.getParameter("thr");

	String query = "delete from MsPost where PostID = " + id;

	st1.executeUpdate(query);

	con.close();

	response.sendRedirect("../thread.jsp?thr="+thr);
%>