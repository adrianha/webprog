<%@ include file="process/connect1.jsp"%>
<%@ include file="process/connect2.jsp"%>
<style>
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
	String query = "SELECT * FROM MsMessage where UserID = "+UserIDTo;
	ResultSet rs = st1.executeQuery(query);
	
%>
<div class="row" id="ProfileMessagePage">
<%while(rs.next()){%>
<div class="btn-info">
<p><%=rs.getString(2)%></p>
<label align="right"><%=rs.getString(4)%></label>
</div>
<%}%>
</div>
</form>
