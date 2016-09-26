<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>My JSP 'customerInfo.jsp' starting page</title>

<style type="text/css">
body {
	text-align: center;
	margin: 0;
}

.main {
	border: 1px solid #EFF0F3;
	border-radius: 2px;
	margin: 5px;
	background-color: white;
	height: 95%;
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
	width: 400px;
	height: 26px;
	margin-left: 5px;
	padding: 4px;
}

td span {
	color: #BFBCA8;
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

#toggle {
	cursor: pointer;
}
</style>

</head>

<body>
	<div class="main">
		<form>
			<table cellpadding="2px">
				<tr>
					<td width="15%"><p>用户名：</p></td>
					<td><input id="username" type="text" disabled="true" value="${SESSION_CUST.custname}"/></td>
				</tr>
				<tr>
					<td><p>密码:</p></td>
					<td><input id="password" type="password" disabled="true" value="${SESSION_CUST.password}" />
						<span id="toggle" onclick="javascript:void(0);">显示</span></td>
				</tr>
				<tr>
					<td><p>性别:</p></td>
					<td><input id="sex" type="text" disabled="true" value="${SESSION_CUST.sex}" />
				</tr>
				<tr>
					<td><p>生日:</p></td>
					<td><input id="birthday" type="date" disabled="true" value="<fmt:formatDate value='${SESSION_CUST.birthday}' pattern="yyyy-MM-dd"/>" />
				</tr>
				<tr>
					<td><p>电话:</p></td>
					<td><input id="phone" type="text" disabled="true" value="${SESSION_CUST.phone}" />
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	$("#toggle").click(function(){
		var toggle = $("#toggle");
		if(toggle.text() == "显示"){
			toggle.text("隐藏");
			$("#password").attr('type','text');
		} else {
			toggle.text("显示");
			$("#password").attr('type','password');
		}		
	});
	
	$("#edit").click(function(){
		var edit = $("#edit");
		if(edit.text() == "修改"){
			edit.text("保存");
			$("#phone").attr('disabled',false);
			$("#phone").focus();
		} else {
			save();
			
			edit.text("修改");
			$("#phone").attr('disabled',true);
		}		
	});
	
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
	
	function save(){
		var phone = $("#phone").val();
		if(!checkPhone(phone)){
			layer.msg("输入的电话号码不符合规范!", {icon : 2});
		} else {
			$.ajax({
				type : "post",
				url : "<%=basePath%>system/admin_editInfo",
				async : false,
				dataType : "json",
				data : {
					"aid" : "${SESSION_ADMIN.aid}",
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