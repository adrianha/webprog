<%@ include file="header.jsp" %>
<%@ include file="process/connect1.jsp" %>
<%@ include file="process/connect2.jsp" %>
<%! int i = 0; %>
<%
	String thr = request.getParameter("thr");
	String query = "select * from MsThread Where ThreadID = " + thr;
	String query2 = "";
	ResultSet rs = st1.executeQuery(query);
	ResultSet rs2 = null;
	String username = "";
	if(session.getAttribute("user_name") != null){
		username = (String)session.getAttribute("user_name");
	}
	try{
		if(rs.next() == false){
			response.sendRedirect("forum.jsp");
		}
		else {
			query2 = "select * from MsPost a, MsUser b Where ThreadId = " + thr + "and a.UserID = b.UserID";
			rs2 = st2.executeQuery(query2);
		}
	}
	catch(Exception e){
		response.sendRedirect("index.jsp");
	}
%>

<div class="textLarge">
	Thread Name : <%= rs.getString(3) %>
</div>
<div class="space">&nbsp;</div>
<div class="textMedium rightt" style="margin-bottom:20px;width:1100px;">
	<%
		if(username != null){
	%>
		<a style="color:inherit;" href="createPost.jsp?id=<%= rs.getString(1) %>"><span class="glyphicon glyphicon-plus"></span> Reply to Thread</a>
	<%
		}
	%>
</div>

<%
	i = 0;
	while(rs2.next()){
		i++;
		String userPosted = rs2.getString("NickName");
		String postId = rs2.getString("PostID");
%>
	<div class="postHolder">
		<div class="leftSidePost textSmall" style="font-weight:bolder;">
			<table>
				<tr>
					<th>#<%= i %></th>
					<th>&nbsp;</th>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<th>Name</th>
					<th> : </th>
					<td><%= userPosted %></td>
				</tr>
			</table>
		</div>
		<div class="rightSidePost">
			<%
				if(username.equals(userPosted)){
			%>
			<div style="width:100%;" class="rightt">
				<a style="color:inherit;" href="process/do_deletePost.jsp?id=<%= postId %>&thr=<%= thr %>"><span class="glyphicon glyphicon-remove"></span> Delete </a>
			</div>
			<%
				}
			%>
			<p>Subject : <%= rs2.getString("Subject") %></p>
			<p>Content : <%= rs2.getString("Post") %></p>
		</div>
	</div>
<%
	}
%>


<%@ include file="footer.jsp" %>