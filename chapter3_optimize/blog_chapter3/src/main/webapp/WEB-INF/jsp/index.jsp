<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" >
		<title>Educoder博客系统</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<link href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
		
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	    <script src="js/bootstrapValidator.min.js"></script>
	    <script src="layer/layer.js"></script>
	    <style type="text/css">
		    
	    	.aTitle{
	    		 font-size:20px;
	    		color:black;
	    		font-weight: bold; 
	    	}
	    	.typeBtn{
				display: inline-block;
			    margin-right: 1.2rem;
			    padding: .38rem 0;
			    min-width: 4.5rem;
			    text-align: center;
			    line-height: 1;
			    color: #fff;
			    border-radius: 2px;
	    	}
	    	.web{
	    	    background-color: #56c4e1;;
	    	}
	    	.backend{
    		    background-color: #e8596b;
	    	}
	    	.bigData{
	    	    background-color: #ff955b;
	    	}
	    	#main{
	    		min-height: 640px;
	    	}
	    
	    	
    	/* 进度条 */
	    @-webkit-keyframes rotate {0% {-webkit-transform: rotate(0deg);transform: rotate(0deg);}100% {-webkit-transform: rotate(360deg);transform: rotate(360deg);}}
		@keyframes rotate {0% {-webkit-transform: rotate(0deg);transform: rotate(0deg);}100% {-webkit-transform: rotate(360deg);transform: rotate(360deg);}}
		
		.loadmore {display:block;line-height: 50px;text-align:center;color:#ccc;font-size:14px;}
		.loadmore span{height:20px;width:20px;border-radius:100%;display:inline-block;margin:10px;border:2px solid #f60;border-bottom-color: transparent;vertical-align: middle;-webkit-animation: rotate 1.1s infinite linear;animation: rotate 1.1s infinite linear;}
		.loadover{position:relative;margin:0 12px;padding:24px 0;height:20px;line-height:20px;color:#909090;text-align: center;}
		.loadover span{position:relative;display:inline-block;padding:0 6px;height:20px;background:#F2F2F2;z-index:2}
		.loadover:after {content:''position: absolute;left: 0;top:50%;width: 100%;height:1px;background:#DCDCDC;z-index:1;display:block;}
	    	
	    </style>
	</head>

	<body >
	
		<jsp:include page="nav.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-9 col-sm-12 col-xs-12"  >
					<div class="row hot-article">
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
							<span>热门文章</span>
						</div>
						<div class="col-lg-4 col-lg-offset-5 col-md-5 col-sm-9 col-xs-9 col-md-offset-4">
							<a href="javascript:classify(null)" class="hot-item">最新</a>
							<a href="javascript:classify(1)" class="hot-item">前端</a>
							<a href="javascript:classify(2)" class="hot-item">后端</a>
							<a href="javascript:classify(3)" class="hot-item">大数据</a>
						</div>
					</div>
					<div id = "main" >
					</div>
				</div>
				<div class="col-lg-3 col-md-3 hidden-xs hidden-sm">
					<c:if test="${userInfo == null}">
						<div class="box-login">
							<b style="font-size: 17px; margin-bottom: 20px">Educoder</b>
							<p>一个帮助你提升自我的网站</p>
							<form method="post" class ="registerForm" action = "${pageContext.request.contextPath}/user/register.do">
								<div class="form-group">
									<input type="text" class="form-control" name = "username" id="username" placeholder="昵称">
								</div>
								<div class="form-group">
									<input type="number" name="phone" class="form-control" id="phone" placeholder="手机">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="Password" placeholder="密码">
								</div>
								<button type="submit" class="btn btn-primary btn-block">立即注册</button>
							</form>
						</div>
					</c:if>
					<div class="box-tag">
						<p class="tag clearfix">
							<span class="pull-left">热门标签</span>
						</p>
						<div class="tag-list">
							<button class="btn btn-default" >开源</button>
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
	var page = 1;		//当前页
	var finished = 0;//是否加载完毕 
	var sover=0;	//是否还能加载
	$(function(){
		
		//初次加载数据
		loadInfo(page);
		//页面滚动执行事件
		$(window).scroll(function (){	
			var dHeight = parseInt($(document).height());
			var scrollHeight = parseInt($(document).scrollTop()) + parseInt($(window).height());
			//浏览器文本显示的高度 + 滚动条距离顶部的高度  如果等于页面的文档高度 就说明 滚动条滑到底部了
			if((scrollHeight + 10) >= dHeight && sover==0 && finished==0 ){
				//防止重复加载数据
				finished = 1;
				loadInfo(page);
			} 
		});
	});
	

	//加载完毕
	function loadover(){
		var overtext="我也是一个有底线的网站 ! ";
		$(".loadmore").remove();
		if($(".loadover").length>0)
		{
			$(".loadover span").eq(0).html(overtext);
		}
		else
		{
			var txt='<div class="loadover"><span>'+overtext+'</span></div>  <hr> ';
			$("#main").append(txt);
		}
	}
	
	function loadInfo(pageNum){
		
		//进度条
	 	if($(".loadmore").length==0)
		{
			var txt='<div class="loadmore "><span class="loading"></span>加载中..</div>'
			$("#main").append(txt);
		} 
		
		//异步加载博客数据
		var url = '${pageContext.request.contextPath}/blog/pageQuery.do';
		var parm = '';
		
		if(typeId != null){
			var parm = {"pageNum":pageNum,"typeId":typeId};
		}else{
			var parm = {"pageNum":pageNum};
		}
		
		
		
		$.post(url,parm,function(data){
			console.log(data);
			//给div添加数据
			var arr = data.list;
			var result = '';
			for(var i in arr){
				//console.log(arr[i]);
				var classType = "web";
				switch(arr[i].typeId){
					case 1:
						classType = "web";
						break;
					case 2:
						classType = "backend";
						break;
					case 3:
						classType = "bigData";
						break;
				}
				
				//判断是否有封面图片
				var img = ''
				if(arr[i].coverImage == null || arr[i].coverImage == ''){
					var img = '';
				}else{
					var img = '<img src="'+ arr[i].coverImage + '" />'
				}
				
				result += '<div class="row article-item">' +
				'<div class="col-lg-10 col-md-10">'+
				'<div style="margin: 10px;">'+
				'<a target=“_blank” class = "aTitle" href="${pageContext.request.contextPath}/blog/findBlogById.do?id='+ arr[i].blogId +'">'+ arr[i].blogTitle +'</a>'+
				'</div>'+
				'<div style="margin: 10px">' +
				'	<span class = "typeBtn '+ classType +' ">' + arr[i].typeName + '</span>' +
				'<span>'+arr[i].username +' · 1天前 · 45646次阅读</span>' +
				'</div>' + 
			'</div>'+
			'<div class="col-lg-2 col-md-2 hidden-sm hidden-xs">' +
			img +  '</div> </div>';
			}
			//添加数据	
			//关闭进度条
			$(".loadmore").remove();
			$("#main").append(result); 
			page +=1;
			finished=0;
			//最后一页
			console.log("数据长度" + data.list.length);
			if(data.nextPage==0)
			{
				sover=1;
				loadover();
			}
		});
	}
	
	
	var typeId = null;
	function classify(id){
		typeId = id;
		page = 1;
		sover=0;
		//移除原有的数据
		$("#main").empty();
		loadInfo(page);
		
	}
 
</script>
</html>



