<%@ include file="header.jsp" %>
	<script src="ckeditor/ckeditor.js"></script>
	<link rel="stylesheet" href="ckeditor.css">
	<style  type="text/css">
		#cke_editor8{
		margin-top:100px;
		}
	</style>
<%
  String query="select NickName,ProfilePict,PostId,ThreadID,PostDate,Post from MsUser right join MsPost on MsUser.Userid=MsPost.UserID where ThreadID="+request.getParameter("thr");
%>
<textarea style="padding-top:100px;" class="ckeditor" cols="80" id="editor8" name="editor8" rows="18">

</textarea>
<%@ include file="footer.jsp" %>