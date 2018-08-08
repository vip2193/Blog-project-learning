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
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>
	
	<!-- Bootstrap  Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/bootstrap-table.min.js"></script>
	<script src="<%=basePath%>js/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<jsp:include page="nav.jsp"/>
<div class="container">
    <h2>电脑配件列表</h2>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">客户信息列表</div>
                <table id="table"></table>
            </div>
        </div>
    </div>
</div>

<!-- 修改对话框-->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改配件信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_component_form" action = "${pageContext.request.contextPath}/component/updateComponent.do">
                    <input type="hidden" id="componentId" name="componentId"/>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">配件名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="componentName"
                                   name="componentName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">配件类型</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="componentType"  name="tyoeId">
                                <option value="">--请选择--</option>
                                <c:forEach var="item" items="${typeList}">
                                	 <option value="${item.typeid}">${item.typename}</option>
                                </c:forEach>
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
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button type="submit" class="btn btn-primary">保存修改</button>
	            </div>
            </form>
            </div>
        </div>
    </div>
</div>

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
        var id = row.componentId;
        return [
            '<button class="btn btn-info btn-sm" type="button" data-toggle="modal" data-target="#customerEditDialog" onclick="edit(' + id + ')" ><i class="fa fa-edit"></i> 修改</button>',
            '<button class="btn btn-danger btn-sm" type="button"  onclick="deletefunc(' + id + ')" ><i class="fa fa-remove"></i> 删除</button>'
        ].join('');
    }
    $("#table").bootstrapTable({
        url: '<%=basePath%>component/pageQuery.do',
        pagination: true,                    //是否显示分页条
//        strictSearch: true,
        showRefresh: true,                  //是否显示刷新按钮
        showToggle: true,                    //是否显示详细视图和列表视图
        clickToSelect: true,                //是否启用点击选中行
        minimumCountColumns: 2,          //最少允许的列数 clickToSelect: true, //是否启用点击选中行
        pageSize: 5,                    //每页的记录行数（*）
        pageList: [5, 25, 50, 100],     //可供选择的每页的行数（*）
        height: 500,   //动态获取高度值，可以使表格自适应页面
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
                field: "componentId",
                title: "编号",
                align: "center",
                visible: false
            },
            {
                field: "componentName",
                title: "配件名称",
                align: "center"
            },
            {
                field: "typeName",
                title: "配件类型",
                align: "center"
            },
            {
                field: "capacity",
                title: "容量",
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

function edit(id){
	$("#container").hide();
	var url = "${pageContext.request.contextPath}/component/editComponent.do?id="+id;
	$.get(url,function(data){
		$("#componentId").val(data.componentId);
		$("#componentName").val(data.componentName);
		$("#capacity").val(data.capacity);
		$("#price").val(data.price);
		//修改select
		$("#componentType").find('option[value='+data.tyoeId+']').attr('selected',true);
	});
	 $("#componentType").change(function(){
		  $("#capacityDiv").empty();
		  $("#container").hide();
		  var value = $("#componentType").children("option:selected").html();
		  value = value.trim();
		  if(value == "内存" ||value == "硬盘"){
			  //添加
			  $("#capacityDiv").append('<input id ="capacity" type = "number" name = "capacity" class = "form-control"/>');
			  $("#container").show();
			  //设置只读
			  $("#price").prop("readonly","readonly");
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
		  }else{
			  $("#price").prop("readonly","");
		  }
	  });
	
}
function deletefunc(id){
	if(confirm("你确定要删除吗？")){
		var url = "${pageContext.request.contextPath}/component/deleteComponent.do?id="+id;
		$.get(url,function(data){
			if(data.trim() == "ok" ){
			  window.location.reload();
			}else{
				alert("修改失败");
			}
		});
	}
}

</script>
</body>
</html>