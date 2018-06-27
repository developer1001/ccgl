<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
		<style>
		.button {
         color: #fff;              
         padding:6px 6px;
         border: 1px solid orange;
         cursor: hand;
         font-family: "宋体";
         font-size: 20px;
    }
		
		.sorry{
		font-size:20px;
	
		}
		
	</style>
  </head>
  
  <body>
   <div class="container">
	<div class="panel margin-big-top">
	<div align ="center" class="text-center"></br></br>
	<p class="sorry"><b>很抱歉，请重新登陆！</b></p>
			<br>
			<br>
			<img src="images/500.png" class="radius" width="60%" height="60%"/>			
			<div class="padding-big">			
				<a href="https://www.baidu.com" target="_black"><input type="button" class="button" value="搜搜看?" onmouseover="this.style.backgroundColor='#f90';" onmouseout="this.style.backgroundColor='#FF4500';" ></a>
			</div>
	</div>
	</div>
</div>
  </body>
</html>
