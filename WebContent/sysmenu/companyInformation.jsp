<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>公司信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body{
			margin:0;
			padding:0;
		}
		a:link {
		 text-decoration: none;
		}
		a:visited {
		 text-decoration: none;
		}
		a:hover {
		 text-decoration: none;
		}
		a:active {
		 text-decoration: none;
		}
		
		#maintop{font-size:15px;
		         text-align:center;	
				padding-top:8px;
				background-color:#F0FFFF;
				height:27px;
				width:100%;
				
		} 
		td{border:solid #add9c0; 
		border-width:0px 1px 1px 0px;
		padding:10px 17px;
		font-size:12px;
		 }
		
		table{border:solid #add9c0; 
		border-width:1px 0px 0px 1px;
		}
		span{
		color:blue;
		}
		
</style>
	
  </head>
  
  <body>
   	<div id="main"  class="main"   style="background-color:#DDE;height:100%;width:100%;">
    <div style="padding-left:87%;padding-top:3px;"><span>系统管理>公司资料</span></div></br></br>
	<div align="center">
		<table id="loginLog" >
			<tr>
		<td>人事部</td>
		<td>后勤部</td>
		<td>财务部</td>
		<td>物资部</td>
		<td>生产部</td>
		<td>技术部</td>
		<td>质检部</td>
		<td>销售部</td>
		<td>市场部</td>
		<td>理事部</td>
		<td>策划部</td>
		<td>安保部</td>
		</tr>
		<tr>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>
		<td>62323358</td>		
		</tr>
		</table>
	</div>	
	<div id="company"  class="company"  style="padding-top:38px;">	
		<div align="left" id="div1" style="padding-left:35%;font-size:16px;color:#53868B">
		公司名称：天津三条石金属铸造厂	</br></br>
		公司地址：北辰区大张庄镇张献庄村  </br></br>
		法人代表：xxx	</br></br>	
		主营业务：涡轮、铸件、有色金属...	</br></br>		
		公司邮编：300402	</br></br>	
		公司电话：022-26996607</br></br>	
		公司邮箱：santiaoshi@163.com	</br></br>	
		公司主页：<a href ="http://www.tjsts.com" target="_black">http://www.tjsts.com</a>
		</div>			
</div>
	</div>
  </body>
</html>
