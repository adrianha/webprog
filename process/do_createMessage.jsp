<%@ include file = "connect1.jsp" %>
<%
String post = request.getParameter("editor8");
String UserIDTo = request.getParameter("UserIDTo");

if(post.equals("")){
	response.sendRedirect("../profilemessage.jsp?err=post");return;}
else{
post = post.substring(3,post.length()-6);
st1.executeUpdate("insert into MsMessage(Message, UserID, UserIDFrom)" +
" values('"+post+"','"+UserIDTo+"', '"+session.getAttribute("user_id")+"')");
con.close();
response.sendRedirect("../profilemessage.jsp");
}
%>