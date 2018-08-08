<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet" >
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <base target="_self">
</head>
<body >
<jsp:include page="nav.jsp"></jsp:include>
<div class="middle-box text-center animated fadeInDown" >
    <h1>404</h1>
    <h3 > 页面未能够找到！! !</h3>
    <div >
        抱歉，网页好像跑到火星去了！
        <form class="form-inline m-t" role="form">
            <div class="form-group">
                <input type="email"  class="form-control" placeholder="请输入你需要查找的内容..." />
            </div>
            <button type="submit" class=" btn btn-primary">搜索</button>
        </form>
    </div>
</div>

<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>