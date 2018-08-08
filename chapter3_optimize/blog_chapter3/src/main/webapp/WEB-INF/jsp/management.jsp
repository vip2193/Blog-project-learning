<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>后台管理</title>
        <link rel="stylesheet" href="<%=path %>/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css" />
        <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
    </head>
    <style type="text/css">
        body {
            padding: 20px;
        }

        .headLeft {
            float: left;
        }

        .headRight {
            padding-top: 40px;
            padding-left: 340px;
        }

        .search {
            margin-bottom: 10px;
        }

        .search .toolbar {}
    </style>
    <!--必须使用较新版本的BootStrap才有如下效果-->

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-fixed-top" role="navigation">
                        <div class="container">
                            <div class="navbar-header">
                                <a class="navbar-brand " href="#">后台管理系统</a>
                            </div>
                            <div id="navbar" class="navbar-right">
                                <a class="navbar-brand" href="#">当前用户：xx</a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="row" style="padding-top: 45px">
                <div class="col-md-3">
                    <div class="list-group">
                        <!--激活，作为标题-->
                        <a href="#" class="list-group-item active ">
                            系统菜单
                        </a>
                        <a href="#" class="list-group-item">管理一</a>
                        <a href="#" class="list-group-item">管理二</a>
                        <a href="#" class="list-group-item">管理三</a>
                        <a href="#" class="list-group-item">管理四</a>
                        <a href="#" class="list-group-item">退出</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div>
                        <ol class="breadcrumb">
                            <li><span class="glyphicon glyphicon-home"></span>&nbsp;
                                <a href="#">主页</a>
                            </li>
                            <li class="active"></li>
                        </ol>
                    </div>
                    <div align="center" style="padding-top: 50px;">
                        <h1>后台管理系统</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div align="center" style="padding-top: 200px">
                        Copyright © 2017-2018 larger5
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>