<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jqueryEasyUI/jquery.min.js"></script>
<script type="text/javascript" src="js/jqueryEasyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jqueryEasyUI/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<link rel="stylesheet" type="text/css" href="js/jqueryEasyUI/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/jqueryEasyUI/themes/icon.css">
    
<%
String easyuiThemeName = "bootstrap";
Cookie cookies[] = request.getCookies();
if(cookies != null && cookies.length >0){
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("easyuiThemeName")){
			easyuiThemeName = cookies[i].getValue();
				break;
		}
	}
}	
%>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="js/jqueryEasyUI/themes/<%=easyuiThemeName %>/easyui.css">
<script type="text/javascript">
	$(function(){
		$('body').css('visibility','visible');
	})
</script>
<style>
body{visibility: hidden;}
.search {background-image: url("js/jqueryEasyUI/common/search.png");}
.add {background-image: url("js/jqueryEasyUI/common/add.png");}
.delete {background-image: url("js/jqueryEasyUI/common/delete.png");}
.update {background-image:url("js/jqueryEasyUI/common/update.png");}
</style>