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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>客户列表-BootCRM</title>

    <%-- <!-- Bootstrap Core CSS -->
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
     <!-- Custom Fonts -->
     <link href="<%=basePath%>css/bootstrap-table.min.css" rel="stylesheet"
           type="text/css">--%>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

    <link href="<%=basePath%>css/bootstrap-table.min.css" rel="stylesheet"
          type="text/css">
</head>
<body>
<jsp:include page="nav.jsp"/>
<div class="container">
    <h2>电脑列表</h2>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">电脑列表</div>
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

<!-- 客户编辑对话框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改电脑信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="updateComputer.do" method="post">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">电脑型号</label>
                        <div class="col-sm-10">
                            <input id="computerId" name="computerId" type="hidden" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">电脑型号</label>
                        <div class="col-sm-10">
                            <input id="name" name="computerName" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cpu" class="col-sm-2 control-label">CPU</label>
                        <div class="col-sm-10">
                            <select id="cpu" name="cup" class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">内存</label>
                        <div class="col-sm-10">
                            <select id="capacity" name="memory" class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">硬盘</label>
                        <div class="col-sm-10">
                            <select id="disk" name="hdd" class="form-control">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="GPU" class="col-sm-2 control-label">显卡</label>
                        <div class="col-sm-10">
                            <select id="GPU" name="videocard" class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="display" class="col-sm-2 control-label">显示器</label>
                        <div class="col-sm-10">
                            <select id="display" name="display" class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="price" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-10">
                            <input id="price" type="text" name="price" class="form-control box" readonly>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">保存修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="<%=basePath%>js/jquery.min.js"></script>

<!-- Bootstrap  Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/bootstrap-table.min.js"></script>
<script src="<%=basePath%>js/bootstrap-table-zh-CN.js"></script>

<script type="text/javascript">
    $(function () {
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
            var id = row.computerId;
            return [
                '<button class="btn btn-info btn-sm" type="button" data-toggle="modal" data-target="#customerEditDialog" onclick="editCustomer(' + id + ')" ><i class="fa fa-edit"></i> 修改</button>',
                '<button class="btn btn-danger btn-sm" type="button"  onclick="deleteComputer(' + id + ')" ><i class="fa fa-remove"></i> 删除</button>'
            ].join('');
        }
        $("#table").bootstrapTable({
            url: '<%=basePath%>computerPageQuery.do',
            pagination: true,                    //是否显示分页条
//            strictSearch: true,
            paginationLoop: false,               //设置不能无限循环
            showRefresh: true,                  //是否显示刷新按钮
            showToggle: true,                    //是否显示详细视图和列表视图
            clickToSelect: true,                //是否启用点击选中行
            minimumCountColumns: 2,          //最少允许的列数 clickToSelect: true, //是否启用点击选中行
            pageSize: 5,                    //每页的记录行数（*）
            pageList: [5, 10, 25, 100],     //可供选择的每页的行数（*）
            height: 600,   //动态获取高度值，可以使表格自适应页面
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
                    field: "computerId",
                    title: "序号",
                    align: "center"
                },
                {
                    field: "computerName",
                    title: "电脑名称",
                    align: "center"
                },
                {
                    field: "cpuName",
                    title: "CPU",
                    align: "center"
                },
                {
                    field: "memoryName",
                    title: "内存",
                    align: "center"
                },
                {
                    field: "gpuName",
                    title: "显卡",
                    align: "center"
                },
                {
                    field: "diskName",
                    title: "硬盘",
                    align: "center"
                },
                {
                    field: "displayName",
                    title: "显示器",
                    align: "center"
                },
                {
                    field: "price",
                    title: "价格",
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
        var count = 0;
        for (var i = 1; i <= 5; i++) {
            var url = "${pageContext.request.contextPath}/getComponentList.do?typeId=" + i;
            $.post(url, function (data) {
                count++;
//                console.log(data);
                var element = $("#cpu");
                switch (data.typeId) {
                    case 1:
                        //CPU
                        element = $("#cpu");
                        break;
                    case 2:
                        //内存
                        element = $("#capacity");
                        break;
                    case 3:
                        //显卡
                        element = $("#GPU");
                        break;
                    case 4:
                        //硬盘
                        element = $("#disk");
                        break;
                    case 5:
                        //显示器
                        element = $("#display");
                        break;
                }
                element.empty();
                //添加option
                for (var j = 0; j < data.list.length; j++) {
//                    console.log(data.list[j]);
                    element.append('<option value="' + data.list[j].componentId + '" price = "' + data.list[j].price + '" > ' + data.list[j].componentName + ' </option>');
                }


                if (count == 5) {
                    var url = "${pageContext.request.contextPath}/getComputerById.do?id=" + id;
                    $.get(url, function (data) {
                        $("#computerId").val(data.computerId);
                        $("#name").val(data.computerName);
                        $("#cpu").find('option[value=' + data.cup + ']').attr('selected', true);
                        $("#capacity").find('option[value=' + data.memory + ']').attr('selected', true);
                        $("#GPU").find('option[value=' + data.videocard + ']').attr('selected', true);
                        $("#disk").find('option[value=' + data.hdd + ']').attr('selected', true);
                        $("#display").find('option[value=' + data.display + ']').attr('selected', true);
                        countPrice();
                    });
                }
            });
        }
    }

    function countPrice() {
        //说明下拉列表数据已经填充完毕   接下来计算价格
        var cpuPrice = parseInt($("#cpu").children("option:selected").attr('price'));
        var capacity = parseInt($("#capacity").children("option:selected").attr('price'));
        var disk = parseInt($("#disk").children("option:selected").attr('price'));
        var display = $("#display").children("option:selected").attr('price');
        var gpu = $("#GPU").children("option:selected").attr('price');
        //填充价格
        $("#price").val(cpuPrice + capacity + parseInt(display) + disk + parseInt(gpu));
    }

    $("select").change(function () {
        countPrice();
    });

    function deleteComputer(id) {
        if (confirm("真的要删除吗？")) {
            $.get("${pageContext.request.contextPath}/deleteComputer.do?id=" + id,function (data) {
                if(data == "ok"){
                    window.location.reload();
                }
            });
        }

    }


</script>
</body>
</html>
