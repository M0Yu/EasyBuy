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
<title>EasyBuy商城管理系统</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/style.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/menu.js"></script>
<style type="text/css">
iframe {
	width: 100%;
	height: 100%;
}
</style>

</head>
<body>
	<div class="top"></div>
	<div id="header">
		<div class="logo">
			EasyBuy购物商城
		</div>
		<div class="navigation">
			<ul>
				<li>欢迎您!</li>
				<li><span>${SESSION_ADMIN.username}<span></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="left_menu">
			<ul id="nav_dot">
				<li>
					<h4 class="M1">
						<span></span>商品管理
					</h4>
					<div class="list-item none">
						<a href='javascript:void(0)'>商品上架</a> 
						<a href='javascript:void(0)'>商品列表</a>
					</div>
				</li>
				<li>
					<h4 class="M2">
						<span></span>分类管理
					</h4>
					<div class="list-item none">
						<a href='javascript:void(0)'>分类添加</a> 
						<a href='javascript:void(0)'>分类列表</a>
					</div>
				</li>
				<li>
					<h4 class="M9">
						<span></span>订单管理
					</h4>
					<div class="list-item none">
						<a href='javascript:void(0)'>订单列表</a>
					</div>
				</li>
				<li>
					<h4 class="M10">
						<span></span>客户管理
					</h4>
					<div class="list-item none">
						<a href='javascript:void(0)'>客户列表</a> 
						<a href='javascript:void(0)'>权限设置</a>
					</div>
				</li>
				<li>
					<h4 class="M8">
						<span></span>系统设置
					</h4>
					<div class="list-item none">
						<a href='javascript:void(0)'>个人信息</a> 
						<a href='javascript:void(0)'>修改密码</a> 
						<a href='javascript:void(0)'>新增管理员</a> 
						<a href='javascript:void(0)'>管理员列表</a> 
						<a href='<%=basePath%>system/logout'>退出系统</a>
					</div>
				</li>

			</ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
				<ul>
					<li style="margin-left:25px;">您当前的位置：</li>
					<li><a href="">首页</a></li>
					<li>></li>
					<li><p id="curTab">最新公告</p></li>
				</ul>
			</div>
			<div class="main">
				<iframe frameborder="0" width="100%" height="80%"> </iframe>
			</div>
		</div>
	</div>
	<div id="footer"></div>
	<script>
		navList(5);
		$("#nav_dot a").each(function() {
			var tab = $(this).html();
			if(tab == '退出系统')
				return;
			$(this).click(function() {
				switch (tab) {
				case '商品上架':
					$('iframe').attr('src', 'view/goods/addGoods.jsp');
					break;
				case '商品列表':
					$('iframe').attr('src', 'view/goods/goodsList.jsp');
					break;
				case '分类添加':
					$('iframe').attr('src', 'view/category/addCategory.jsp');
					break;
				case '分类列表':
					$('iframe').attr('src', 'view/category/categoryList.jsp');
					break;
				case '订单列表':
					$('iframe').attr('src', 'view/goods/ordersList.jsp');
					break;
				case '客户列表':
					$('iframe').attr('src', 'view/customer/customerList.jsp');
					break;
				case '个人信息':
					$('iframe').attr('src', 'view/system/adminInfo.jsp');
					break;
				case '修改密码':
					$('iframe').attr('src', 'view/system/changePwd.jsp');
					break;
				case '新增管理员':
					$('iframe').attr('src', 'view/system/newAdmin.jsp');
					break;
				case '管理员列表':
					$('iframe').attr('src', 'view/system/adminList.jsp');
					break;
				}	
				$("#curTab").text(tab);
			})
		
		})
		
	</script>
</body>
</html>
