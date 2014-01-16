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
   <div class="container">
      <span class="textLarge">
        <%= "Category : " + rs.getString("SubForumName")%>
      </span>
      <br />
      <span class="textMedium" style="color:purple;">
        <%= "Moderator : " + momod%>
      </span>
   </div>
   <hr />
   <%
   st2.close();
   con.close();
   %>
  <div class="container threadListContainer">
    <table cellpadding="10px" class="table table-hover table-striped threadListTable" class="centerr" width="1000px">
      <tr class="textMedium">
        <th>Thread Name</th>
        <th>Thread Starter</th>
        <th>Last Post By</th>
        <th>Details</th>
      </tr>
      <%
        query="select NickName,MsT.* from " +
        "(select ThreadID,UserID,ThreadSubject,LastPost,ViewCount,repliesCount from MsThread where SubForumID="+
        cg+") MsT left join MsUser on MsT.UserID=MsUser.UserID";
        ResultSet rs2 = st3.executeQuery(query);
        while(rs2.next())
        {
      %>
        <tr class="textSmall" style="font-weight:bolder;">
          <td><a href="thread.jsp?thr=<%=rs2.getString("ThreadID")%>">
            <%= rs2.getString("ThreadSubject") %>
          </a></td>
          <td><%= rs2.getString("NickName") %></td>
          <td><%= rs2.getString("LastPost") %></td>
          <td>
            <span>
                Views : <%= rs2.getString("ViewCount") %>
            </span>
              <br />
            <span>
                Replies : <%= rs2.getString("repliesCount") %>
            </span>
          </td>
        </tr>
      <%
        }
      %>
    </table>
  </div>
<%@ include file="footer.jsp" %>