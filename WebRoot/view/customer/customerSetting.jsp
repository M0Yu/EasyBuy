<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户中心</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<style type="text/css">
.head {
	position: absolute;
	top: 0;
	width: 100%;
	height: 80px;
	background-color: #E45050;
}

.body {
	position: absolute;
	top: 80px;
	width: 100%;
	bottom: 20px;
	/* 	background-color: #F5F5F5; */
}

.left {
	float: left;
	width: 20%;
	height: 100%;
	text-align: center;
	padding: 5px 0 5px 5px;
}

.content {
	float: left;
	width: 70%;
	height: 100%;
}

.content iframe {
	width: 100%;
	height: 100%;
	border: none;
}

.left li {
	padding: 8px;
	cursor: pointer;
}

.checked {
	background-color: #fff;
}

.left li:hover {
	background-color: #fff;
}

.menu_title {
	margin: 8px;
	color: #000;
	font-weight: bold;
	font-size: 20px;
}
</style>
</head>

<body>
	<div class="head">
		<div class="logo">
			<img class="logo" src="images/logo1.png" /> 我的EasyBuy
		</div>
	</div>
	<div class="body">
		<div class="left">
			<p class="menu_title">设置</p>
			<ul>
				<li class="checked"><a>个人信息</a></li>
				<li><a>收货地址</a></li>
				<!-- <li><a>消费记录</a></li> -->
				<li><a>返回首页</a></li>
				<li><a>退出</a></li>
			</ul>
		</div>
		<div class="content">
			<iframe src="view/customer/customerInfo.jsp"> </iframe>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(".left li").click(function() {
		$(".left li").each(function() {
			if ($(this).hasClass("checked"))
				$(this).removeClass("checked");
		});
		$(this).addClass("checked");

		var a = $(this).text();
		switch (a) {
		case '个人信息':
			$('iframe').attr('src', 'view/customer/customerInfo.jsp');
			break;
		case '收货地址':
			$('iframe').attr('src', 'view/customer/customer_address.jsp');
			break;
		case '返回首页':
			window.location = 'system/index?type=cust';
			break;	
		case '退出':
			window.location = 'system/logout';
			break;
		}
	})
</script>
</html>
