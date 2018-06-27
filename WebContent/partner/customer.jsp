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
<title>客户信息管理</title>
<script type="text/javascript">
	var url;
		
		//按名字搜索客户
	    function searchCustomer(){
	    	$('#dg').datagrid('load',{
	    		s_name:$('#s_name').val()
	    	});
	    }
	    
	    //清空搜索栏并且重新列出所有客户
	    function cleanAndReset(){	 
	   $('#s_name').val("");
	    searchCustomer();
	    }
	    
	    //删除客户
	    function deleteCustomer(){
	    	var selectedRows=$("#dg").datagrid("getSelections");
	    	if(selectedRows.length==0){
	    		$.messager.alert("系统提示","请选择要删除的数据");
	    		return;
	    	}
	    var strIds=[];
	    for(var i=0;i<selectedRows.length;i++){
	    	strIds.push(selectedRows[i].customerId);
	    }
	    var ids = strIds.join("','");
	    $.messager.confirm("系统提示","您确定要删掉这<font color='red'>"+selectedRows.length+"</font>条数据么?",function(r){
	    	if(r){
	    		$.post("customer!delete",{delIds:ids},function(result){	    		
	    			if(result.success){
	    				$.messager.alert("系统提示",'您已成功删除<font color=red>'+result.delNums+"</font>条数据!");
	    				$("#dg").datagrid("reload");
	    			}else{
	    				$.messager.alert("系统提示",'<font color=red>'+selectedRows[result.errorIndex].name+'</font>'+result.errorMsg);
	    			}
	    		},"json"); 
	    	}
	    });
	    }
	    
	    //添加客户
	    function addopendialog(){
	    	$("#dlg").dialog("open").dialog("setTitle","添加采购商");
	    	url="customer!save";
	    }
	    function closeDialog(){
	    	$("#dlg").dialog("close");
	    	resetValue();
	    }
	    function resetValue(){								//
	    	$("#customerId").val("");
	    	$("#customerCompany").val("");
	    	$("#customerAddress").val("");
	    	$("#customerName").val("");
	    	$("#customerPhone").val("");
	    	$("#customerEmail").val("");
	    	$("#customerPostcode").val("");	    
	    }
	    
	    //保存客户信息
	    function saveCustomer(){
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
	    
	    //修改客户信息
	    function modifyopendialog(){
	    	var selectedRows=$("#dg").datagrid("getSelections");
	    	if(selectedRows.length!=1){
	    		$.messager.alert("系统提示","请选择一条要修改的数据");
	    		return;
	    	}
	    	var row=selectedRows[0];
	    	$("#dlg").dialog("open").dialog("setTitle","修改采购商信息");
	    	$("#customerId").val(row.customerId);
	    	$("#customerCompany").val(row.customerCompany);
	    	$("#customerAddress").val(row.customerAddress);
	    	$("#customerPostcode").val(row.customerPostcode);
	    	$("#customerName").val(row.customerName);
	    	$("#customerPhone").val(row.customerPhone);
	    	$("#customerEmail").val(row.customerEmail);
	    	url="customer!save?customerId="+row.customerId;
	    }
	    
	    //导出客户清单
	    function exportUser(){
			$('#condition').submit();
		}
	</script>
</head>
<body style="margin:2px">
  <table class=easyui-datagrid id="dg" title="采购商信息" fitColumns="true" pagination="true" rownumbers="true"
    fit="true" url="customer" toolbar="#tb">
    <thead>
      <tr>
        <th field="cb" checkbox="true"></th>
        <th field="customerId" width="100">采购商编号</th>
        <th field="customerCompany" width="280">采购商公司</th>
        <th field="customerAddress" width="280">采购商地址</th>
        <th field="customerPostcode" width="150">邮编</th>
        <th field="customerName" width="150">联系人</th>
        <th field="customerPhone" width="150">联系电话</th>
        <th field="customerEmail" width="150">备注（邮箱）</th>
       </tr>
 </table>
  <div id=tb>
  <div>
  <div  style="float: left">
    <a href="javascript:addopendialog()" class=easyui-linkbutton iconCls="icon-add" plain="true">添加</a>
    <a href="javascript:modifyopendialog()" class=easyui-linkbutton iconCls="icon-edit" plain="true">修改</a>
    <a href="javascript:deleteCustomer()" class=easyui-linkbutton iconCls="icon-remove" plain="true">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="exportUser()">导出采购商</a>
  </div>
  <div>
  <form  id='condition' name='condition' action='customer!export' method="post"> 
      <input type="text" id='s_name' name="s_name" >
        <a href="javascript:searchCustomer()" class="easyui-linkbutton" iconCls="icon-search" id="btn" plain="true" >联系人搜索</a>
        <a href="javascript:cleanAndReset()" class="easyui-linkbutton" iconCls="icon-reload"  plain="true" >清空搜索</a>
        </form>
  </div>
  </div>
 </div> 
  <div id="dlg" class="easyui-dialog" style="width:600px;height:280px;padding:10px 20px"
    closed="true" buttons="#dlg-buttons">
     <form id=fm method="post">
       <table>
        <tr>
          <td >采购商编号：
          </td>
           <td><input type="text" placeholder="只可添加不可修改" name="customer.customerid"  id="customerId" class=easyui-validatebox required="true">
          </td>
          <td>采购商公司：
          </td>
           <td><input type="text" name="customer.customercompany"  id="customerCompany" class=easyui-validatebox>
          </td>
        </tr>
        <tr>
          <td>采购商地址：
          </td>
           <td><input type="text" name="customer.customeraddress"  id="customerAddress" class=easyui-validatebox>
          </td>
          <td>邮编：
          </td>
           <td><input type="text" name="customer.customerpostcode"  id="customerPostcode" class=easyui-validatebox>
          </td>
        </tr>
         <tr>
          <td>采购商名：
          </td>
           <td><input type="text" name="customer.customername"  id="customerName" class=easyui-validatebox required="true">
          </td>
          <td>联系电话：
          </td>
           <td><input type="text" name="customer.customerphone"  id="customerPhone" class=easyui-validatebox required="true">
          </td>
        </tr>
        <tr>
          <td valign="top">备注（邮箱）：
          </td>
           <td colspan="3"><textarea rows="4" cols="45" name="customer.customeremail" id="customerEmail"></textarea>
           </td>
        </tr>
       </table>
     </form>
  </div>
  <div id="dlg-buttons">
		<a href="javascript:saveCustomer()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
  </div>
</body>
</html>