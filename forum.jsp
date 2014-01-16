<%@ include file="header.jsp" %>
<%@ include file = "process/connect1.jsp" %>
<%@ include file = "process/connect2.jsp" %>
<%@ include file = "process/connect3.jsp" %>

<h1>Forum</h1>
<hr />

<%
  ResultSet rs1 = null;
  ResultSet rs2 = null;
  ResultSet rs3 = null;
  String query = "select * from MsForum Order By ForumID ASC";
  String query2 = "";
  String query3 = "";
  int i = 0;
  rs1 = st1.executeQuery(query);
%>
<%
  while(rs1.next()){
    String forumId = rs1.getString(1);
%>
  <div class="container categoryHolder img-rounded">
      <div class="headerCategory"><h3><%= rs1.getString(2) %></h3></div>
      <%
          query2 = "select * from MsSubForum Where ForumID = " + forumId;
          rs2 = st2.executeQuery(query2);
      %>
      <%
        i = 0;
        while(rs2.next()){
        i += 1;
      %>
        <div class="col-md-4 subCategoryHolder">
          <a href="contentthread.jsp?category=<%= rs2.getString(1) %>">
            <span class="glyphicon glyphicon-chevron-right"></span> <%= rs2.getString(3) %>
          </a>
        </div>
      <%
          if(i % 3 == 0){
      %>
            <div class="container">
                &nbsp;
            </div>
      <%
          }
        }
      %>
      <div class="container moderatorHolder">
          <%
            query3 = "select * from TrForumModerator a, MsModerator b where ForumID = " + forumId + "and a.ModeratorID = b.ModeratorID";
            rs3 = st3.executeQuery(query3);
          %>
          <h5>Moderator : <% while(rs3.next()){out.print(rs3.getString(4));} %></h5>
        </div>
  </div>
<%
  }
%>

<%@ include file="footer.jsp" %>