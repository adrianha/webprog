<%@ include file="header.jsp" %>
<%@ include file="process/connect1.jsp"%>
<%
   if(session.getAttribute("user_id") == null){
    response.sendRedirect("signup.jsp");
	return;
}%>
<script src="ckeditor/ckeditor.js"></script>

<form method="post" action="process/do_createThread.jsp">
<div>Forum: &nbsp;<select name="forum" id="forum" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit" style="display:inline;width:150px">
<%
ResultSet rs = st1.executeQuery("select subForumID,subForumName from MsSubForum");
while(rs.next())
{
%>
<option value="<%=rs.getString("subForumID")%>"><%=rs.getString("subForumName")%></option>
<%}%>
</select>
</div>
<br/>
<%if(request.getParameter("err")==null){%>
<div>Title: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit" style="display:inline; width:400px;" name="title" id="title"></div>
<%}
   else if(request.getParameter("err").equals("title")){
%>
<div style="color:red;">Title: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit" style="display:inline; width:400px; border-color:red;" name="title" id="title"> * this field must be filled.</div>
<%}
else if(request.getParameter("err").equals("post")){%>
<div>Title: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit" style="display:inline; width:400px;" name="title" id="title" value="<%=session.getAttribute("title")%>"></div>
<br/>
<div style="color:red;"> * You should fill your post with something to start the thread.</div>
<%}%>
<br/>
<textarea class="ckeditor" cols="80" id="editor8" name="editor8" rows="18">
</textarea>
<br/>
<center><button type="submit" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit">Post</button></center>
</form>

<%@ include file="footer.jsp" %>