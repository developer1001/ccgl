<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
<title>系统账户管理</title>
<script type="text/javascript">
	var url;
		
		//按用户名搜索账户
	    function searchAdmin(){
	    	$('#dg').datagrid('load',{
	    		s_name:$('#s_name').val()
	    	});
	    }
	    
	    //清空搜索栏并且重新列出所有账户
	    function cleanAndReset(){	 
	   $('#s_name').val("");
	    searchAdmin();
	    }
	    
	    //删除用户
	    function deleteAdmin(){
	    	var selectedRows=$("#dg").datagrid("getSelections");
	    	if(selectedRows.length==0){
	    		$.messager.alert("系统提示","请选择要删除的数据");
	    		return;
	    	}
	    var strIds=[];
	    for(var i=0;i<selectedRows.length;i++){
	    	strIds.push(selectedRows[i].id);
	    }
	    var ids = strIds.join(",");
	    $.messager.confirm("系统提示","您确定要删掉这<font color='red'>"+selectedRows.length+"</font>个用户吗?",function(r){
	    	if(r){
	    		$.post("user!delete",{delIds:ids},function(result){	    		
	    			if(result.success){
	    				$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>个用户!");
	    				$("#dg").datagrid("reload");
	    			}else{
	    				$.messager.alert("系统提示",'<font color=red>'+selectedRows[result.errorIndex].name+'</font>'+result.errorMsg);
	    			}
	    		},"json"); 
	    	}
	    });
	    }
	    
	    //添加管理员
	    function addopendialog(){
	    	$("#dlg").dialog("open").dialog("setTitle","添加管理员");
	    	url="user!save";
	    }
	    function closeDialog(){
	    	$("#dlg").dialog("close");
	    	resetValue();
	    }
	    function resetValue(){								//
	    	$("#id").val("");
	    	$("#userName").val("");
	    	$("#password").val("");	    	   
	    }
	    
	    //保存管理员信息
	    function saveAdmin(){
	    	$("#fm").form("submit",{
	    		url:url,
	    		onSubmit:function(){
	    			return $(this).form("validate");
	    		},success:function(result){
	    			if(result.errMsg){
	    				$.messager.alert("系统提示",result.errMsg);
	    				return;
	    			}else{
	    				$.messager.alert("系统提示","保存成功");
	    				resetValue();
	    				$("#dlg").dialog("close");
	    				$("#dg").datagrid("reload");
	    			}
	    		}
	    	});
	    }
	    
	    //修改管理员信息
	    function modifyopendialog(){
	    	var selectedRows=$("#dg").datagrid("getSelections");
	    	if(selectedRows.length!=1){
	    		$.messager.alert("系统提示","请选择一条要修改的数据");
	    		return;
	    	}
	    	var row=selectedRows[0];
	    	$("#dlg").dialog("open").dialog("setTitle","修改管理员信息");
	    	$("#id").val(row.id);
	    	$("#userName").val(row.userName);
	    	//$("#password").val(row.password);	    
	    	url="user!save?id="+row.id;
	    }
	    
	    //导出管理员清单禁用
	    function exportUser(){
			$('#condition').submit();
		}
	</script>
</head>
<body style="margin:2px">
  <table class=easyui-datagrid id="dg" title="系统账户" fitColumns="true" pagination="true" rownumbers="true"
    fit="true" url="user" toolbar="#tb">
    <thead>
      <tr>
        <th field="cb" checkbox="true"></th>
        <th field="id" width="100">编号</th>
        <th field="userName" width="280">用户名</th>
        <!-- <th field="password" width="280">密码</th> -->     
       </tr>
 </table>
  <div id=tb>
  <div>
  <div  style="float: left">
    <!--a href="javascript:addopendialog()" class=easyui-linkbutton iconCls="icon-add" plain="true">添加</a-->
    <a href="javascript:modifyopendialog()" class=easyui-linkbutton iconCls="icon-edit" plain="true">修改</a>
    <!--a href="javascript:deleteAdmin()" class=easyui-linkbutton iconCls="icon-remove" plain="true">删除</a-->
  </div>
  <div>
  <form  id='condition' name='condition' action='user!export' method="post">  
  <span style="padding-left:85%;font-size:18px;color:#87CEEB"> 系统账户修改</span>
     <!--  <input type="text" id='s_name' name="s_name"> -->
        <!--a href="javascript:searchAdmin()" class="easyui-linkbutton" iconCls="icon-search" id="btn" plain="true" >管理员搜索</a-->
        <!--a href="javascript:cleanAndReset()" class="easyui-linkbutton" iconCls="icon-reload"  plain="true" >清空搜索</a-->        
        </form>
  </div>
  </div>
 </div> 
  <div id="dlg" class="easyui-dialog" style="width:600px;height:280px;padding:10px 20px"
    closed="true" buttons="#dlg-buttons">
     <form id=fm method="post">
       <table>
        <tr>
        <td>用户名：
          </td>
           <td><input type="text" name="user.userName"  id="userName" class=easyui-validatebox required="true">
          </td>
          <td>密码：
          </td>
           <td><input type="text" name="user.password"  id="password" class=easyui-validatebox required="true">
          </td>           
        </tr>
        <tr>          
          <td>
          </td>
           <td><input type="hidden" placeholder="添加后不可修改" name="user.id"  id="id" class=easyui-validatebox required="true" disabled>
          </td>       
        </tr>               
       </table>
     </form>
  </div>
  <div id="dlg-buttons">
		<a href="javascript:saveAdmin()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
  </div>
</body>
</html>