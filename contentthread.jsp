<%@ include file="header.jsp" %>
<%@ include file = "process/connect1.jsp" %>
<%@ include file = "process/connect2.jsp" %>
<%@ include file = "process/connect3.jsp" %>
<% String cg=request.getParameter("category");
   String query="select ModeratorName from MsModerator where ModeratorID in("+
   "select ModeratorID from ((TrForumModerator right join MsForum "+
   "on TrForumModerator.ForumID=MsForum.ForumID)"+
   "left join MsSubForum on MsForum.ForumID=MsSubForum.ForumID)"+
   "where SubForumID="+cg+")";
   ResultSet rs = st1.executeQuery(query);
   String momod="";
   while(rs.next())
   {
      momod += rs.getString(1);
   }
   momod.substring(0,momod.length()-2);
   rs.close();
   con.close();
   rs = st2.executeQuery("select SubForumName from MsSubForum where SubForumID="+cg);
   rs.next();
%>
   <h2>
   <%=rs.getString("SubForumName")%>
   </h2>
   <div style="text-align:right;padding-right:50px; width:300px;">Moderator:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <h5><%=momod%>dsjafklhalsdkhfklasdhlkacnhdcal;scnhsdlkcabsdkljbnaskldhfalksdnckasdn</h5>
   </div>
   <%
   con.close();
   %>
   <h4>
   <table style="background-image:url(../../assets/images/bg.png);-moz-border-radius: 15px;
border-radius: 15px;"><tr><th style="text-align:center" width="750px">Thread</th><th width="350px">Last Post</th></tr></table></h4>
<table class="table-hover" style="color:#000000;">

<tr>
    <td width="220px">Created by:</td>
    <td rowspan="2" width="492px">Thread Name1</td>
    <td width="220px">Last Post by:</td><td width="130px">Views: 3240</td></tr>
<tr>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;user1</td>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;Tommy</td>
     <td width="130px">Replies: 386</td>
</tr>

<tr>
    <td width="220px">Created by:</td>
    <td rowspan="2" width="492px">Thread Name2</td>
    <td width="220px">Last Post by:</td><td width="130px">Views: 2643</td></tr>
<tr>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;user2</td>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;Gerard</td>
     <td width="130px">Replies: 374</td>
</tr>

</table>
<%@ include file="footer.jsp" %>