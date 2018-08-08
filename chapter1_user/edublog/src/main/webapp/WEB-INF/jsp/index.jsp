<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%><!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>个人博客</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link href="css/bootstrapValidator.min.css" rel="stylesheet">
		<link href="css/main.css" rel="stylesheet">
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	    <script src="js/bootstrapValidator.min.js"></script>
	    <script src="layer/layer.js"></script>
	</head>

	<body>
		<jsp:include page="nav.jsp"></jsp:include>
		
		<div class="container">
			<div class="row">
				<div class="col-lg-9 col-md-9">
					<div class="row hot-article">
						<div class="col-lg-3 col-md-3 col-sm-7 col-xs-3">
							<span>热门文章</span>
						</div>
						<div class="col-lg-4 col-lg-offset-5 col-md-5 col-sm-5 col-xs-9 col-md-offset-4">
							<a href="#" class="hot-item">最新</a>
							<a href="#" class="hot-item">前端</a>
							<a href="#" class="hot-item">后端</a>
							<a href="#" class="hot-item">大数据</a>
						</div>
					</div>

					<div class="row article-item">
						<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
							<h4>
									   <a href="#">Vue.js实现可配置的登录表单Vue.js实现可配置的登录表单</a>
								    </h4>
							<p>
								<button class="btn btn-success btn-xs">前端</button>
								<span>rccoder · 1天前 · 45646次阅读</span>
							</p>
						</div>
						<div class="col-lg-2 col-md-2 hidden-sm hidden-xs	">
							<img src="img/a.jpg" />
						</div>
					</div>
					<div class="row article-item">
						<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
							<h4>
									   <a href="#">Vue.js实现可配置的登录表单Vue.js实现可配置的登录表单</a>
								    </h4>
							<p>
								<button class="btn btn-success btn-xs">前端</button>
								<span>rccoder · 1天前 · 45646次阅读</span>
							</p>
						</div>
						<div class="col-lg-2 col-md-2 hidden-xs	">
							<img src="img/a.jpg" />
						</div>
					</div>

				</div>
				<div class="col-lg-3 col-md-3 hidden-xs hidden-sm">
					<div class="box-login">
						<b style="font-size: 17px; margin-bottom: 20px">Educoder</b>
						<p>一个帮助你提升自我的平台</p>
						<form>
							<div class="form-group">
								<input type="text" class="form-control" id="name" placeholder="昵称">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" id="emile" placeholder="邮箱/手机">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="Password" placeholder="密码">
							</div>
							<button type="submit" class="btn btn-primary btn-block">立即注册</button>
						</form>
					</div>
					<div class="box-tag">
						<p class="tag clearfix">
							<span class="pull-left">热门标签</span>
							<a class="pull-right" href="#">查看全部</a>
						</p>
						<div class="tag-list">
							<button class="btn btn-default">开源</button>
							<button class="btn btn-default">算法</button>
							<button class="btn btn-default">面试</button>
							<button class="btn btn-default">代码规范</button>
							<button class="btn btn-default">产品</button>
							<button class="btn btn-default">人工智能</button>
							<button class="btn btn-default">大数据</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</body>

<script type="text/javascript">


</script>
</html>



