<%@ include file="header.jsp" %>
<%@ include file = "process/connect1.jsp" %>
<%@ include file = "process/connect2.jsp" %>
<%@ include file = "process/connect3.jsp" %>
<% String cg=request.getParameter("category");
   if(cg==null)
     response.sendRedirect("forum.jsp");
   
   String query="select ModeratorName from MsModerator where ModeratorID in("+
   "select ModeratorID from ((TrForumModerator right join MsForum "+
   "on TrForumModerator.ForumID=MsForum.ForumID)"+
   "left join MsSubForum on MsForum.ForumID=MsSubForum.ForumID)"+
   "where SubForumID="+cg+")";
   ResultSet rs = st1.executeQuery(query);
   String momod="";
   while(rs.next())
   {
      momod += (rs.getString(1)+", ");
   }
   momod=momod.substring(0,momod.length()-2);
   rs.close();
   st1.close();
   con.close();
   rs = st2.executeQuery("select SubForumName from MsSubForum where SubForumID="+cg);
   rs.next();
%>
<div style="text-align:right;padding-right:50px; width:500px; float:right;">Moderator:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <h5><%=momod%></h5>
</div>
   <h2>
   <%=rs.getString("SubForumName")%>
   </h2>
   <%
   st2.close();
   con.close();
   %>
   <h4>
   <table style="background-image:url(../../assets/images/bg.png);-moz-border-radius: 15px;
border-radius: 15px;"><tr><th style="text-align:center" width="750px">Thread</th><th width="350px">Last Post</th></tr></table></h4>
<table class="table-hover" style="color:#000000;">
<%
query="select NickName,MsT.* from " +
"(select ThreadID,UserID,ThreadSubject,LastPost,ViewCount,repliesCount from MsThread where SubForumID="+
cg+") MsT left join MsUser on MsT.UserID=MsUser.UserID";
rs = st3.executeQuery(query);
while(rs.next())
{
%>

<tr>
    <td width="220px">Created by:</td>
    <td rowspan="2" width="492px"><a href="thread.jsp?thr=<%=rs.getString("ThreadID")%>"><%=rs.getString("ThreadSubject")%></a></td>
    <td width="220px">Last Post by:</td><td width="130px">Views: <%=rs.getString("ViewCount")%></td></tr>
<tr>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("NickName")%></td>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("LastPost")%></td>
     <td width="130px">Replies: <%=rs.getString("RepliesCount")%></td>
</tr>
<%}%>
</table>
<%@ include file="footer.jsp" %>