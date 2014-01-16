<%@ include file = "connect1.jsp" %>
<%@ include file = "connect2.jsp" %>
<%@ include file = "connect3.jsp" %>
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

String query2 = "update MsThread set RepliesCount = RepliesCount + 1 where ThreadId = " + threadId;
st2.executeUpdate(query2);

String query3 = "update MsThread set LastPost = '"+session.getAttribute("user_name")+"' where ThreadId = " + threadId;
st3.executeUpdate(query3);


con.close();
con1.close();
con2.close();

response.sendRedirect("../thread.jsp?thr="+threadId);
}
%>