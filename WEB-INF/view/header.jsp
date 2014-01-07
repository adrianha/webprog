<%@ page contentType="text/html; charset=utf-8" language="java" import="java.io.*" errorPage="" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Nimbrung</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <!-- Style -->
    <link href="dist/css/style.css" rel="stylesheet" media="screen">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div id="body">
      <nav id="navHeader" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Nimbrung</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><a href="#">Forum</a></li>
            <li><a href="#">Jual Beli</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right rightt">
            <li id="dropdown2" class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sign In <b class="caret"></b></a>
              <ul class="dropdown-menu" style="width:250px;">
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
              </ul>
            </li>
            <li><a href="#">Sign Up</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>
      <div id="wrapper" class="container">