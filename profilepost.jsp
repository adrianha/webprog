<%@ include file = "process/connect1.jsp" %>



<%
	String userId = (String)session.getAttribute("user_id");
	String query = "SELECT * FROM MSUser where UserID = "+userId;
	ResultSet rs = st1.executeQuery(query);
%>
<%while(rs.next()){%>
<div id="ProfilePage">
    <div id="LeftCol">
        <div id="Photo">
		<img src="assets/user_images/<%= rs.getString("ProfilePict") %>"/>
		</div>
        <div id="ProfileOptions">
        <%=rs.getString(6)%>
        </div>
    </div>
<div id="Info">
<ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
  <li><a href="#messages" data-toggle="tab">Messages</a></li>
  <li><a href="#postlist" data-toggle="tab">Post List</a></li>
  <li><a href="#threadlist" data-toggle="tab">Thread List</a></li>
</ul>

<div class="tab-content">
  <div class="tab-pane active" id="profile">
        <p>
            <strong>Full Name</strong>
            <span><%=rs.getString(5)%></span>
        </p>
        <p>
            <strong>Birth Date</strong>
            <span><%=rs.getString(7)%></span>
        </p>
        <p>
            <strong>Birth Place</strong>
            <span><%=rs.getString(8)%></span>
        </p>
        <p>
            <strong>Email</strong>
            <span><%=rs.getString(4)%></span>
        </p>
	</div>
  <div class="tab-pane" id="messages">
  pesan
  </div>
  <div class="tab-pane" id="postlist">
  post
  </div>
    <div class="tab-pane" id="threadlist">
	thread
  </div>
</div>
</div>

    <!-- Needed because other elements inside ProfilePage have floats -->
    <div style="clear:both"></div>
</div>
<%}%>