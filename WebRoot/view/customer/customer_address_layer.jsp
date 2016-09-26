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

<title>My JSP 'customer_address.jsp' starting page</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<style type="text/css">
.main {
	position: absolute;
	top: 0;
	bottom: 40px; 
	border-radius: 2px;
	background-color: #F2F2F2;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 40px;
	background-color: #FFA500;
}

.address {
	position: relative;
	margin: 5px 10px 10px 10px;
	border: 1px solid #EFF0F3;
	padding: 5px;
	border-radius: 5px;
	background-color: white;
	cursor: pointer;
}

.address:hover {
	border: 1px solid #a3d7ff;
}

.selected {
	border: 1px solid #a3d7ff;
}

tr {
	line-height: 30px;
	padding: 5px;
	font-size: 14px;
}

tr td:first-child {
	text-align: right;
}

td input {
	padding: 5px;
}

.delete {
	position: absolute;
	top: 5px;
	right: 5px;
	cursor: pointer;
}

.add {
	position: absolute;
	top: 5px;
	right: 30px;
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="main">
		<div id="list"></div>
	</div>
</body>
<script type="text/javascript">
	 $(document).ready(function(){
		$.ajax({
			type : "post",
			url : "<%=basePath%>address/searchAddress",
			async : false,
			dataType : "json",
			data : {
				"usrid" : "${SESSION_CUST.custid}",
			},
			success : function(data) {
				if (data.status) {	
					$("#length").text(data.result.length);
					for(var i = 0 ; i < data.result.length ; i++){
						var address = data.result[i];
						var field = document.createElement("div");
						field.innerHTML = "<div class=\"address\"><h1>"+address.receiveuser+"</h1><input type=\"hidden\" value=\""+address.adrrid+"\"/><table><tr><td width=\"20%\">收件人：</td><td><span>"+address.receiveuser+"</span></td></tr><tr><td>所在地区：</td><td><span>"+address.province+address.city+"</span></td></tr><tr><td>地址：</td><td><span>"+address.area+address.street+"</span></td></tr><tr><td>手机号：</td><td><span>"+address.phone+"</span></td></tr></table></div>";
						$("#list").prepend(field);
					}
				}
				else {
					$("#length").text(0);
					layer.msg(data.msg, {icon : 2});
				}
				
				$(".address").click(function(){
					$(".address").each(function(){
						if($(this).hasClass('selected'))
							$(this).removeClass('selected');
					});
					$(this).addClass('selected');
					parent.selectedAddrid =  $(this).find("input:hidden").val();
				});
			},
			error : function(data) {
				layer.msg("访问异常，请稍后重试！", {
					icon : 2
				});
			}
		});	
	});
</script>
</html>
