<%@ include file="header.jsp" %>
<%@ include file="process/connect1.jsp"%>
	<script src="ckeditor/ckeditor.js"></script>
	<style  type="text/css">
		
	</style>
<%
  String query="select NickName,ProfilePict,PostId,ThreadID,PostDate,Post from MsUser right join MsPost on MsUser.Userid=MsPost.UserID where ThreadID="+request.getParameter("thr");
  ResultSet rs = st1.executeQuery(query);
%>
<textarea style="padding-top:100px;" class="ckeditor" cols="80" id="editor8" name="editor8" rows="18">

</textarea>
<%@ include file="footer.jsp" %>