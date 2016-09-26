<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>My JSP 'customer_orders.jsp' starting page</title>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/dateUtils.js"></script>
<style type="text/css">
body {
	font-family: Microsoft YaHei, Verdana, Arial, SimSun;
	margin: 0;
}

.head {
	position: absolute;
	top: 0;
	width: 100%;
	height: 80px;
	border-bottom: 2px solid #FFA500;
	height: 80px;
}

.logo {
	float: left;
}

.body {
	position: absolute;
	top: 80px;
	bottom: 0;
	width: 100%;
}

.back {
	margin: 30px 0 0 10px;
	float: left;
	color: #0085BD;
	font-weight: bold;
	cursor: pointer;
}

.back:hover {
	color: #40A3CD;
}

#orderList {
	padding: 10px;
}

.order {
	border: 1px solid #F1F1F1;
	border-left:none;
	border-spacing: 0px;
	width: 100%;
	text-align:left;
}

.order_header {
	background: #F1F1F1;
	line-height: 30px;
	width: 100%;
	font-size: 18px;
}

.order_body {
	line-height: 50px;
}

th, td{
	padding: 5px;
	border-left: 1px solid #F1F1F1;
}

.orderNumber{
	margin-left: 15px;
	color: #3C3C3C;
}
</style>
</head>

<body>
	<div class="head">
		<div>
			<img class="logo" src="images/logo1.png" /> 
			<a class="back" onclick="parent.backToIndex()">返回首页</a>
		</div>
	</div>
	<div class="body">
		<div id="orderList">
			<!-- <table class="order">
				<tbody>
					<tr class="order_header">
						<th  colspan="5">
							<span>2016-9-17</span> 
							<span class="orderNumber">订单号：<span>1241253246</span></span>
						</th>
					</tr>
					<tr class="order_body">
						<td width="40%">好基友派</td>
						<td width="10%">￥21.0</td>
						<td width="10%">4</td>
						<td width="20%">￥84.0</td>
						<td width="20%">交易成功</td>
					</tr>
				</tbody>
			</table> -->
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type : "post",
			url : "<%=basePath%>order/orderList",
			async : false,
			dataType : "json",
			data : {
				"userid" : "${SESSION_CUST.custid}",
			},
			success : function(data) {
				if (data.status) {	
					var orderlist = $("#orderList");
					var list = data.result.list;
	  				for(var i = 0 ; i < list.length ; i++){
	  					var order = list[i];
	  					var o =  document.createElement('table');
	  					var time = DateUtils.parse(order.ordertime);
	  					time = DateUtils.format(time,'yyyy-MM-dd');
	  					o.innerHTML="<tbody><tr class=\"order_header\"><th  colspan=\"5\"><span>"+time+"</span><span class=\"orderNumber\">订单号：<span>"+order.orderno+"</span></span></th></tr><tr class=\"order_body\"><td width=\"40%\">"+order.gname+"</td><td width=\"10%\">"+order.price+"</td><td width=\"10%\">"+order.ordercount+"</td><td width=\"20%\">"+order.totalprice+"</td><td width=\"20%\">"+order.status+"</td></tr></tbody>";
	  					o.className="order";
	  					orderlist.prepend(o);
	  				}
				}
				else {
					layer.msg(data.msg, {icon : 2});
				}
			},
			error : function(data) {
				layer.msg("访问异常，请稍后重试！", {
					icon : 2
				});
			}
		});	
	});
</script>
</html>
