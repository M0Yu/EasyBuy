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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<title>My JSP 'newAdmin.jsp' starting page</title>


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

td span {
	color: red;
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
					<td width="15%"><p>管理员名称：</p></td>
					<td><input id="username" type="text" placeholder="请输入用户名" />
						<span>*<span></td>
				</tr>
				<tr>
					<td><p>密码:</p></td>
					<td><input id="password" type="password" placeholder="请输入新密码" />
						<span>*<span></td>
				</tr>
				<tr>
					<td><p>重复密码:</p></td>
					<td><input id="rpassword" type="password"
						placeholder="请输入重复密码" /> <span>*<span></td>
				</tr>
				<tr>
					<td><p>电话:</p></td>
					<td><input id="phone" type="text" placeholder="请输入电话号码" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="注册"
						class="subButton" onclick="register();" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	function trim(str) {
		return str.replace(/(^\s+)|(\s+$)/g, "");
	}

	function checkPhone(phone) {
		var b = true;
		if(phone != ""){
			var pattern = /^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
			if (!pattern.test(phone)) {
				b = false;
			}
		}
		return b;
	}
	
	function register(){
		var username = trim($("#username").val());
		var password = trim($("#password").val());
		var rpassword = trim($("#rpassword").val());
		var phone = trim($("#phone").val());
		
		if(!checkPhone(phone)){
			layer.msg("输入的电话号码不符合规范!", {icon : 2});
		} else if(password == "" || username == ""){
			layer.msg("用户名和密码不能为空!", {icon : 2});
		} else if(password != rpassword){
			layer.msg("两次输入的密码不一致，请检查!", {icon : 2});
		} else {
			$.ajax({
				type : "post",
				url : "<%=basePath%>system/admin_register",
				async : false,
				dataType : "json",
				data : {
					"username" : username,
					"password" : password,
					"phone" : phone,
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
