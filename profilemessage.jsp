<%@ include file="process/connect1.jsp"%>
<%@ include file="process/connect2.jsp"%>
	<script src="ckeditor/ckeditor.js">
	</script>
<style  type="text/css">
form
{
	width: 100%;
	height: 700px;
	border: 1px solid orange;
}	
</style>
<%
  //int threadid = Integer.parseInt(request.getParameter("thr"));
  //st1.executeUpdate("update MsThread set ViewCount = ViewCount + 1 where threadid="+threadid);
  //String query="select NickName,ProfilePict,PostId,ThreadID,PostDate,Post from MsUser right join MsPost on MsUser.Userid=MsPost.UserID where ThreadID="+threadid;
  //ResultSet rs = st2.executeQuery(query);
  //out.print(query);
%>
<form method="post" action="process/do_posting.jsp">
<textarea class="ckeditor" cols="40" id="editor8" name="editor8" rows="18">
</textarea>

<center><button type="submit">Post</button></center>
</form>
