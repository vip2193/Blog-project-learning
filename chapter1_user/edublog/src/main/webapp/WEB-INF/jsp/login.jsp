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
    <title>登录</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="css/bootstrapValidator.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrapValidator.min.js"></script>
<body>
<%-- <jsp:include page="nav.jsp"/> --%>

<div class="container">
    <h1>登录</h1>
    <span style="color: red">${errorInfo}</span>
    <form class="form-horizontal" action="user/login.do" method="post">
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input id="username" name="username" type="text" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input  name="password" type="text" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">登录</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">

    //开始表单校验
    //校验用户名 手机号
    $(function () {
       $("form").bootstrapValidator({
           message: 'This value is not valid',
           feedbackIcons: {
               valid: 'glyphicon glyphicon-ok',
               invalid: 'glyphicon glyhicon-remove',
               validating: 'glyhicon glyphicon-refresh'
           },
           fields: {
        	   username: {
                   validators: {
                       notEmpty: {
                           message: '用户名不能为空'
                       },
                       regexp:{
                           regexp:/^[a-zA-Z0-9_]+$/,
                           message:'用户名只能包含大小写数字下划线'
                       }
                   }
               },
            /*    email: {
                   validators: {
                       notEmpty: {
                           message: '邮箱信息不能为空'
                       },
                       emailAddress:{
                           message:'请输入正确的邮箱地址如：123@qq.com'
                       }
                   }
               }, */
               phone:{
                    validators:{
                        notEmpty:{
                            message:'手机号码不能为空'
                        },
                        regexp:{
                            regexp:/^1[34578]\d{9}$/,
                            message:'请输入正确的手机号码'
                        }
                    }
               },
               password:{
            	 	validators:{
            	 		notEmpty:{
            	 			message:'密码不能为空',
            	 		}
            	 		}
            	}  
           }
       });
    });
</script>
</body>
</html>
