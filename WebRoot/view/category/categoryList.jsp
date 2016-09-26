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
<%@include file="/view/easyUI.jsp"%>
<title>My JSP 'categoryList.jsp' starting page</title>

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
			url="<%=basePath%>category/list" pageSize="10"
			data-options="emptyMsg:'没有查询到数据',border:true,fitColumns:true,checkOnSelect:false,singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'cid',width:5" align="center">编号</th>
					<th data-options="field:'cname',width:10" align="center">名称</th>
					<th data-options="field:'summary',width:20" align="center">描述</th>
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
