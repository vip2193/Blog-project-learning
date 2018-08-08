<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<title>后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default navbar-fixed-top"
					role="navigation">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">后台管理系统</a>
					</div>
				</nav>
				<div class="row clearfix">
					<div class="col-md-12 column">
						<div class="col-md-3" style="float: left; margin-left: -10%">
							<div class="list-group" style="float: left">
								<a target="fname" href="main/index1.html"
									class="list-group-item"><span
									class="glyphicon glyphicon-home">页面一</a> <a target="fname"
									href="main/index2.html" class="list-group-item"><span
									class="glyphicon glyphicon-file">页面二</a> <a target="fname"
									href="main/index3.html" class="list-group-item"><span
									class="glyphicon glyphicon-user">页面三</a> <a target="fname"
									href="main/index4.html" class="list-group-item"><span
									class="glyphicon glyphicon-off">页面四</a>
							</div>
						</div>
						<div class="col-md-8 column" style="width: 75%;">
							<iframe name="fname" frameborder="false"
								style="background-color: red; margin-left: -20%;" width="145%"
								height="540px"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
