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
<title>My JSP 'goodInfo.jsp' starting page</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<style type="text/css">
body {
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

.body {
	position: absolute;
	top: 80px;
	width: 100%;
}

.goodsPic {
	float: left;
	width: 30%;
	height: 85%;
	margin: 5px;
}

.detail {
	float: left;
	margin: 50px 0 0 100px;
}

.detail .price {
	color: red;
	font-size: 20px;
}

.detail table {
	width: 100%;
}

.detail table tr {
	padding: 2px 10px 2px 10px;
	line-height: 40px;
}

.detail .button {
	background-color: #FFA500;
	border: none;
	color: white;
	height: 30px;
	width: 100px;
	font-weight: bold;
	padding: 0 10px 0 10px;
	cursor: pointer;
}

.detail .button: hover {
	
}

.purchase {
	float: left;
	width: 30px;
	height: 30px;
	margin: 5px;
	cursor: pointer;
}

.amount {
	float: left;
	width: 60px;
	height: 30px;
	margin: 5px;
	padding: 5px;
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
		<div>
			<img class="goodsPic" src="images/deemo.jpg" />

			<div class="detail">
				<h1>${good.gname}</h1>
				<table>
					<tr>
						<td width="10%" align="right">价格：</td>
						<td class="price">￥<span>${good.price}</span></td>
					</tr>
					<tr>
						<td>库存：</td>
						<td><span>${good.total}</span></td>
					</tr>
					<tr>
						<td>购买：</td>
						<td><img class="purchase" onclick="amountDown();"
							src="images/jian.png" /> <input id="amount" class="amount"
							type="number" value="1" min="1" max="${good.total}" /> <img
							class="purchase" onclick="amountUp();" src="images/jia.jpg" /></td>
					</tr>
					<tr>
						<td colspan="2"><input class="button" type="button"
							value="立即购买" /> <input class="button" type="button"
							value="加入购物车" onclick="addToCart();" /></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function amountUp(){
		var amount = parseInt($("#amount").val());
		if(amount >= '${good.total}')
			return;
		else
			$("#amount").val(amount+1);
	}	
	
	function amountDown(){
		var amount = parseInt($("#amount").val());
		if(amount == 1)
			return;
		else
			$("#amount").val(amount-1);
	}
	
	function addToCart(){
		var amount = parseInt($("#amount").val());
		$.ajax({
			type : "post",
			url : "<%=basePath%>order/addToCart",
			async : true,
			dataType : "json",
			data : {
				"ordercount":amount,
				"userid":"${SESSION_CUST.custid}",
				"gid" : "${good.gid}",
				"totalprice" : amount * parseFloat("${good.price}"),
			},
			success : function(data) {
	  			if (data.status) {
	  				layer.msg(data.msg, {
						time : 2000,
						icon : 1
					});
					setTimeout(function() {
						location.reload();
					}, 2500);		
	  			} else {
	  				layer.msg(data.msg, {icon : 2});
	  			}
			},
			error : function(data) {
				layer.msg("访问异常，请稍后重试！", {icon : 2});
			}
		});
	}
</script>
</html>
