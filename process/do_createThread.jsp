<%@ include file = "connect1.jsp" %>
<%@ include file = "connect2.jsp" %>
<%@ include file = "connect3.jsp" %>
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
//post = post.substring(3,post.length()-6);
st1.executeUpdate("insert into MsThread(SubForumID,ThreadSubject,Thread,ViewCount,UserID,CreatedDate,RepliesCount,LastPost,LastPostDate)" +
" values('"+forum+"','"+title+"','"+post+"',0,"+session.getAttribute("user_id")+",Now(),0,'"+session.getAttribute("user_name")+"',Now())");
con.close();

String query2 = "select * from MsThread Order By ThreadID DESC";
ResultSet rs2 = st2.executeQuery(query2);
rs2.next();

String threadId = rs2.getString(1);
String userId = (String)session.getAttribute("user_id");

String query3 = "insert into MsPost(ThreadID, Subject,Post,UserID,PostDate) values ("+threadId+",'"+title+"','"+post+"',"+userId+",Now())";
st3.executeUpdate(query3);
con2.close();

response.sendRedirect("../contentthread.jsp?category="+forum);
}
%>