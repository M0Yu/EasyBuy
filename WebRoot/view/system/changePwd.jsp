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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<title>My JSP 'changePwd.jsp' starting page</title>

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
					<td width="15%"><p>原始密码：</p></td>
					<td><input id="oldpwd" type="password" placeholder="请输入原始密码" /></td>
				</tr>
				<tr>
					<td><p>新密码:</p></td>
					<td><input id="newpwd" type="password" placeholder="请输入新密码" /></td>
				</tr>
				<tr>
					<td><p>重复密码:</p></td>
					<td><input id="rnewpwd" type="password" placeholder="请输入重复密码" /></td>
				</tr>	
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="确认修改" class="subButton" onclick="changePassword();" />
					</td>
				</tr>
			</table>		
		</form>
	</div>
</body>
<script type="text/javascript">
	function trim(str) {
		return str.replace(/(^\s+)|(\s+$)/g, "");
	}

	function changePassword(){
		var oldpwd = trim($("#oldpwd").val());
		var newpwd = trim($("#newpwd").val());
		var rnewpwd = trim($("#rnewpwd").val());
		if(newpwd == "" || oldpwd == ""){
			layer.msg("请输入有效的密码!", {icon : 2});
		}
		else if(newpwd != rnewpwd ){
			layer.msg("两次输入的密码不一致，请检查!", {icon : 2});
		} else {
			$.ajax({
				type : "post",
				url : "<%=basePath%>system/admin_changePwd",
				async : false,
				dataType : "json",
				data:{
					"oldPassword" : oldpwd,
					"newPassword" : newpwd,
				},
				success : function(data) {
					if (data.status) {
						layer.msg(data.msg, {time : 2000,icon : 1});
		  				setTimeout(function(){
		  					location.reload();
		  				}, 2500) 
					} else {
						layer.msg(data.msg, {icon:2});
					}
				},
				error : function(data) {
					layer.msg("访问异常，请稍后重试！", {icon:2});
				}
			});
		}
	}
</script>
</html>
