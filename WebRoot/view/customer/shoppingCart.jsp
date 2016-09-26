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

<title>My JSP 'shoppingCart.jsp' starting page</title>

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

.body {
	position: absolute;
	top: 80px;
	bottom: 40px;
	width: 100%;
}

.footer {
	position: absolute;
	height: 40px;
	bottom: 0;
	width: 100%;
	background-color: #D3D3D3;
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


table {
	width: 99%;
	margin: 5px;
	border: 1px solid #D3D3D3;
	text-align: center;
	border-spacing: 0;
}

table thead {
	background-color: #D3D3D3;
	line-height: 30px;
}

tbody tr {
	line-height: 80px;
}

.purchase {
	position: absolute;
	right: 0;
	border: none;
	background-color: #F73E1C;
	color: white;
	font-size: 18px;
	height: 100%;
	width: 100px;
	cursor: pointer;
}

.delete {
	position: absolute;
	left: 10px;
	top: 10px;
	cursor: pointer;
}

.count {
	position: absolute;
	top: 10px;
	right: 120px;
}

.count span {
	color: red;
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
		<table id="cartList">
			<thead>
				<tr>
					<th width="10%"><input type="checkbox" id="sltAll" />全选</th>
					<th width="50%">商品信息</th>
					<th width="10%">单价</th>
					<th width="10%">数量</th>
					<th width="20%">金额（元）</th>
				</tr>
			</thead>
<!-- 			<tbody>
			<tr>
				<th><input type="checkbox" name="checklist"/>
				<input type="hidden" value=""/></th>
				<th align="left">华为</th>
				<th><span>1000<span></th>
				<th><span>6<span></th>
				<th><span name="count">6000<span></th>
			</tr>
			</tbody> -->
		</table>
	</div>
	<div class="footer">
		<span class="delete">删除选中</span> <span class="count">合计：<span id="money">￥0</span></span>
		<input type="button" class="purchase" value="结算" onclick="balance();" />
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type : "post",
			url : "<%=basePath%>order/shoppingCart",
			async : true,
			dataType : "json",
			data : {
				"userid":"${SESSION_CUST.custid}",
			},
			success : function(data) {
	  			if (data.status) {
	  				var cartlist = $("#cartList");
	  				var list = data.result.list;
	  				for(var i = 0 ; i < list.length ; i++){
	  					var cart = list[i];
	  					var c =  document.createElement('tr');
	  					c.innerHTML = "<th><input type=\"checkbox\" name=\"checklist\"/><input type=\"hidden\" value=\""+cart.id+"\"/></th><th align=\"left\">"+cart.gname+"</th><th><span>"+cart.price+"<span></th><th><span>"+cart.ordercount+"<span></th><th><span name=\"count\">"+cart.totalprice+"<span></th>";
	  					cartlist.append(c);
	  				}
	  			} else {
	  				layer.msg(data.msg, {icon : 2});
	  			}
	  			
	  			//全选/全不选响应
	  			$("#sltAll").click(function(){
	  				$("input[name='checklist']").each(function(){
	  					$(this).prop("checked",!!$("#sltAll").prop("checked"));
	  				});
	  			});
	  			
	  			//每次更改选中时，重计算金额
	  			$("input:checkbox").click(function(){
	  				var money = 0;
	  				$("input[name='checklist']").each(function(){
	  					if(this.checked){
	  						var count = $(this).parent().parent().find("span[name='count']").text();
	  						money += parseInt(count);
	  					}	
	  				});
	  				$("#money").text('￥'+money);
	  			}); 
			},
			error : function(data) {
				layer.msg("访问异常，请稍后重试！", {icon : 2});
			}
		});	
	});

	var selectedAddrid = null;
	
	function balance(){
		var id = new Array();
		var length = 0;
		$("input[name='checklist']").each(function(){
			if(this.checked){
				id[length] = parseInt($(this).parent().parent().find("input:hidden").val());
				length++;
			}	
		});
		
		if(length == 0)
			layer.msg("请选择结算的商品!", {icon : 2});
		else {
			layer.open({
				type:2,
				title : '请选择收货地址',
				btn:['确定','取消'],
				yes:function(index, layero){
					if(selectedAddrid == null)
						layer.msg("请选择收货地址!", {icon : 2});
					else {
						$.ajax({
							type : "post",
							url : "<%=basePath%>order/balance",
							async : true,
							dataType : "json",
							traditional: true,
							data : {
								"ids" : id,
								"addrid" : selectedAddrid,
							},	
							success : function(data) {
					  			if (data.status) {
					  				layer.msg(data.msg, {
										time : 2000,
										icon : 1
									});
									setTimeout(function() {
										location.reload();
									}, 2500)
					  			} else {
					  				layer.msg(data.msg, {icon : 2});
					  			}
							},
							error : function(data) {
								layer.msg("访问异常，请稍后重试！", {icon : 2});
							}
						});	
						
						layer.close(index);
					}			
				},
				area:['600px','500px'],
				content:['view/customer/customer_address_layer.jsp','no'],
			});
		}
	}
	
</script>
</html>
