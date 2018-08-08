<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的博客</title>
		<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
		<link href="<%=basePath%>css/bootstrapValidator.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/main.css" rel="stylesheet">
		<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
		<link href="<%=basePath%>css/bootstrap-table.min.css" rel="stylesheet"
          type="text/css">
           
		<script src="<%=basePath%>js/jquery.min.js"></script>
		<script src="<%=basePath%>js/bootstrap.min.js"></script>
	    <script src="<%=basePath%>js/bootstrapValidator.min.js"></script>
	    <script src="<%=basePath%>layer/layer.js"></script>
		<script src="<%=basePath%>js/bootstrap-table.min.js"></script>
		<script src="<%=basePath%>js/bootstrap-table-zh-CN.js"></script>
		<style type="text/css">
			
		</style>
</head>
<body style="background-color: #ffffff"> 
	<jsp:include page="nav.jsp"></jsp:include>
	<hr>
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12 col-xs-12">
	            <div class="pan01el panel-default" >
	                <div class="panel-heading">博客信息列表    
	                	<select id = "typeSelect" style="margin-left: 16px; width: 100px; font-size: 12px;  height: 30px; padding: 4px  " >
	                		<option value="1">已发布</option>
	                		<option value="0">草稿</option>
	                		<option value="2">废纸篓</option>
	                	</select>
	                 </div>
	                <table class = "table" id="table"></table>
	            </div>
	        </div>
	    </div>
	</div>
	
<script type="text/javascript">
$(function () {
    //设置表格发送到服务端的ajax数据 的 key 类型  如果不设置 那么发送第一页的请求参数是 offset 1 limit 10  设置了之后参数是  pageNum 1 pageSize 10
    var queryParams = function (params) {
        //console.log(params);
        var param = {
            pageNum: Math.ceil(params.offset / params.limit) + 1,
            pageSize: params.limit,
            userId:'${userInfo.userid}',
            blogStatus:1,
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

    //添加的操作按钮
    var operateFormatter = function (value, row, index) {//赋予的参数
        var id = row.blogId;
        return [  
            '<a class="btn btn-primary btn-sm"  type="button"  href="<%=basePath%>/blog/editBlog.do?blogId='+ id +'"  ><i class="fa fa-edit"></i> 编辑</a> ',
            ' <button class="btn btn-default btn-sm" type="button"  onclick="deletefunc(' + id + ')" ><i class="fa fa-remove"></i> 删除</button>'
        ].join('');
    }
    $("#table").bootstrapTable({
        url: '<%=basePath%>blog/pageQueryByUser.do',
        pagination: true,                    //是否显示分页条
//        strictSearch: true,
        showRefresh: true,                  //是否显示刷新按钮
        showToggle: true,                   //是否显示详细视图和列表视图
        clickToSelect: true,                //是否启用点击选中行
        minimumCountColumns: 2,           	//最少允许的列数 clickToSelect: true, //是否启用点击选中行
        pageSize: 5,                    	//每页的记录行数（*）
        pageList: [5, 25, 50, 100],     	//可供选择的每页的行数（*）
        //height: 500,   						//动态获取高度值，可以使表格自适应页面
        cache: false,                       // 不缓存
        striped: true,                      // 隔行加亮
        queryParamsType: "limit",           //设置为"undefined",可以获取pageNumber，pageSize，searchText，sortName，sortOrder
                                            //设置为"limit",符合 RESTFul 格式的参数,可以获取limit, offset, search, sort, order
        queryParams: queryParams,			//查询参数
        sidePagination: "server",       	//分页方式：client客户端分页，server服务端分页（*）
        paginationPreText: "上一页",
        paginationNextText: "下一页",
        paginationFirstText: "首页",
        paginationLastText: "末页",
        responseHandler: responseHandler,      //数据转换函数
        columns: [
          /*   {
                checkbox: true
            }, */
            {
                field: "blogId",
                title: "博客编号",
                align: "center",
                visible: false
            },
            {
                field: "blogTitle",
                title: "博客标题",
                align: "center"
            },
            {
                field: "createTime",
                title: "创建时间",
                align: "center"
            },
            {
                field: "updateTime",
                title: "最后修改时间",
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
    //监听下拉框改变事件
    $("#typeSelect").change(function(){
    	var param = {
   			 url: '<%=basePath%>blog/pageQueryByUser.do',
 		     silent: true,
 		     query:{
	 		    	userId:'${userInfo.userid}',
	 	            blogStatus: $("#typeSelect").val()  
 		        }
    	};
    	 console.log(param); 
    	 $("#table").bootstrapTable('refresh',param);
    });
});

function deletefunc(id){
	layer.confirm('确定要删除吗？', {
		btn : [ '是的', '不删了' ]
	//按钮
	}, function() {
		if(check()){
			var url = "${pageContext.request.contextPath}/blog/deleteBlog.do?blogId="+id;
			$.get(url,function(data){
				if(data.trim() == "ok" ){
					$("#table").bootstrapTable('refresh','');
				}else{
					alert("删除失败");
				}
			});
		}
	}, function() {
		
	});
	
}
</script>
	
</body>
</html>