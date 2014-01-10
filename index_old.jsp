<%@ page contentType="text/html; charset=utf-8" language="java" import="java.io.*" errorPage="" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Nimbrung</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="dist/js/jquery-2.0.3.min.js"></script>
      
    <!-- Bootstrap -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="dist/js/bootstrap.min.js"></script>
    
    <!-- Font Awesome -->
    <link href="dist/css/font-awesome.min.css" rel="stylesheet">
      
    <!-- Style -->
    <link href="dist/css/style.css" rel="stylesheet" media="screen">
      
    <!-- include summernote css/js-->
    <link href="dist/css/summernote.css" rel="stylesheet">
    <script type="text/javascript" src="dist/js/summernote.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div id="body">
        <header class="navbar navbar-inverse navbar-fixed-top" id="navHeader">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                        <a href="index.jsp" class="navbar-brand"><span><span class="glyphicon glyphicon-home"></span>&nbsp;Nimbrung</span></a>
                </div>
                <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
                  <ul class="nav navbar-nav">
                    <li><a href="index.jsp?p=forum">Forum</a></li>
                    <li><a href="#">Jual Beli</a></li>
                    <li><a href="#">Forum Rules</a></li>
                    <li><a href="#">FAQ</a></li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                    <li id="dropdown2" class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sign In <b class="caret"></b></a>
                      <ul class="dropdown-menu" style="width:250px;">
                        <div class="container">
                            <form class="navbar-form" method="post">
                              <div class="form-group">
                                <input type="text" name="txtUser" id="txtUser" class="form-control" placeholder="Username">
                              </div>
                              <div class="form-group">
                                <input type="password" name="txtPass" id="txtPass" class="form-control" placeholder="Password">
                              </div>
                              <div class="container">
                                &nbsp;
                              </div>
                              <button type="submit" class="btn btn-info">Sign In</button>
                            </form>
                        </div> 
                      </ul>
                    </li>
                    <li><a href="index.jsp?p=signup">Sign Up</a></li>
                  </ul>
                </nav>
            </div>
        </header>
      <!--<nav id="navHeader" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
    -->
          <!--<a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Nimbrung</a>-->
        <!--
            <a class="navbar-brand" href="index.jsp"><img src="assets/images/logo_2.png" width="50px" height="50px" />&nbsp;Nimbrung</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><a href="index.jsp?p=forum">Forum</a></li>
            <li><a href="#">Jual Beli</a></li>
            <li><a href="#">Forum Rules</a></li>
            <li><a href="#">FAQ</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right rightt">
            <li id="dropdown2" class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sign In <b class="caret"></b></a>
              <ul class="dropdown-menu" style="width:250px;">
                <div class="container">
                    <form class="navbar-form" method="post">
                      <div class="form-group">
                        <input type="text" name="txtUser" id="txtUser" class="form-control" placeholder="Username">
                      </div>
                      <div class="form-group">
                        <input type="password" name="txtPass" id="txtPass" class="form-control" placeholder="Password">
                      </div>
                      <div class="container">
                        &nbsp;
                      </div>
                      <button type="submit" class="btn btn-info">Sign In</button>
                    </form>
                </div> 
              </ul>
            </li>
            <li><a href="index.jsp?p=signup">Sign Up</a></li>
          </ul>
        </div>--><!-- /.navbar-collapse -->
      </nav>
      <div id="wrapper" class="container">
        <%
          String pg=request.getParameter("p");
              if( pg!= null && ! "".equals(pg)){
                      String webPath = pg + ".jsp";
                      String realPath = request.getRealPath(webPath);
                      File f=new File(realPath);
                      if(webPath.equals("index.jsp")){
        %>
        				<jsp:include page="contentindex.jsp" />
        <%              	
                      }
                      else if(f.exists()){
        %>
          				<jsp:include page="<%= webPath %>" flush="true" />              
        <%
                      }else{
        %>
                      	<jsp:include page="error.jsp" />
		<%                      
                      }
              }
	          else {
	    %>
	    		<jsp:include page="contentindex.jsp" />
	    <%	
	      	  }
        %>
      </div>
      <div id="footer" class="container">
        Copyright &copy; 2013 By Nimbrung
      </div>
    </div>
    <script>
        $(document).ready(function() {
          $('#summernote').summernote();
        });
    </script>
  </body>
</html>