<%@ include file="header.jsp" %>
<%@ include file = "process/connect1.jsp" %>
<%@ include file = "process/connect2.jsp" %>
<%@ include file = "process/connect3.jsp" %>
<h2>
<% String cg=request.getParameter("category");
   out.print(cg);%>
   </h2>
   <h4>
   <table style="background-image:url(../../assets/images/bg.png);-moz-border-radius: 15px;
border-radius: 15px;"><tr><th style="text-align:center" width="750px">Thread</th><th width="350px">Last Post</th></tr></table></h4>
<table class="table-hover" style="color:#000000;">

<tr>
    <td width="220px">Created by:</td>
    <td rowspan="2" width="492px">Thread Name1</td>
    <td width="220px">Last Post by:</td><td width="130px">Views: 3240</td></tr>
<tr>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;user1</td>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;Tommy</td>
     <td width="130px">Replies: 386</td>
</tr>

<tr>
    <td width="220px">Created by:</td>
    <td rowspan="2" width="492px">Thread Name2</td>
    <td width="220px">Last Post by:</td><td width="130px">Views: 2643</td></tr>
<tr>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;user2</td>
     <td>&nbsp;&nbsp;&nbsp;&nbsp;Gerard</td>
     <td width="130px">Replies: 374</td>
</tr>

</table>
<%@ include file="footer.jsp" %>