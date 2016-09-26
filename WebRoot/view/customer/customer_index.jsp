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

<title>EasyBuy购物商城</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<style type="text/css">
.head {
	position: absolute;
	top: 0;
	width: 100%;
	height: 40px;
	background-color: #FFA500;
}

.body {
	position: absolute;
	top: 40px;
	width: 100%;
	bottom: 40px;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 40px;
	background-color: #FFA500;
}

iframe {
	background-color: #fff;
	width: 100%;
	height: 100%;
	border: none;
}

.navigation li a{
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="head">
		<div class="navigation">
			<ul>
				<li>欢迎您!&nbsp;<a href="customer/setting">${SESSION_CUST.custname}<a></li>
				<li><a>我的订单</a></li>
				<li><a>购物车</a></li>
			</ul>
		</div>
	</div>
	<div class="body">
		<iframe src="view/goods/showGoods.jsp"></iframe>
	</div>
	<div class="footer"></div>
</body>
<script type="text/javascript">
	$(".navigation li").click(function(){
		var text = $(this).text();
		switch(text){
		case '购物车':
			$("iframe").attr('src', 'customer/shopingCart');
			break;
		case '我的订单':
			$("iframe").attr('src', 'customer/orders');
			break;
		}	
	})

	function backToIndex(){
		$("iframe").attr('src', 'view/goods/showGoods.jsp');	
	}	
	
	
	function checkGoodInfo(div){	
		var gid = $(div).find("input:hidden").val();
		$.ajax({
			type : "post",
			url : "<%=basePath%>goods/goodInfo",
				async : true,
				dataType : "json",
				data : {
					"gid" : gid,
				},
				success : function(data) {
					if (data.status) {
						$("iframe").attr('src', 'view/goods/goodInfo.jsp');
					} else {
						layer.msg(data.msg, {
							icon : 2
						});
					}
				},
				error : function(data) {
					layer.msg("访问异常，请稍后重试！", {
						icon : 2
					});
				}
			});
		}
</script>

</html>
