<%@ include file="header.jsp" %>
<%@ include file="process/connect1.jsp"%>
<%
	String threadId = "";
   if(session.getAttribute("user_id") == null){
    response.sendRedirect("signup.jsp");
	return;
	}
	else{
		threadId = request.getParameter("id");
	}
%>
<div style="margin:0 auto;">
	<script src="ckeditor/ckeditor.js"></script>

	<form method="post" action="process/do_createPost.jsp">
		<input type="hidden" name="threadId" value="<%= threadId %>" />
	<br/>
	<%if(request.getParameter("err")==null){%>
	<div>Subject: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit" style="display:inline; width:400px;" name="subject" id="title"></div>
	<%}
	   else if(request.getParameter("err").equals("subject")){
	%>
	<div style="color:red;">Subject: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit" style="display:inline; width:400px; border-color:red;" name="subject" id="title"> * this field must be filled.</div>
	<%}
	else if(request.getParameter("err").equals("post")){%>
	<div>Subject: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit" style="display:inline; width:400px;" name="subject" id="title" value="<%=session.getAttribute("subject")%>"></div>
	<br/>
	<div style="color:red;"> * You should fill your post with something to start the post.</div>
	<%}%>
	<br/>
	<textarea class="ckeditor" cols="80" id="editor8" name="editor8" rows="18">
	</textarea>
	<br/>
	<center><button type="submit" class="cke_1 cke cke_reset cke_chrome cke_ltr cke_browser_webkit">Post</button></center>
	</form>
</div>

<%@ include file="footer.jsp" %>