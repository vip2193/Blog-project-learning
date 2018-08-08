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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>注册-BootCRM</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
<body>
<jsp:include page="nav.jsp"/>

<div class="container">
    <h1>添加电脑配件</h1>
    <span style="color: red">${errorInfo}</span>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/component/add.do" method="post">
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">配件名称</label>
            <div class="col-sm-10">
                <input id="componentName" name="componentName" type="text" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">配件类型</label>
            <div class="col-sm-10">
            	<select id = "tyoeId" name = "tyoeId" class="form-control" >
            	</select>
            </div>
        </div>
        <div class="form-group" id = "container">
            <label class="col-sm-2 control-label">容量</label>
            <div class="col-sm-10" id = "capacityDiv">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">价格</label>
            <div class="col-sm-10">
                <input id = "price"  name="price" type="text" class="form-control" >
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">添加</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
	$("#container").hide();
    //开始表单校验
    $(function () {
       $("form").bootstrapValidator({
           message: 'This value is not valid',
           feedbackIcons: {
               valid: 'glyphicon glyphicon-ok',
               invalid: 'glyphicon glyhicon-remove',
               validating: 'glyhicon glyphicon-refresh'
           },
           fields: {
        	   componentName: {
                   validators: {
                       notEmpty: {
                           message: '配件容量不能为空'
                       }
                   }
               },
               price:{
                    validators:{
                        notEmpty:{
                            message:'价格不能为空'
                        }
                    }
               }
           }
       });
    });
    
  $(function(){
	  var url = "${pageContext.request.contextPath}/component/findComponentType.do";
	  $.get(url,function(data){
		  console.log(data.length);
		  for(var i = 0 ;i<data.length;i++){
			  $("#tyoeId").append('<option value="'+data[i].typeid+'"> '+ data[i].typename+'</option>');
		  }
	  });
	  
	  
	  $("#tyoeId").change(function(){
		  $("#capacityDiv").empty();
		  $("#container").hide();
		  var value = $("#tyoeId").children("option:selected").html();
		  value = value.trim();
		  if(value == "内存" ||value == "硬盘"){
			  //添加
			  $("#capacityDiv").append('<input id ="capacity" type = "number" name = "capacity" class = "form-control"/>');
			  $("#container").show();
			  //设置只读
			  $("#price").attr("readonly","readonly");
			  $("#capacity").blur(function(){
				  var capacity = $("#capacity").val();
				  //计算
				  if(value == "内存"){
					  if(capacity > 2){
						  $("#price").val(capacity*40);
					  }else{
						  $("#price").val(100);
					  }
				  }
				  
				  if(value = "硬盘"){
					  if(capacity > 200){
						  $("#price").val(capacity*1.2);
					  }else{
						  $("#price").val(200);
					  }
				  }
			  });
		  }
	  });
  })
    
    
</script>
</body>
</html>
