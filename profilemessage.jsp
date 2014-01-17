<%@ include file="process/connect1.jsp"%>
<%@ include file="process/connect2.jsp"%>
<style>
.message{
	background-color: #7309BB;
	border: none;
	font-size: 14pt;
}
form
{
	width: 100%;
	height: 800px;
	overflow-y: scroll;
	border: 1px solid purple;
}
textarea
{
	width: 100%;
	height: 200px;
}
</style>
<%
   if(session.getAttribute("user_id") == null){
    response.sendRedirect("signup.jsp");
	return;
	}
	String UserIDTo = request.getParameter("UserIDTo");
%>
<script src="ckeditor/ckeditor.js"></script>

<form method="post" action="process/do_createMessage.jsp">
<input type="Hidden" value="<%=UserIDTo%>" name="UserIDTo">
<textarea class="ckeditor" cols="80" id="editor8" name="editor8" rows="18">
</textarea>
<br/>
<center>
<button type="submit" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit">Post</button>
</center>
<%if(request.getParameter("err")!=null){
if(request.getParameter("err").equals("post")){%>
<div style="color:red;"> * You should fill your post with something to start the thread.</div>
<%}
}%>
<%
	String userId = (String)session.getAttribute("user_id");
	String query = "SELECT MsMessage.Message,MsUser.NickName FROM MsMessage left join MsUSer on MsUser.UserId = val(MsMessage.UserIdFrom) where MsMessage.UserID = '"+UserIDTo+"'";
	ResultSet rs = st1.executeQuery(query);
	
%>
</br>
<div class="row" id="ProfileMessagePage">
<%while(rs.next()){%>
<div class="message">
</br>
<p><%=rs.getString(1)%></p>
<label align="right">from user : <%=rs.getString(2)%></label>
</div>
<%}%>
</div>
</form>
