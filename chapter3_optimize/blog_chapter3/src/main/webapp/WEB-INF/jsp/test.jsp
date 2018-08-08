<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
<title>Ajax异步上传图片</title>  
<-- 引入jQuery异步上传js文件 -->  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.js" type="text/javascript"></script>  
  
<!-- Ajax异步上传图片 -->  
<script type="text/javascript">  
    function uploadPic() {  
    	alert("asd");
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
                    // 图片显示地址  
                    $("#allUrl").attr("src", "${pageContext.request.contextPath}/" + data.path);  
                }  
        };  
          
        $("#jvForm").ajaxSubmit(options);  
    }  
</script>  
</head>  
<body>  
    <form id="jvForm" action="o_save.shtml" method="post" enctype="multipart/form-data">  
                        <img width="100" height="100" id="allUrl"/>  
                        <!-- 在选择图片的时候添加事件，触发Ajax异步上传 -->  
                        <input name="file" type="file" onchange="uploadPic()"/>  
    </form>  
</body>  
</html>  