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

<title>My JSP 'ordersList.jsp' starting page</title>
<%@include file="/view/easyUI.jsp"%>
<style type="text/css">
.main {
	border: 1px solid #EFF0F3;
	border-radius: 2px;
	margin: 5px;
	background-color: white;
}
</style>
</head>

<body>
	<div class="main easyui-layout" region="center" fit="true">
		<table id="dg" class="easyui-datagrid" method="get" pagination="true"
			url="<%=basePath%>order/list" pageSize="10"
			data-options="emptyMsg:'没有查询到数据',border:true,fitColumns:true,singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'orderno',width:10" align="center">订单编号</th>
					<th data-options="field:'gname',width:10" align="center">商品名</th>
					<th data-options="field:'price',width:10" align="center">单价</th>
					<th data-options="field:'ordercount',width:10" align="center">订单数</th>
					<th data-options="field:'totalprice',width:10" align="center">订单总价</th>
					<th data-options="field:'status',width:10" align="center">订单状态</th>
					<th data-options="field:'action',width:10" align="center"
						formatter="listAction">操作</th>
				</tr>
			</thead>
		</table>

	</div>
</body>
<script type="text/javascript">
	function listAction(value, row, index) {
		var u = '<img src="images/list/update.png" /> ';
		var i = '<img src="images/list/info.png" /> ';
		var d = '<img src="images/list/delete.png" /> ';
		return '<div>' + u + i + d + '</div>';
	}
</script>
</html>
