<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'addCategory.jsp' starting page</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<style type="text/css">
body {
	text-align: center;
}

.main {
	border: 1px solid #EFF0F3;
	border-radius: 2px;
	margin: 5px;
	background-color: white;
}

form {
	width: 600px;
	margin: auto;
}

table {
	width: 100%;
	margin: 10px 0 10px 0;
}

table input,select {
	width: 450px;
	height: 26px;
	margin-left: 5px;
	padding: 4px;
}

.main p {
	float: right;
	font-size: 13px;
}

.main span {
	font-size: 12px;
}

.subButton {
	width: 200px;
	height: 30px;
	margin-top: 10px;
	border: 0px;
	border-radius: 20px;
	background-color: #FC5628;
	cursor:pointer;
	color: white;
}

.subButton:hover {
	background-color: orange;
}
</style>

</head>

<body>
	<div class="main">
		<form>
			<table cellpadding="2px">
				<tr>
					<td width="10%"><p>名称:</p></td>
					<td><input id="name" type="text" placeholder="请输入商品名称" /></td>
				</tr>
				<tr>
					<td><p>单价:</p></td>
					<td><input id="price" type="text" placeholder="请输入商品单价" /></td>
				</tr>
				<tr>
					<td><p>分类:</p></td>
					<td><select id="cid"></select></td>
				</tr>
				<tr>
					<td><p>折扣:</p></td>
					<td><input id="offset" type="range" max="100" min="1" step="1"
						value="100" onchange="offsetChange()" oninput="offsetChange()"/> <span id="rangeValue">100%<span></td>
				</tr>
				<tr>
					<td><p>库存:</p></td>
					<td><input id="total" type="number" value="1" min="1"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="添加" class="subButton"
				onclick="addGoods()" />
					</td>
				</tr>
			</table>
			
		</form>
	</div>
</body>
<script type="text/javascript">
	$(this).ready(function(){
		$.ajax({
			type : "post",
			url : "<%=basePath%>category/selectList",
			async : true,
			dataType : "json",
			success : function(data) {
	  			if (data.status) {
	  				var cid = $("#cid");
	  				for(var i = 0 ; i < data.result.length ; i++){
	  					var category = data.result[i];
	  					var opt = new Option(category.cname,category.cid);
	  					cid.append(opt);
	  				}
	  			} else {
	  				layer.msg(data.msg, {icon : 2});
	  			}
			},
			error : function(data) {
				layer.msg("访问异常，请稍后重试！", {icon : 2});
			}
		});
	})

	function offsetChange() {
		var offset = $("#offset").val();
		$("#rangeValue").text(offset + "%");
	}
	
	function addGoods(){
		var name = $("#name").val();
		var price = $("#price").val();
		price = parseFloat(price).toFixed(2);
		var cid = $("#cid").val();
		var offset = $("#offset").val();
		offset = (parseFloat(offset)/100).toFixed(2);
		var total = $("#total").val();
		
		$.ajax({
			type:"post",
			url:"<%=basePath%>goods/addGoods",
			async : false,
			dataType : "json",
			data : {
				"gname" : name,
				"price" : price,
				"offset" : offset,
				"total" : total,
				"cid" : cid,
			},
			success : function(data) {
				if (data.status) {
					layer.msg(data.msg, {time : 2000,icon : 1});
	  				setTimeout(function(){
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
	}
</script>
</html>
