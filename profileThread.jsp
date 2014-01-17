<%@ include file = "process/connect1.jsp" %>
<style>
.post{
	background-color: #7309AA;
	border: none;
	font-size: 14pt;
}
.btn-info {
  background-image: -webkit-gradient(linear, left 0%, left 100%, from(#5bc0de), to(#31b0d5));
  background-image: -webkit-linear-gradient(top, #5bc0de, 0%, #31b0d5, 100%);
  background-image: -moz-linear-gradient(top, #5bc0de 0%, #31b0d5 100%);
  background-image: linear-gradient(to bottom, #5bc0de 0%, #31b0d5 100%);
  background-repeat: repeat-x;
  border-color: #2aabd2;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff31b0d5', GradientType=0);
}
</style>


<%
	String userId = (String)session.getAttribute("user_id");
	String query = "SELECT * FROM MsPost where UserID = "+userId;
	ResultSet rs = st1.executeQuery(query);
	
%>
<div class="row" id="ProfilePostPage">
<%while(rs.next()){%>
<div class="btn-info">
<label align="left"><u><%=rs.getString(3)%></u></label>
</br>
<p><%=rs.getString(4)%></p>
<label align="right"><%=rs.getString(6)%></label>
</div>
<%}%>
</div>