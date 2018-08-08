<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="bg">
	<div class="container">
		<div class="row header">
			<div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
				<a href="#"> <img src="${pageContext.request.contextPath}/img/logo black@3x.png" alt="logo"
					style="width: 110px; margin-bottom: 5px">
				</a>
			</div>
			<div class="col-lg-4 col-md-4 hidden-sm hidden-xs">
				<a href="${pageContext.request.contextPath}/index.do" class="nav-item">首页</a> 
				<a href="${pageContext.request.contextPath}/codeRepository.do" class="nav-item">代码库</a>
				<a href="${pageContext.request.contextPath}/question.do" class="nav-item">问答</a> 
				<a href="${pageContext.request.contextPath}/resource.do" class="nav-item">资源</a>
			</div>

			<div class="visible-sm visible-xs col-sm-5 col-xs-4">
				<div class="dropdown">
					<a href="${pageContext.request.contextPath}/index.do" class="nav-item" id="dropdownMenu1"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">首页</a>
					<span class="caret"></span>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<li><a href="${pageContext.request.contextPath}/codeRepository.do" class="nav-item">代码库</a></li>
						<li><a href="${pageContext.request.contextPath}/question.do" class="nav-item">问答</a></li>
						<li><a href="${pageContext.request.contextPath}/resource.do" class="nav-item">资源</a></li>
					</ul>
				</div>
			</div>

			<div class="col-lg-2 col-md-3 col-lg-offset-1 hidden-sm hidden-xs">
				<form class="search">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" id="search"
							aria-describedby="searchStatus" placeholder="搜索"> <span
							class="glyphicon glyphicon-search form-control-feedback"
							aria-hidden="true"></span>
					</div>
				</form>
			</div>
			<div
				class="col-lg-2 col-md-3 col-sm-4 col-xs-4 col-lg-offset-1 col-md-offset-1">
				<!-- 使用表达式判断用户是否登录 -->
				<c:choose>
					<c:when test="${userInfo == null}">
						<a href="#" type="button" class="" style="font-size: 14px"
							data-toggle="modal" data-target="#loginDialog">登录</a>
						<a href="#" type="button" class="nav-item" style="font-size: 14px"
							data-toggle="modal" data-target="#registerDialog">注册</a>
					</c:when>
					<c:otherwise>
						<span class="hidden-sm hidden-xs" ><a href="${pageContext.request.contextPath}/blog/writeBlogPage.do">写文章</a></li></span>
						&nbsp; &nbsp;
						<div class="btn-group">
						<a href="#" type="button" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img style="" class = "cicleImg"  alt="" src="${pageContext.request.contextPath}/${userInfo.avatar}">
						</a>
							<ul class="dropdown-menu">
						        <li><a href="${pageContext.request.contextPath}/blog/writeBlogPage.do">写文章</a></li>
						        <li><a href="${pageContext.request.contextPath}/index.do">我的首页</a></li>
						        <li><a href="${pageContext.request.contextPath}/user/favorite.do">我喜欢的</a></li>
						        <li role="separator" class="divider"></li>
						        <li><a href="${pageContext.request.contextPath}/user/logout.do">退出登录</a></li>
					    	</ul>
						</div>
						
					</c:otherwise>
				</c:choose>
	
			</div>
		</div>
	</div>
</div>
<!-- Small modal -->



<!-- 登录弹出框 	-->
<div class="modal fade" id="loginDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title center-block" id="myModalLabel">登录</h4>
			</div>
			<div class="modal-body">
				<form id="loginForm" class="form-horizontal" action="${pageContext.request.contextPath}/user/login.do"
					method="post">
					<div class="form-group ">
						<div class="col-sm-12">
							<input name="username" type="text" class="form-control"
								placeholder="用户名/手机号">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input name="password" type="password" class="form-control "
								placeholder="密码">
						</div>
					</div>
					<div class="form-footer" style="margin-top: 20px">
						<button type="submit" class="btn btn-primary btn-block ">登录</button>
					</div>
				</form>
				<div style="margin-top: 20px">
					没有账号？ &nbsp &nbsp <a href="#" id="registerBtn" type="button"
						class="nav-item" style="font-size: 14px" data-toggle="modal"
						data-target="#registerDialog">注册</a> <a href="#" type="button"
						id="forgetBtn" class="nav-item"
						style="font-size: 14px; float: right; margin-right: 20px">忘记密码</a>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 注册弹出框 -->
