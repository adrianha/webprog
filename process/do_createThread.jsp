<%@ include file = "connect1.jsp" %>
<%
String forum = request.getParameter("forum");
String post = request.getParameter("editor8");
String title = request.getParameter("title");
if(forum.equals("")){
	response.sendRedirect("../createThread.jsp");return;}
if(title.equals("")){
	response.sendRedirect("../createThread.jsp?err=title");return;}
session.setAttribute("title",title);
if(post.equals("")){
	response.sendRedirect("../createThread.jsp?err=post");return;}
else{
post = post.substring(3,post.length()-6);
st1.executeUpdate("insert into MsThread(SubForumID,ThreadSubject,Thread,ViewCount,UserID,CreatedDate,RepliesCount,LastPost,LastPostDate)" +
" values('"+forum+"','"+title+"','"+post+"',0,"+session.getAttribute("user_id")+",Now(),0,"+session.getAttribute("user_id")+",Now())");
con.close();
response.sendRedirect("../contentthread.jsp?category="+forum);
}
%>