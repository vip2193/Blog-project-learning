<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人博客</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/lib/marked.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/prettify.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/underscore.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/sequence-diagram.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/editmd/editormd.min.js"></script>
</head>


<jsp:include page="nav.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-lg-9 col-md-9" style="background:#ffffff;min-height: 700px">
		<div style="float: left">
			<a href="#">
			<img class ="cicleImg" alt="" style="margin: 16px;" src="${pageContext.request.contextPath}/${userOfBlog.avatar}">
			</a>
		</div>
		<div>
			<div style="margin: 16px">
				<a href="#" style="color:#000000; font-weight:bold; margin-top: 25px"> ${userOfBlog.username} </a> 
			</div>
				<p>
				${blog.createTime}
				</p>
		</div>
		<hr style="clear: left;">
		<img alt="" src="${pageContext.request.contextPath}/${blog.coverImage}">
		<h1 style="margin: 0 auto; text-align: center;"> ${blog.blogTitle} </h1>
		<div id="doc-content" style="padding: 15px">
		    <textarea style="display:none;">${blog.blogContent}</textarea>
		</div>
		</div>
		<div class="col-lg-3 col-md-3 hidden-xs hidden-sm">
			<div class="box-tag" style="margin-bottom: 20px">
					<p class="tag clearfix">
						<span class="pull-left">相关文章</span>
					</p>
			</div>
			<div class="box-tag">
				<p class="tag clearfix">
					<span class="pull-left">热门标签</span> <a class="pull-right" href="#">查看全部</a>
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
<script type="text/javascript">
	var testEditor;
	$(function () {
	    testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
	        htmlDecode: "style,script,iframe",
	        emoji: true,
	        taskList: true,
	        tex: true, // 默认不解析
	        flowChart: true, // 默认不解析
	        sequenceDiagram: true, // 默认不解析
	        codeFold: true,
	});});
</script>
</body>
</html>