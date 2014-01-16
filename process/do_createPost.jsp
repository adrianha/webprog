<%@ include file = "connect1.jsp" %>
<%
String threadId = request.getParameter("threadId");
String post = request.getParameter("editor8");
String subject = request.getParameter("subject");
String userId = (String)session.getAttribute("user_id");
if(subject.equals("")){
	response.sendRedirect("../createPost.jsp?err=subject");return;}
if(subject.equals("")){
	response.sendRedirect("../createPost.jsp?err=subject");return;}
session.setAttribute("subject",subject);
if(post.equals("")){
	response.sendRedirect("../createPost.jsp?err=post");return;}
else{
String query = "insert into MsPost(ThreadID, Subject,Post,UserID,PostDate) values ("+threadId+",'"+subject+"','"+post+"',"+userId+",Now())";
st1.executeUpdate(query);
con.close();
response.sendRedirect("../thread.jsp?thr="+threadId);
}
%>