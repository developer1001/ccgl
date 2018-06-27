<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dbBakup.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
	 function tip(){
		    window.confirm("您确定要还原数据库吗?");
	    	window.confirm("数据库已成功还原!");  
	    	}
   </script>
  </head> 
  <body bgcolor="#DDE">
  <div align="center" >
   <div style="padding-left:88%;padding-top:0px;"><span style="color:blue">系统维护</span>><span style="color:blue">数据还原</span></div></br>
  <div style="padding-top:3px;">
   <a href="bakup!recoverdb" onclick="tip()"><img src="images/dbRestore.png" width=15% height=33%/></a>
   </div>
  </div>
  <div align="left" style="padding-top:140px;padding-left:80px; color:red">
  	数据库还原是在系统数据遭到破坏或有业务需求时，可以恢复近期的</br></br>数据到数据库中.前提：之前有备份过数据库。为了本功能的正常使用，</br></br>请及时备份数据库，最好每天至少备份一次。
  </div>
  </body>
</html>
