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
<title>My JSP 'addCategory.jsp' starting page</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<style type="text/css">
body {
	text-align: center;
}

.main {
	height: 60%;
	border: 1px solid #EFF0F3;
	border-radius: 2px;
	margin: 5px;
	background-color: white;
}

form {
	width: 500px;
	margin: auto;
	margin-top: 10px;
}

.subButton {
	width: 200px;
	height: 30px;
	margin-top: 30px;
	border: 0px;
	border-radius:20px;
	background-color: #FC5628;
	color: white;
}

.subButton:hover {
	background-color: orange;
}

td span{
	font-size: 13px;
}
</style>
</head>

<body>
	<div class="main">
		<form>
			<table>
				<tr>
					<td style="float:right;margin-top:8px;"><span>类别名：</span></td>
					<td width="80%"><input id="cname" type="text"
						placeholder="请输入分类名称" style="width:400px;height:30px;padding:5px;" /></td>
				</tr>
				<tr>
					<td style="float:right;margin-top:16px;"><span>描述：</span></td>
					<td><textarea id="summary" placeholder="请输入分类描述"
							style="width:400px;height:180px;margin-top:10px;padding:5px"></textarea>
					</td>
				</tr>
			</table>
			<input type="button" value="添加" class="subButton"
				onclick="addCategory()" />
		</form>
	</div>
</body>
<script type="text/javascript">
	function addCategory(){
		var name = $("#cname").val();
		var summary = $("#summary").val();
		$.ajax({
			type : "post",
			url : "<%=basePath%>category/addCategory",
			async : false,
			dataType : "json",
			data : {
				"cname" : name,
				"summary" : summary,
			},
			success : function(data) {
				/* var data = eval('(' + data + ')'); */
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
