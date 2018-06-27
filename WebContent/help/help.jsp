<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>帮助</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		a:link {
		 text-decoration: none;
		}
		a:visited {
		 text-decoration: none;
		 color:#87CEEB
		}
		a:hover {
		 text-decoration: none;
		 color:#87CEEB
		}
		a:active {
		 text-decoration: none;
		 color:#87CEEB
		}
			
		div {
		padding-left:5px;
		font-size:16px;
		color:#6E8B3D;
	
		}
		body{
		padding:0;
		margin:0;
		background-color:#DDE;
 		overflow:hidden; 
		}
		#divimg{
				filter:alpha(opacity=20); 
				-moz-opacity:0.1;
				 -khtml-opacity:0.1; 
				 opacity: 0.1;
}
		
</style>	
  </head>
  
  <body>
   	<div id="main"  class="main"   style="float:left;">
<!--     <div style="padding-left:90%;padding-top:3px;"><span style="color:#87CEEB">系统维护</span>><span style="color:#87CEEB">帮助</span></div> --></br></br>
	<div id="usualProblem">
	常见问题-----------------------------------------------------------------------</br></br>
	问：登录失败或者无法打开网页？</br>
	答：请重启服务后再次登陆。</br></br>
	问：系统数据需要经常做备份吗？</br>
	答：出于安全和系统健壮性考虑，建议每天至少备份一次数据库</br></br></br>
	-----------------------------------------------------------------------------
	</div></br></br>
	<div id="contact">
	问题不能解决？&nbsp;<br/>请联系开发商---晋江锋尚科技有限公司&nbsp;0754--2565423&nbsp;jinjiangfengshang@163.com
	</div></br></br></br></br></br>
	<div id="version" align="center">
	版本号：v1.2.0   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.baidu.com" target="_black">获取最新消息</a>
	</div>
	</div>
	<div id="divimg" style="float:right;"><img src="images/chilun.gif" width="100%",height="70%"></div>
  </body>
</html>
