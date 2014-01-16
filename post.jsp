<%@ include file="header.jsp" %>
<%@ include file="process/connect1.jsp"%>
	<script src="ckeditor/ckeditor.js"></script>
	<style  type="text/css">
		
	</style>
<%
  int threadid = Integer.parseInt(request.getParameter("thr"));
  st1.executeUpdate("update MsThread set ViewCount = ViewCount + 1 where threadid="+threadid);
  String query="select NickName,ProfilePict,PostId,ThreadID,PostDate,Post from MsUser right join MsPost on MsUser.Userid=MsPost.UserID where ThreadID="+threadid;
  ResultSet rs = st2.executeQuery(query);
  out.print(query);
%>
<form method="post" action="process/do_posting.jsp">
<textarea style="padding-top:100px;" class="ckeditor" cols="80" id="editor8" name="editor8" rows="18">
</textarea>

<center><button type="submit">Post</button></center>
</form>

<%@ include file="footer.jsp" %>