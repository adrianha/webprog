<%@ include file="header.jsp" %>
<%@ include file = "process/connect1.jsp" %>
<h1>Forum</h1>
<hr />
<%
String query = "select ForumID,ForumName from MsForum";
ResultSet Header = st1.executeQuery(query);
while(Header.next())
{
%>
<div class="container categoryHolder img-rounded">
    <div class="headerCategory"><h3><%=Header.getString("ForumName")%></h3></div>
<%
  query = "select SubForumID,SubForumName from MsSubForum where ForumID="+Header.getString("ForumID");
  ResultSet Menu = st2.executeQuery(query);
  int column=1;
  while(Menu.next())
  {
    if(column++%3==0)
    {
%>
<div class="container">
        &nbsp;
    </div>
  <%
    }
  %>
  <div class="col-md-4 subCategoryHolder"><a href="contentthread.jsp?category=<%=Menu.getString("SubForumID")%>">
  <span class="glyphicon glyphicon-chevron-right"></span><%=Menu.getString("SubForumName")%></div></a>
  <%
  }
  query = "select ModeratorName from MsModerator where ModeratorID in(select ModeratorID from TrForumModerator where ForumID="+Header.getString("ForumID")+")";
  ResultSet Moderator = st3.executeQuery(query);
  String momod = "";
  while(Moderator.next()){momod=momod+Moderator.getString("ModeratorName")+", ";}
  momod = momod.substring(0,momod.length()-2);
  %>
  <div class="container moderatorHolder">
        <h5>Moderator : <%=momod%></h5>
    </div>
</div>
  <%
}
%>
<%@ include file="footer.jsp" %>