<%@ include file="header.jsp" %>
	<div class="container centerr">
		<center>
			<img class="img-responsive" src="assets/images/logo_2.png" width="300px" height="300px" />
		</center>
		<p style="font-size:24pt;" class="lead">
			<strong>Welcome to Nimbrung</strong>
		</p>
	</div>
	<hr />
	<div id="search">
		<form method="get" action="search.jsp">
			<div class="form-group">
                <input type="text" name="txtSearch" id="txtSearch" class="form-control"placeholder="What do you want?">
            </div>
            <div>
	            <button type="submit" class="btn btn-info">Search</button>
            </div>
		</form>
	</div>
	<!-- <div class="container search">
		<form role="form" method="get" action="search.jsp">
			<div class="form-group">
				<div class="row">
				<input type="text" name="txtSearch" id="txtSearch" class="form-control" placeholder="Search here..." />
				<br />
				<input type="submit" class="btn btn-info" value="Search" />
				</div>
			</div>
		</form>
	</div> -->
	<div class="space">&nbsp;</div>
	<div class="container centerr">
		<div class="col-md-5 col-md-push-1 hotIndexHolder" style="margin-right:25px;">
			<h2>Top Threads</h2>
			<br />
			<ul class="leftt hotIndex" style="list-style:none;">
				<li><a href="#"><span class="glyphicon glyphicon-eye-open"></span> Thread 1</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-eye-open"></span> Thread 2</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-eye-open"></span> Thread 3</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-eye-open"></span> Thread 4</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-eye-open"></span> Thread 5</a></li>
			</ul>
		</div>
		<div class="col-md-5 col-md-push-1 hotIndexHolder">
			<h2>Top Sales</h2>
			<br />
			<ul class="leftt hotIndex" style="list-style:none;">
				<li><a href="#"><span class="glyphicon glyphicon-usd"></span> FJB 1</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-usd"></span> FJB 2</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-usd"></span> FJB 3</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-usd"></span> FJB 4</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-usd"></span> FJB 5</a></li>
			</ul>
		</div>
	</div>
<%@ include file="footer.jsp" %>