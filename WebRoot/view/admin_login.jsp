<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EasyBuy购物商城</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<style type="text/css">
html {
	font-family: 'Microsoft YaHei', 'SimHei', serif;
	font-size: 12px;
	background: #fff url(images/login/bg.jpg) repeat-x top;
	overflow: hidden;
	margin: 0px;
	padding: 0px;
}

.logo {
	padding-left: 60px;
	width: 500px;
	position: relative;
	background: url(images/logo.png) no-repeat;
	top: 26px;
	left: 30px;
	height: 59px;
}

.logo span {
	font-size: 22px;
	color: #1777b1;
	line-height: 40px;
}

.login_main {
	background: url(images/login/login_bg.png) no-repeat top;
	width: 985px;
	height: 514px;
	margin-left: -493px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-top: -257px;
}

.login_img {
	width: 537px;
	height: 363px;
	background: url(images/login/bilibili.jpg) center no-repeat;
	background-size: cover;
	position: relative;
	top: 38px;
	left: 41px;
}

.login_form {
	position: relative;
	left: 620px;
	width: 325px;
	height: 354px;
	top: -324px;
	background: url(images/login/from_bg.jpg) no-repeat top;
}

.login_dl {
	font-size: 14px;
	color: #000;
	width: 85px;
	height: 55px;
	line-height: 55px;
	padding-right: 5px;
}

.login_input {
	height: 31px;
	width: 185px;
	text-indent: 3px;
	padding-left: 22px;
	border: 1px solid #d2dbe3;
	box-shadow: inset 0 3px 3px rgba(0, 0, 0, 0.1), 0 1px 0
		rgba(255, 255, 255, 0.2);
}

.login_jzmm {
	height: 24px;
	line-height: 24px;
	color: #000;
}

.login_btnbg {
	height: 36px;
	width: 118px;
	border: 0px;
	cursor: pointer;
	background: url(images/login/login_but1.png) no-repeat;
	color: #fff;
	font-size: 18px;
	margin-top: 20px;
}

.login_btnbg:hover {
	background: url(images/login/login_but2.png) no-repeat;
}

.username_bg {
	background: url(images/login/username_bg.png) no-repeat 5px center;
	background-color: #fff;
}

.password_bg {
	background: url(images/login/password_bg.png) no-repeat 5px center;
	background-color: #fff;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#username").focus();
	});

	function login() {
		var name = trim(document.getElementById("username").value);
		var password = trim(document.getElementById("password").value);
		if (name == "") {
			layer.msg('请输入用户名', {
				icon : 2,
				time : 5000
			});
		} else if (password == "") {
			layer.msg('请输入密码', {
				icon : 2,
				time : 5000
			});
		} else {
			document.getElementById("form").submit();
		}
	}

	function checkedUname_len() {
		var username = trim(document.getElementById("username").value);
		if (username.length > 50) {
			layer.msg('用户名不能超过50位', {
				icon : 2,
				time : 5000
			});
		}
	}
	function checkedPwd_len() {
		var password = trim(document.getElementById("password").value);
		if (password.length > 50) {
			layer.msg('密码长度不能超过50位', {
				icon : 2,
				time : 5000
			});
		}
	}

	function trim(str) {
		return str.replace(/(^\s+)|(\s+$)/g, "");
	}

	function toggleText() {
		 $("#register_text").toggle();
	}
</script>
</head>
<body>
	<div class="login_main">
		<div class="logo">
			<span>Easybuy购物商城</span>
		</div>
		<div class="login_img"></div>
		<div class="login_form">
			<form id="form" action="<%=basePath%>system/checkLogin" method="post">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="position: relative; top: 50px;">
					<tr>
						<td align="right" class="login_dl">登陆类型：</td>
						<td colspan="3">
							<input type="radio" name="type" value="admin" onchange="toggleText();" checked>管理员</input> 
							<input type="radio" name="type" value="cust" onchange="toggleText();">用户</input>
						</td>
					</tr>
					<tr>
						<td align="right" class="login_dl">用户名：</td>
						<td colspan="3"><input id="username" name="username"
							type="text" class="login_input username_bg" maxlength="50" /></td>
					</tr>
					<tr>
						<td align="right" class="login_dl">密 码：</td>
						<td colspan="3"><input id="password" name="password"
							type="password" onkeyup="if(event.keyCode==13){login();}"
							class="login_input password_bg" maxlength="50" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="left" height="26" colspan="3"><span id="errorMsg"
							style="color: red;">${errMsg}</span></td>
					</tr>
					<tr style="text-align: center;">
						<td colspan="4"><input type="button" class="login_btnbg"
							onclick="login();" /></td>
					</tr>
					<tr style="text-align: center;display: none;" id="register_text">
						<td colspan="4"><p>
								没有账户？<a href="<%=basePath%>system/customer_register">点击注册</a>
							</p></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>