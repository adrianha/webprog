<%@ page contentType="text/html; charset=utf-8" language="java" import="java.io.*" errorPage="" %>
<%
          String cg=request.getParameter("category");
              if( cg!= null && ! "".equals(cg)){
                      String webPath2 = "contentthread.jsp";
                      String realPath2 = request.getRealPath(webPath2);
                      File f2=new File(realPath2);
                      if(webPath2.equals("forum.jsp")){
        %>
        				<jsp:include page="contentforum.jsp" />
        <%              	
                      }
                      else if(f2.exists()){
        %>
          				<jsp:include page="<%= webPath2 %>" />              
        <%
                      }else{
        %>
                      	<jsp:include page="error.jsp" />
		<%                      
                      }
              }
	          else {
	    %>
	    		<jsp:include page="contentforum.jsp" />
	    <%	
	      	  }
        %>