<div class="modal fade"  id="registerDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">注册</h4>
			</div>
			<div class="modal-body">
				<form id="registerForm" class = "registerForm" action="user/register.do"
					class="form-horizontal  form-vertical" method="post">
					<div class="form-group">
						<div class="col-sm-12">
							<input name="username" type="text" placeholder="用户名"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input name="phone" placeholder="手机号" type="text"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input name="password" type="password" placeholder="密码"
								class="form-control">
						</div>
					</div>
					<div class="form-group" style="margin-top: 25px">
						<div class="col-sm-12">
							<button type="submit" class="btn btn-primary btn-block">注册</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
			$("#registerBtn").click(function() {
				$('#loginDialog').modal('hide'); //关闭登录弹出框		
			});

			$("#registerForm").submit(function(envent) {
				envent.preventDefault();
				var form = $(this);
				$.ajax({
					url : form.attr("action"),
					type : form.attr("method"),
					data : form.serialize(),
					dataType : "json",
					/*  beforeSend: function ()  
					 {  
					     $("#ajax-loader").show();  
					 },   */
					error : function() {
						$('input[name="password"]').val("");
						layer.msg("注册失败,用户名或手机号已存在！");
					},
					success : function(data) {
						if (data.status == 0) {
							layer.msg("注册成功");
							//ajax登录
							$.post(
								'${pageContext.request.contextPath}/user/login,do',form.serialize(),function(data){
									if(data.status == 0){
										window.location = '${pageContext.request.contextPath}/index.do';
									}
								}									
							);
						}
					}
				});
			});

			$("#loginForm").submit(function(envent) {
				envent.preventDefault();
				var form = $(this);
				$.ajax({
					url : form.attr("action"),
					type : form.attr("mathod"),
					data : form.serialize(),
					dataType : "json",
					/*  beforeSend: function ()  
					 {  
					     $("#ajax-loader").show();  
					 }, complete : function() {
					},*/
					error : function() {
						//登录失败
						layer.msg("登录失败");
					},
					success : function(data) {
						if (data.status == 0) {
							layer.msg("登录成功");
							window.location = "${pageContext.request.contextPath}/index.do";
						}else{
							//清空密码框
							$('input[name="password"]').val("");
							layer.msg(data.msg);
						}
					}
				});
			});
			
			//注册表单校验
			$(".registerForm").bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyhicon-remove',
					validating : 'glyhicon glyphicon-refresh'
				},
				fields : {
					username : {
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},
							regexp : {
								regexp : /^[a-zA-Z0-9_]+$/,
								message : '用户名只能包含大小写数字下划线'
							},	 
							remote: { 
	                        url: '${pageContext.request.contextPath}/user/checkUserName.do',  
	                        message:"用户名重复",  
	                        type: "get",
	                       /*  dataType: 'json',  
	                        data: {  
	                              
	                        },   */
	                        delay: 1500
	                    	}
						}
					},
					phone : {
						validators : {
							notEmpty : {
								message : '手机号码不能为空'
							},
							regexp : {
								regexp : /^1[34578]\d{9}$/,
								message : '请输入正确的手机号码'
							},
						    remote: {  
		                        url: '${pageContext.request.contextPath}/user/checkUserByPhone.do',  
		                        message:"手机号码重复",  
		                        type: "get",  
		                        /* dataType: 'json',  
		                         data: {  会自动提交数据
		                        	
	                       		},   */
	                        	delay: 1500 
	                  	    } 
						}
					
					},
					password : {
						validators : {
							notEmpty : {
								message : '密码不能为空',
							}
						}
					}
				}
			}).on('success.form.bv', function(e) {
				e.preventDefault();
			});
			
			//登录表单校验
			$("#loginForm").bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyhicon-remove',
					validating : 'glyhicon glyphicon-refresh'
				},
				fields : {
					username : {
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},
							regexp : {
								regexp : /^[a-zA-Z0-9_]+$/,
								message : '用户名只能包含大小写数字下划线'
							},	 
							
						}
					},
					password : {
						validators : {
							notEmpty : {
								message : '密码不能为空',
							}
						}
					}
				}
			}).on('success.form.bv', function(e) {
				e.preventDefault();
			});
			
			
			
		});
		
		
		
		
		
	</script>
</div>



