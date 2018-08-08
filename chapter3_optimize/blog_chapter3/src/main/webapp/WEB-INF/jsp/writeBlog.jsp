<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Simple example - Editor.md examples</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/editmd/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/editmd/css/editormd.min.css" />
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
	<style type="text/css">
		#uploadCover{
         width:33px;   
         height:33px;   
         background:url(${pageContext.request.contextPath}/img/uploadImg.png) no-repeat center;   
         cursor:pointer;   
         display:block;
         font-size:0; 
         line-height:0;
         text-indent:-9999px;  
         float: right; 
         margin-top: 8px;
		}
	</style>
</head>
<body>
	<form id = "blogForm" class="form-inline" onsubmit="return check()"
		action="${pageContext.request.contextPath}/blog/addBlog.do" method="post"
		enctype="multipart/form-data">
		<div id="layout">
			<center>
				<!-- <img id = "coverImg" class = "markdown-body img" alt="" src=""> -->
				<input type="hidden"  name = "coverImage" value="" />			
			</center>
			<div style="margin: 0 auto; width: 90%;overflow:auto;
			border-style: solid; border-width: 1px; border-color: #eeeeee;">
			<input type = "hidden" name = "blogId" value="${blog.blogId}"/>
			<input type="text" id="title" name="blogTitle"
				placeholder="请输入文章标题..." value="${blog.blogTitle}"
				style="display: block; padding-left: 10px; float:left;
			 border:none;
			 height: 50px; width:95%;  font-size: 22px; font-weight: bold;"
				/>
			<input id = "uploadCover" name = "file" type="file" onchange="uploadPic()" />
			</div>
			<div id="test-editormd">
				<textarea id = "content" style="display: none;" name="blogContent">${blog.blogContent }</textarea>
			</div>
			<div style="width: 90%; margin: 0 auto">
				<div class="form-group">
					<label class="control-label">选择分类：</label> 
					<select id = "type" class="form-control" name="typeId"  >
						<option value="1">前端</option>
						<option value="2">后端</option>
						<option value="3">大数据</option>
					</select>
				</div>
				
				<div class="form-group" style="margin-left: 25px" >
					<label class="control-label">标签：</label> 
					<select class="form-control" name="tagId" >
						<option value="0">无</option>
						<option value="1">人工智能</option>
						<option value="2">大数据</option>
						<option value="3">代码规范</option>
						<option value="4">产品</option>
						<option value="5">算法</option>
						<option value="6">面试</option>
						<option value="7">开源</option>
					</select>
				</div>
				<button type="submit"
					style="float: right; padding-left: 15px; padding-right: 15px"
					class="btn btn-primary">发布</button>
				<button type="button" id="cancel"
					style="float: right; margin-right: 18px; padding-left: 15px; padding-right: 15px"
					class="btn btn-default">取消</button>
			</div>
		</div>
		
	</form>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/editmd/editormd.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.js" type="text/javascript"></script>  
	<script type="text/javascript">
		var testEditor;

		$(function() {
              var testEditor = editormd("test-editormd", {
                  width: "90%",
                  height: 600,
                  markdown : "",
                  path : '${pageContext.request.contextPath}/lib/',
                  saveHTMLToTextarea : true,
                  imageUpload : true,
                  imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                  imageUploadURL : "${pageContext.request.contextPath}/uploadMdImg.do",
                });
              /*
              	上传的后台只需要返回一个 JSON 数据，结构如下：
              {
                 success : 0 | 1,           // 0 表示上传失败，1 表示上传成功
                 message : "提示的信息，上传成功或上传失败及错误信息等。",
                 url     : "图片地址"        // 上传成功时才返回
              }
              */

            //提示
            //TODO 判断用户是否是第一次创建博客  
            layer.tips('这里可以上传封面哦！', '#uploadCover');              
		              
        	//如果request中有blog数据  就初始化这些数据
        	var coverInfo = '${blog.coverImage}';
        	if(coverInfo != ''){
        		//设置封面图片
        		var img = '<img id = "coverImg" alt="" src="'+ coverInfo+'">';
        	    $("#coverImg").remove();
				$(".markdown-body").before(img);                   
                $("input[name = 'coverImage']").val(coverInfo);
        	}
        	var typeValue = '${blog.typeId}';
        	if(typeValue != ''){
				$("#type").val(typeValue);	
        	}
        	
        	
			//询问框
			$("#cancel").click(function() {
				var blogId = '${blog.blogId}';
				if(blogId != ''){
					window.location = '${pageContext.request.contextPath}/index.do';
					return;
				}
				
				layer.confirm('需要保存草稿吗？', {
					btn : [ '需要', '不需要' ]
				//按钮
				}, function() {
					if(check()){
						var form = $("#blogForm");
						//var info = testEditor.getPreviewedHTML();
						var jsonData = form.serialize();
						$.post("${pageContext.request.contextPath}/blog/saveDraft.do",jsonData,function(data){
							if(data.status == 0){
								layer.msg('保存成功', {
									icon : 1
								});
								window.location = '${pageContext.request.contextPath}/index.do';
							}
						});
					}
				}, function() {
					window.location = '${pageContext.request.contextPath}/index.do';
				});
			})
		});
		
		function uploadPic(){
			// 上传设置  
	        var options = {  
	                // 规定把请求发送到那个URL  
	                url: "${pageContext.request.contextPath}/uploadImg.do",  
	                // 请求方式  
	                type: "post",
	                // 服务器响应的数据类型  
	                dataType: "json",  
	                // 请求成功时执行的回调函数  
	                success: function(data, status, xhr) {
	                	//console.log(data);
	                    // 图片显示地址  
	                   /*  $("#coverImg").attr("src", "/pic/" + data.url);  */
	                   var img = '<img id = "coverImg" alt="" src="/pic/'+ data.url+'">';
                	    $("#coverImg").remove();
						$(".markdown-body").before(img);                   
	                    $("input[name = 'coverImage']").val('/pic/'+data.url);
	                },
	                error:function(){
						layer.msg("上传失败，图片不能超过10M");
	                }
	        }; 
	        $("#blogForm").ajaxSubmit(options);  
		}
		
		function checkTitle(){
			//判断标题
			var value = $("#title").val().trim();
			if(value == null || value == ""){
				return false;
			}															
			return true;			
		}
		
		function checkContent(){
			//检验内容
			var value = $("#content").text().trim();
			if(value == null || value == ''){
				return false;
			}										
			return true;
		}
		
		function check(){
			if(!checkTitle()){
				layer.msg('标题不能为空', {
					icon : 2
				});
				return false;
			}
			if(!checkContent()){
				layer.msg('内容不能为空', {
					icon : 2
				});
				return false;
			}
			return true;
		}
		
	</script>
</body>

</html>