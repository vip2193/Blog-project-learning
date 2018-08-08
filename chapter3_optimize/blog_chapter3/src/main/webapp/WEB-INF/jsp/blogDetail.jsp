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
<link
	href="${pageContext.request.contextPath}/editmd/css/editormd.min.css"
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
<script
	src="${pageContext.request.contextPath}/lib/sequence-diagram.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/flowchart.min.js"></script>
<script
	src="${pageContext.request.contextPath}/lib/jquery.flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/editmd/editormd.min.js"></script>
<style type="text/css">
		body {
			background: #ffffff;
		}
		
		.avatar {
		    margin-right: 5px;
		    width: 38px;
		    height: 38px;
		    vertical-align: middle;
		    display: inline-block;
		    cursor: pointer;
		    float: left;
		}
		.avatar img {
		    width: 100%;
		    height: 100%;
		    border: 1px solid #ddd;
		    border-radius: 50%;
		    padding: 5px;
		}
		.sign-container{
			float:left;
			padding: 10px 15px;
		    width: 92%;  
		    height: 80px;  
		    font-size: 13px;
		    border: 1px solid #dcdcdc;
		    border-radius: 4px;
		    background-color: hsla(0,0%,71%,.1);
		    resize: none;
		    display: inline-block;
		    vertical-align: top;
		    outline-style: none;  
		    margin-bottom: 10px;
		}
		
		.new-comment{
			width: 100%;
			margin-top: 25px;
		}
		.new-comment textarea{
		    padding: 10px 15px;
		    width: 100%;
		    height: 80px;
		    font-size: 13px;
		    border: 1px solid #dcdcdc;
		    border-radius: 4px;
		    background-color: hsla(0,0%,71%,.1);
		    resize: none;
		    display: inline-block;
		    vertical-align: top;
		    outline-style: none;
		}
</style>

</head>
<jsp:include page="nav.jsp"></jsp:include>

<hr>

<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-8 col-md-offset-2 col-lg-offset-2"
			style="background: #ffffff; min-height: 700px">
			<div style="float: left">
				<a href="#"> <img class="cicleImg" alt="" style="margin: 16px;"
					src="${pageContext.request.contextPath}/${userOfBlog.avatar}">
				</a>
			</div>
			<div style="padding: 8px">
				<div style="margin: 8px">
					<a href="#"
						style="color: #000000; font-weight: bold; margin-top: 25px">
						${userOfBlog.username} </a>
				</div>
				<p>${blog.createTime}</p>
			</div>
			<hr style="clear: left;">
			<!-- 判断是否显示封面 -->
			<c:if test="${!empty blog.coverImage}">
				<div style="margin-top: 16px; margin-bottom: 16px">
					<img alt="" style="width: 100%; height: auto"
						src="${blog.coverImage}">
				</div>
			</c:if>
			<h1 style="margin: 0 auto; padding: 10px; font-weight: bold;">
				${blog.blogTitle}</h1>
			<div id="doc-content" style="padding: 15px">
				<textarea style="display: none;">${blog.blogContent}</textarea>
			</div>
			<hr>
			<!-- 用戶评论 -->
			<!-- 首先判断用户是否登录 -->
			<c:choose>
				<c:when test="${userInfo == null}">
					<div class="new-comment" style="height: 80px">
							<a class="avatar" > <img
								src="${pageContext.request.contextPath}/img/user.png"></a>
							<div class="sign-container" > 
									<!-- 这里会让响应式布局失效 -->
									<!-- 需要修改 -->
									<div style="position:relative; left: 35%;top: 20%">
									<a href="#" type="button" data-toggle="modal"    
									data-target="#loginDialog" class="btn btn-primary">登录</a> 
									<span>后发表评论</span>
									</div> 
							</div>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<form class="new-comment">
							<a class="avatar"><img src="${userInfo.avatar}"></a>
							<textarea placeholder="写下你的评论..."></textarea>
							<!---->
						</form>
						<!---->
					</div>
				</c:otherwise>
			</c:choose> 
			  
			
			 <div style="margin-top: 30px; clear: both;">
			 
				<h4 style="font-weight: bold;margin-left: 12px; float: clear">评论</h4>  
				<hr> 
				<div  style="width: 226px;height: 92px;margin: 30px auto 20px;
			    background: url(${pageContext.request.contextPath}/img/icon_comment.png) no-repeat;
			    background-size: contain;">
				</div>	
				<div 
				style="margin-bottom: 50px;text-align: center;font-size: 12px;color: #969696;">
					<a href="javascript:void()">发表一点想法</a>吧。    
    			</div>
			 </div>
			<hr> 
			
			
			
		</div>
	</div>
</div>

<script type="text/javascript">
	//渲染MD
	var testEditor;
	$(function() {
		testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
			htmlDecode : "style,script,iframe",
			emoji : true,
			taskList : true,
			tex : true, // 默认不解析
			flowChart : true, // 默认不解析
			sequenceDiagram : true, // 默认不解析
			codeFold : true,
		});
	});
</script>
</body>
</html>