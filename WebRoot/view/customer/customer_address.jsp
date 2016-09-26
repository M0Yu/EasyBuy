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

<title>My JSP 'customer_address.jsp' starting page</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<style type="text/css">
.main {
	border: 1px solid #EFF0F3;
	border-radius: 2px;
	margin: 5px;
	background-color: white;
	height: 95%;
}

.head input {
	float: left;
	margin: 20px 5px 0 20px;
	width: 120px;
	height: 30px;
	font-weight: bold;
	font-size: 16px;
	background: #EFF0F3;
	border: 1px solid #847C7D;
}

.head p {
	float: left;
	line-height: 40px;
	padding: 5px;
	margin-top: 10px;
}

.clear {
	clear: both;
	height: 0;
	line-height: 0;
	font-size: 0
}

.address {
	position: relative;
	margin: 5px 10px 10px 10px;
	border: 1px solid #EFF0F3;
	padding: 5px;
	border-radius: 5px;
}

tr {
	line-height: 30px;
	padding: 5px;
	font-size: 14px;
}

tr td:first-child {
	text-align: right;
}

td input {
	padding: 5px;
}

.delete {
	position: absolute;
	top: 5px;
	right: 5px;
	cursor: pointer;
}

.add {
	position: absolute;
	top: 5px;
	right: 30px;
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="main">
		<div class="head">
			<input id="new" type="button" value="新增收货地址" onclick="newAddress()" />
			<p>
				您已创建<span id="length">0</span>个收货地址，最多可创建20个
			</p>
			<div class="clear"></div>
		</div>
		<div id="list"></div>
	</div>
</body>
<script type="text/javascript">
	 $(document).ready(function(){
		$.ajax({
			type : "post",
			url : "<%=basePath%>address/searchAddress",
			async : false,
			dataType : "json",
			data : {
				"usrid" : "${SESSION_CUST.custid}",
			},
			success : function(data) {
				if (data.status) {	
					$("#length").text(data.result.length);
					for(var i = 0 ; i < data.result.length ; i++){
						var address = data.result[i];
						var field = document.createElement("div");
						field.innerHTML = "<div class=\"address\"><h1>"+address.receiveuser+"</h1><input type=\"hidden\" value=\""+address.adrrid+"\"/><table><tr><td width=\"20%\">收件人：</td><td><span>"+address.receiveuser+"</span></td></tr><tr><td>所在地区：</td><td><span>"+address.province+address.city+"</span></td></tr><tr><td>地址：</td><td><span>"+address.area+address.street+"</span></td></tr><tr><td>手机号：</td><td><span>"+address.phone+"</span></td></tr></table><img class=\"delete\" src=\"images/delete_16px.png\" onclick=\"deleteAddress(this);\"/></div>";
						$("#list").prepend(field);
					}
				}
				else {
					$("#length").text(0);
					layer.msg(data.msg, {icon : 2});
				}
			},
			error : function(data) {
				layer.msg("访问异常，请稍后重试！", {
					icon : 2
				});
			}
		});	
	}) 

	function newAddress(){
		var editField = document.createElement("div");
		editField.innerHTML = "<div class=\"address\"><table><tr><td width=\"20%\">收件人：</td><td><input id=\"receiver\" type=\"text\" placeholder=\"请输入收件人名称\"/></td></tr><tr><td>省份：</td><td><input id=\"province\" type=\"text\" placeholder=\"请输入所在省份\"/></td></tr><tr><td>城市：</td><td><input id=\"city\" type=\"text\" placeholder=\"请输入所在城市\"/></td></tr><tr><td>街区：</td><td><input id=\"area\" type=\"text\" placeholder=\"请输入所在街区\"/></td></tr><tr><td>详细地址：</td><td><input id=\"street\" type=\"text\" placeholder=\"请输入详细地址\"/></td></tr><tr><td>手机号：</td><td><input id=\"phone\" type=\"text\" placeholder=\"请输入手机号\"/></td></tr></table><img class=\"add\" src=\"images/plus_16px.png\" onclick=\"saveAddress();\"/><img class=\"delete\" src=\"images/delete_16px.png\" onclick=\"removeAddress(this)\"/></div>";		
		$("#list").prepend(editField);
		
		$("#new").attr('disabled',true);
	}
	 
	function removeAddress(img){
		$(img).parent().parent().remove();
		$("#new").attr('disabled',false);
	}
	 
	 
	 function deleteAddress(img){
		 var adrrid = $(img).parent().find("input:hidden").val();
		 $.ajax({
				type : "post",
				url : "<%=basePath%>address/deleteAddress",
				async : false,
				dataType : "json",
				data : {
					"adrrid" : adrrid,
					"usrid" : "${SESSION_CUST.custid}",
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
	 
	 function saveAddress(){
		var receiver = $("#receiver").val();
		var province = $("#province").val();
		var city = $("#city").val();
		var area = $("#area").val();
		var street = $("#street").val();
		var phone = $("#phone").val();
		
		if(receiver == null){
			layer.msg("收件人不能为空！", {icon : 2});
		} else if(phone == null){
			layer.msg("手机号不能为空！", {icon : 2});
		} else {	
			$.ajax({
				type : "post",
				url : "<%=basePath%>address/newAddress",
				async : false,
				dataType : "json",
				data : {
					"receiveuser" : receiver,
					"province" : province,
					"city" : city,
					"area" : area,
					"street" : street,
					"phone" : phone,
					"usrid" : "${SESSION_CUST.custid}",
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
	}
</script>
</html>
