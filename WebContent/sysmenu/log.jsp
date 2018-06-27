<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>系统日志管理</title>
<script type="text/javascript">
	var url;
					//搜索
	    function search(){
	    	$('#dg').datagrid('load',{
	    		s_name:$('#s_name').val(),
	    		s_timefrom:$('#s_timefrom').datebox("getValue"),
	    		s_timeto:$('#s_timeto').datebox("getValue"),
	    	});
	    }
	    
	    //清空搜索
	    function cleanAndReset(){	 
	   $('#s_name').val("");
	   $("#s_timefrom").datebox("setValue","");
		$("#s_timeto").datebox("setValue","");
	    search();
	    }
   	    
	    //导出
	    function exportUser(){
			$('#condition').submit();
		}
	</script>
	<script type="text/JavaScript">
		function formatShow(value,row,index){
		if(value==1){
		        return "<font color='green'>登陆系统</font>";
		    }else{
		        return "<font color='red'>退出系统</font>";
		}
		}

  </script>

	
</head>
<body style="margin:2px" onload="search()">

  <table class=easyui-datagrid id="dg" title="系统日志" remoteSort="false" fitColumns="true" pagination="true" rownumbers="true"
    fit="true" url="log" toolbar="#tb">
    <thead>
      <tr>
        <th field="cb" checkbox="false"></th>
        <th field="logid" width="100">编号</th>
        <th field="loguser" width="280">用户</th>
        <th field="logtime" width="280" sortable="true" >操作时间</th>
        <th field="logtype" width="150" formatter="formatShow">操作</th>        
       </tr>
       </thead>
 </table>
  <div id=tb >
  <div>
  <div>
  <form  id='condition' name='condition' action='log!export' method="post"> 
     用户名 <input type="text" id='s_name' name="s_name" >&nbsp;&nbsp;
     时间 <input type="text" id='s_timefrom' name="s_timefrom" editable="false" class="easyui-datetimebox">&nbsp;---
      <input type="text" id='s_timeto' name="s_timeto" editable="false" class="easyui-datetimebox">&nbsp;&nbsp;
        <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" id="btn" plain="true" >搜索</a>
        <a href="javascript:cleanAndReset()" class="easyui-linkbutton" iconCls="icon-reload"  plain="true" >清空搜索</a>
        </form>
  </div>
  </div>
 </div> 
  <div id="dlg" class="easyui-dialog" style="width:600px;height:280px;padding:10px 20px"
    closed="true" buttons="#dlg-buttons">
     <form id=fm method="post">
     </form>
  </div>
</body>
</html>
