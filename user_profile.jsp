<%@ include file="header.jsp" %>
<%@ include file = "process/connect1.jsp" %>

<style type="text/css">
#ProfilePage
{
    /* Move it off the top of the page, then centre it horizontally */
    margin: 50px auto;
    width: 635px;

/* For visibility. Delete me */
border: 1px solid red;
}

#LeftCol
{
    /* Move it to the left */
    float: left;

    width: 200px;
    text-align: center;

    /* Move it away from the content */
    margin-right: 20px;

/* For visibility. Delete me */
border: 1px solid brown;
}

#Photo
{
    /* Width and height of photo container */
    width: 200px;
    height: 200px;

/* For visibility. Delete me */
border: 1px solid green;
}

#PhotoOptions
{
    text-align: center;
    width: 200px;

/* For visibility. Delete me */
border: 1px solid brown;
}

#Info
{
    width: 400px;
    text-align: center;

    /* Move it to the right */
    float: right;

/* For visibility. Delete me */
border: 1px solid blue;
}

#Info strong
{
    /* Give it a width */
    display: inline-block;
    width: 100px;

/* For visibility. Delete me */
border: 1px solid orange;
}

#Info span
{
    /* Give it a width */
    display: inline-block;
    width: 250px;

/* For visibility. Delete me */
border: 1px solid purple;
}
img{
      width:196px;
      height:198px;
    }
</style>

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
<script>
  $(function () {
    $('#myTab a:last').tab('show')
  })
</script>
<%@ include file="footer.jsp" %>