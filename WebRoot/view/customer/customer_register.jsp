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

<title>Easybug购物商城用户注册</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/style.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>
<style type="text/css">
body {
	background: white;
	overflow: visible;
}

.reg_head {
	margin-left: 50px;
	height: 80px;
	width: 92%;
	border-bottom: 1px solid #c0c0c0;
	font-size: 30px;
	color: #8a2be2;
}

.hd_pic {
	float: left;
}

.hd_left {
	float: left;
	padding-top: 20px;
	padding-left: 10px;
}

.hd_right {
	float: right;
	padding-top: 20px;
	font-size: 16px;
	color: #c0c0c0;
}

.hd_right a {
	text-decoration: none;
}

.hd_right a:hover {
	color: red
}

.reg_left {
	float: left;
	margin: 20px 10px 10px 50px;
	width: 45%;
	border: 1px solid #c0c0c0;
}

.reg_right {
	float: left;
	width: 45%;
	margin: 20px 50px 10px 10px;
}

.reg_form {
	margin-left: 10%;
}

.reg_form input,select {
	height: 30px;
	width: 300px;
	padding: 5px;
}

table {
	margin-top: 10px;
	border-spacing: 12px;
}

tr {
	border: 1px solid #c0c0c0;
}

a:hover {
	color: blue
}

.subButton {
	width: 400px;
	color: white;
	background-color: red;
	margin-top: 20px;
	border: 0px;
	font-size: 14px;
}

.subButton:hover {
	background-color: orange;
}

.subButton:disabled {
	background-color: gray;
}
</style>

</head>

<body>
	<div class="reg_head">
		<div class="hd_pic">
			<img src="images/logo1.png">
		</div>
		<div class="hd_left">|欢迎注册</div>
		<div class="hd_right">
			已有账号, <a href="system/login">请登录</a>
		</div>
	</div>

	<div class="reg_left">
		<form class="reg_form">
			<table>
				<tr>
					<td><span>用户名：</span></td>
					<td><input id="custname" type="text" placeholder="您的账号或登录名" /></td>
				</tr>
				<tr>
					<td><span>密码:</span></td>
					<td><input id="password" type="password" placeholder="您的密码" /></td>
				</tr>
				<tr>
					<td><span>确认密码:</span></td>
					<td><input id="repassword" type="password" placeholder="请确认密码"></td>
				</tr>
				<tr>
					<td><span>性别:</span></td>
					<td><select id="sex" name="sex">
							<option value="男" selected>男</option>
							<option value="女">女</option>
					</select></td>
				</tr>
				<tr>
					<td><span>生日:</span></td>
					<td><input id="birthday" type="date" placeholder="您的生日"></td>
				</tr>
				<tr>
					<td><span>手机号:</span></td>
					<td><input id="phone" type="text" placeholder="您的手机号"></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><input id="check" type="checkbox" name="check"
						style="width:15px;height: 15px" onchange="enableButton();">我已阅读并同意<a
						href="">《MyEasyBuy用户注册协议》</a></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><input class="subButton" type="button"
						value="立即注册" disabled="true" onclick="register();" /></td>
				</tr>

			</table>
	</div>

	<div class="reg_right">
		<img src="images/login/bilibili.jpg" style="width: 100%;">
	</div>

</body>
<script type="text/javascript">
	function enableButton() {
		if ($("#check").is(":checked")) {
			$(":button").attr('disabled', false);
		} else {
			$(":button").attr('disabled', true);
		}
	}
	
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

	function register() {
		var custname = trim($("#custname").val());
		var password = trim($("#password").val());
		var repassword = trim($("#repassword").val());
		var sex = $("#sex").val();
		var birthday = document.getElementById("birthday").valueAsDate;
		var phone = trim($("#phone").val());
		
		
		if(password == "" || custname == ""){
			layer.msg("用户名和密码不能为空!", {icon : 2});	
		} else if(!checkPhone(phone)){
			layer.msg("输入的电话号码不符合规范!", {icon : 2});
		} else if(password != repassword){
			layer.msg("两次输入的密码不一致，请检查!", {icon : 2});
		} else {
			$.ajax({
				type : "post",
				url : "<%=basePath%>customer/register",
				async : false,
				dataType : "json",
				data : {
					"custname" : custname,
					"password" : password,
					"sex" : sex,
					"birthday" : birthday,
					"phone" : phone,
				},
				success : function(data) {
					if (data.status) {
						layer.msg(data.msg, {
							time : 2000,
							icon : 1
						});
						setTimeout(function() {
							window.location = "system/index";
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
