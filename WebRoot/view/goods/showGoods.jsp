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

<title>My JSP 'showGoods.jsp' starting page</title>
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
	width: 100%;
}

.searchBar {
	margin: 20px 0 0 400px;
	float: left;
}

.searchBar input {
	height: 30px;
	font-size: 20px;
}

.searchBar .searchFiled {
	width: 400px;
	border: 2px solid #FFA500;
	padding: 5px;
}

.searchBar .button {
	background-color: #FFA500;
	border: none;
	color: white;
	padding: 0 10px 0 10px;
	cursor: pointer;
}

.typeBar {
	width: 100%;
	font-size: 14px;
	border-bottom: 2px solid #FFA500;
}

.typeBar td a {
	font-weight: bold;
	text-align: center;
	padding: 2px 10px 2px 10px;
	cursor: pointer;
}

.typeBar td a:hover {
	color: #0085BD;
}

.goods {
	padding: 5px;
}

.good {
	float:left;
	width: 24%;
	height: 20%;
	margin: 4px;
	border: 1px solid #EFF0F3;
	cursor: pointer;
}

.good:hover {
	border: 1px solid #a3d7ff;
}

.good img{
	width: 100%;
	height: 180px;
}

.goodinfo{
}

.goodinfo table {
	width: 100%;
	text-align: center;
}

.goodinfo .price{
	color: red;
}
</style>
</head>

<body>
	<div class="head">
		<div>
			<img class="logo" src="images/logo1.png" />
			<table class="searchBar">
				<tr>
					<td><input class="button" type="button" value="搜宝贝" /></td>
					<td><input class="searchFiled" type="text" /></td>
					<td><input class="button" type="button" value="易购搜索" /></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="body">
		<div class="typeBar" >
			<table>
				<tr id="typeBar">
					<td><a>全部分类</a></td>
				</tr>
			</table>
		</div>
		<div class="goods" id="goods">
			<!-- <div class="good">
				<img src="images/login/bilibili.jpg"/>
				<div class="goodinfo">
					<table>
						<tr>
							<td colspan="2"><span>商品名称</span></td>
						</tr>
						<tr>
							<td class="price">￥<span>1999<span></td>
							<td>库存：<span>100</span></td>
						</tr>
					</table>
				</div>
			</div> -->
		</div>
	</div>
</body>
<script type="text/javascript">
	var goods = null;
	$(document).ready(function(){
		//查询商品
		$.ajax({
			type : "post",
			url : "<%=basePath%>goods/search",
			async : true,
			dataType : "json",
			success : function(data) {
				if (data.status) {
					var goods = $("#goods");
					for(var i = 0 ; i< data.result.length ; i++){
						var good = document.createElement('div');
						var info = data.result[i];
						good.innerHTML = "<div class=\"good\" onclick='parent.checkGoodInfo(this);'><img src=\"images/login/bilibili.jpg\"/><div class=\"goodinfo\"><table><tr><td colspan=\"2\"><span>"+info.gname+"</span><input type='hidden' value='"+info.gid+"'/></td></tr><tr><td class=\"price\">￥<span>"+info.price+"<span></td><td>库存：<span>"+info.total+"</span></td></tr></table></div></div>"
						goods.append(good);
					}		
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
		
		//查询分类
		$.ajax({
			type : "post",
			url : "<%=basePath%>category/selectList",
			async : true,
			dataType : "json",
			success : function(data) {
	  			if (data.status) {
	  				var typeBar = $("#typeBar");
	  				for(var i = 0 ; i < data.result.length ; i++){
	  					var type = data.result[i];
	  					var t =  document.createElement('td');
	  					t.innerHTML = "<a>"+type.cname+"</a>";
	  					typeBar.append(t);
	  				}
	  			} else {
	  				layer.msg(data.msg, {icon : 2});
	  			}
			},
			error : function(data) {
				layer.msg("访问异常，请稍后重试！", {icon : 2});
			}
		});	
	});
	
</script>
</html>
