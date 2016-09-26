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

<title>My JSP 'customerList.jsp' starting page</title>
<%@include file="/view/easyUI.jsp"%>
<script type="text/javascript" src="js/dateUtils.js"></script>
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
			url="<%=basePath%>customer/list" pageSize="10"
			data-options="emptyMsg:'没有查询到数据',border:true,fitColumns:true,singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'custid',width:10" align="center">编号</th>
					<th data-options="field:'custname',width:10" align="center">客户名称</th>
					<th data-options="field:'sex',width:10" align="center">性别</th>
					<th data-options="field:'birthday',width:10" align="center"
						formatter="birthday">生日</th>
					<th data-options="field:'phone',width:10" align="center">电话</th>
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
	function birthday(value, row, index) {
		var time = DateUtils.parse(value);
		time = DateUtils.format(time, 'yyyy-MM-dd');
		return time;
	}
</script>
</html>
