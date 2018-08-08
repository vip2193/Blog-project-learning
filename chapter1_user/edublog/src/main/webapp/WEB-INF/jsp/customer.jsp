<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>客户列表-BootCRM</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/bootstrap-table.min.css" rel="stylesheet"
          type="text/css">

    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
          type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">BOOT客户管理系统 v2.0</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown"><a class="dropdown-toggle"
                                    data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
                <i class="fa fa-caret-down"></i>
            </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li><a href="#">
                        <div>
                            <strong>令狐冲</strong> <span class="pull-right text-muted">
									<em>昨天</em>
								</span>
                        </div>
                        <div>今天晚上向大哥找我吃饭，讨论一下去梅庄的事...</div>
                    </a></li>
                    <li class="divider"></li>
                    <li><a class="text-center" href="#"> <strong>查看全部消息</strong>
                        <i class="fa fa-angle-right"></i>
                    </a></li>
                </ul> <!-- /.dropdown-messages --></li>
            <!-- /.dropdown -->
            <li class="dropdown"><a class="dropdown-toggle"
                                    data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
                <i class="fa fa-caret-down"></i>
            </a>
                <ul class="dropdown-menu dropdown-tasks">
                    <li><a href="#">
                        <div>
                            <p>
                                <strong>任务 1</strong> <span class="pull-right text-muted">完成40%</span>
                            </p>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-success"
                                     role="progressbar" aria-valuenow="40" aria-valuemin="0"
                                     aria-valuemax="100" style="width: 40%">
                                    <span class="sr-only">完成40%</span>
                                </div>
                            </div>
                        </div>
                    </a></li>
                    <li class="divider"></li>
                    <li><a href="#">
                        <div>
                            <p>
                                <strong>任务 2</strong> <span class="pull-right text-muted">完成20%</span>
                            </p>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-info" role="progressbar"
                                     aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 20%">
                                    <span class="sr-only">完成20%</span>
                                </div>
                            </div>
                        </div>
                    </a></li>
                    <li class="divider"></li>
                    <li><a class="text-center" href="#"> <strong>查看所有任务</strong>
                        <i class="fa fa-angle-right"></i>
                    </a></li>
                </ul> <!-- /.dropdown-tasks --></li>
            <!-- /.dropdown -->
            <li class="dropdown"><a class="dropdown-toggle"
                                    data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
                <i class="fa fa-caret-down"></i>
            </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li><a href="#">
                        <div>
                            <i class="fa fa-comment fa-fw"></i> 新回复 <span
                                class="pull-right text-muted small">4分钟之前</span>
                        </div>
                    </a></li>
                    <li class="divider"></li>
                    <li><a href="#">
                        <div>
                            <i class="fa fa-envelope fa-fw"></i> 新消息 <span
                                class="pull-right text-muted small">4分钟之前</span>
                        </div>
                    </a></li>
                    <li class="divider"></li>
                    <li><a href="#">
                        <div>
                            <i class="fa fa-tasks fa-fw"></i> 新任务 <span
                                class="pull-right text-muted small">4分钟之前</span>
                        </div>
                    </a></li>
                    <li class="divider"></li>
                    <li><a href="#">
                        <div>
                            <i class="fa fa-upload fa-fw"></i> 服务器重启 <span
                                class="pull-right text-muted small">4分钟之前</span>
                        </div>
                    </a></li>
                    <li class="divider"></li>
                    <li><a class="text-center" href="#"> <strong>查看所有提醒</strong>
                        <i class="fa fa-angle-right"></i>
                    </a></li>
                </ul> <!-- /.dropdown-alerts --></li>
            <!-- /.dropdown -->
            <li class="dropdown"><a class="dropdown-toggle"
                                    data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
                <i class="fa fa-caret-down"></i>
            </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> 用户设置</a></li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
                        退出登录</a></li>
                </ul> <!-- /.dropdown-user --></li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="查询内容...">
                            <span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button>
							</span>
                        </div> <!-- /input-group -->
                    </li>
                    <li><a href="#" class="active"><i
                            class="fa fa-edit fa-fw"></i> 客户管理</a></li>
                    <li><a href="#"><i
                            class="fa fa-dashboard fa-fw"></i> 客户拜访</a></li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side --> </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">客户管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" action="${pageContext.request.contextPath }/customer/list.do"
                      method="get">
                    <div class="form-group">
                        <label for="customerName">客户名称</label>
                        <input type="text" class="form-control" id="customerName" value="${custName}" name="custName">
                    </div>
                    <div class="form-group">
                        <label for="customerFrom">客户来源</label>
                        <select class="form-control" id="customerFrom" placeholder="客户来源" name="custSource">
                            <option value="">--请选择--</option>
                            <c:forEach items="${fromType}" var="item">
                                <option value="${item.dictId}"<c:if
                                        test="${item.dictId == custSource}"> selected</c:if>>${item.dictItemName }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="custIndustry">所属行业</label>
                        <select class="form-control" id="custIndustry" name="custIndustry">
                            <option value="">--请选择--</option>
                            <c:forEach items="${industryType}" var="item">
                                <option value="${item.dictId}"<c:if
                                        test="${item.dictId == custIndustry}"> selected</c:if>>${item.dictItemName }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="custLevel">客户级别</label>
                        <select class="form-control" id="custLevel" name="custLevel">
                            <option value="">--请选择--</option>
                            <c:forEach items="${levelType}" var="item">
                                <option value="${item.dictId}"<c:if
                                        test="${item.dictId == custLevel}"> selected</c:if>>${item.dictItemName }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">客户信息列表</div>
                    <table id="table"></table>
                    <div class="col-md-12 text-right">
                        <itcast:page url="${pageContext.request.contextPath }/customer/list.action"/>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- 客户编辑对话框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_customer_form">
                    <input type="hidden" id="edit_cust_id" name="custId"/>
                    <div class="form-group">
                        <label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_customerName" placeholder="客户名称"
                                   name="custName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="edit_customerFrom" placeholder="客户来源" name="custSource">
                                <option value="">--请选择--</option>
                                <c:forEach items="${fromType}" var="item">
                                    <option value="${item.dictId}"<c:if
                                            test="${item.dictId == custSource}"> selected</c:if>>${item.dictItemName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="edit_custIndustry" name="custIndustry">
                                <option value="">--请选择--</option>
                                <c:forEach items="${industryType}" var="item">
                                    <option value="${item.dictId}"<c:if
                                            test="${item.dictId == custIndustry}"> selected</c:if>>${item.dictItemName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="edit_custLevel" name="custLevel">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dictId}"<c:if
                                            test="${item.dictId == custLevel}"> selected</c:if>>${item.dictItemName }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_linkMan" placeholder="联系人"
                                   name="custLinkman">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_phone" placeholder="固定电话"
                                   name="custPhone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mobile" placeholder="移动电话"
                                   name="custMobile">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_zipcode" placeholder="邮政编码"
                                   name="custZipcode">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_address" placeholder="联系地址"
                                   name="custAddress">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/bootstrap-table.min.js"></script>
<script src="<%=basePath%>js/bootstrap-table-zh-CN.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>


<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>

<script type="text/javascript">
    $(function () {
        //设置表格发送到服务端的ajax数据 的 key 类型  如果不设置 那么发送第一页的请求参数是 offset 1 limit 10  设置了之后参数是  pageNum 1 pageSize 10
        var queryParams = function (params) {
            console.log(params);
            var param = {
                pageNum: Math.ceil(params.offset / params.limit) + 1,
                pageSize: params.limit,
                order: params.order,  //暂时不排序
                ordername: params.sort,
                search: ""
            };
            return param;
        }

        var responseHandler = function (e) {
            if (e.list && e.list.length > 0) {
                return {"rows": e.list, "total": e.total};           //设置为客户端分页是   return {"data":e.list,"total":e.total}
            }
            else {
                return {"rows": [], "total": e.total};
            }
        }

        var operateFormatter = function (value, row, index) {//赋予的参数
            console.log("value:" + value + "row" + row.custId + row.custIndustry + row.custName + "index:" + index);
            var id = row.custId;
            return [
                '<button class="btn btn-info btn-sm" type="button" data-toggle="modal" data-target="#customerEditDialog" onclick="editCustomer(' + id + ')" ><i class="fa fa-edit"></i> 修改</button>',
                '<button class="btn btn-danger btn-sm" type="button"  onclick="deleteCustomer(' + id + ')" ><i class="fa fa-remove"></i> 删除</button>'
            ].join('');
        }
        $("#table").bootstrapTable({
            url: '<%=basePath%>customer/pageQuery.do',
            pagination: true,                    //是否显示分页条
//            strictSearch: true,
            showRefresh: true,                  //是否显示刷新按钮
            showToggle: true,                    //是否显示详细视图和列表视图
            clickToSelect: true,                //是否启用点击选中行
            minimumCountColumns: 2,          //最少允许的列数 clickToSelect: true, //是否启用点击选中行
            pageSize: 10,                    //每页的记录行数（*）
            pageList: [10, 25, 50, 100],     //可供选择的每页的行数（*）
            height: document.body.clientHeight - 165,   //动态获取高度值，可以使表格自适应页面
            cache: false,                       // 不缓存
            striped: true,                      // 隔行加亮
            queryParamsType: "limit",           //设置为"undefined",可以获取pageNumber，pageSize，searchText，sortName，sortOrder
                                                //设置为"limit",符合 RESTFul 格式的参数,可以获取limit, offset, search, sort, order
            queryParams: queryParams,
            sidePagination: "server",       //分页方式：client客户端分页，server服务端分页（*）
            paginationPreText: "上一页",
            paginationNextText: "下一页",
            paginationFirstText: "首页",
            paginationLastText: "末页",
            responseHandler: responseHandler,      //数据转换函数
            columns: [
                {
                    checkbox: true
                },
                {
                    field: "custId",
                    title: "客户编号",
                    align: "center",
                    visible: false
                },
                {
                    field: "custName",
                    title: "客户名称",
                    align: "center"
                },
                {
                    field: "custSource",
                    title: "客户来源",
                    align: "center"
                },
                {
                    field: "custIndustry",
                    title: "客户所属行业",
                    align: "center"
                },
                {
                    field: "custLevel",
                    title: "客户级别",
                    align: "center"
                },
                {
                    field: "custPhone",
                    title: "固定电话",
                    align: "center"
                },
                {
                    field: "custMobile",
                    title: "手机",
                    align: "center"
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    valign: 'bottom',    //
                    formatter: operateFormatter //自定义方法，添加操作按钮
                }
            ]
        })
    });


    function editCustomer(id) {
        $.ajax({
            type: "get",
            url: "<%=basePath%>customer/edit.do",
            data: {"id": id},
            success: function (data) {
                $("#edit_cust_id").val(data.custId);
                $("#edit_customerName").val(data.custName);
                $("#edit_customerFrom").val(data.custSource)
                $("#edit_custIndustry").val(data.custIndustry)
                $("#edit_custLevel").val(data.custLevel)
                $("#edit_linkMan").val(data.custLinkman);
                $("#edit_phone").val(data.custPhone);
                $("#edit_mobile").val(data.custMobile);
                $("#edit_zipcode").val(data.custZipcode);
                $("#edit_address").val(data.custAddress);
            }
        });
    }
    function updateCustomer() {
        $.post("<%=basePath%>customer/updateCustomer.do", $("#edit_customer_form").serialize(), function (data) {
            console.log(data);
//            alert("客户信息更新成功！");
            window.location.reload();
        });
    }

    function deleteCustomer(id) {
        if (confirm('确实要删除该客户吗?')) {
            $.post("<%=basePath%>customer/deleteCustomer.do", {"custId": id}, function (data) {
//                alert("客户删除成功！");
                window.location.reload();
            });
        }
    }
</script>

</body>

</html>
