<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
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
<title>利润统计</title>
<script type="text/javascript">
	var url;
		
		//按名字搜索
	    function search(){
	    	$('#dg').datagrid('load',{
	    		s_name:$('#s_name').val()
	    	});
	    }
	    
	    //清空搜索栏并且重新列出
	    function cleanAndReset(){	 
	   $('#s_name').val("");
	    search();
	    }
	    
	    //删除
	    function del(){
	    	var selectedRows=$("#dg").datagrid("getSelections");
	    	if(selectedRows.length==0){
	    		$.messager.alert("系统提示","请选择要删除的数据");
	    		return;
	    	}
	    var strIds=[];
	    for(var i=0;i<selectedRows.length;i++){
	    	strIds.push(selectedRows[i].PRID);
	    }
	    var ids = strIds.join(",");
	    $.messager.confirm("系统提示","您确定要删掉这<font color='red'>"+selectedRows.length+"</font>条数据么?",function(r){
	    	if(r){
	    		$.post("PROFITSCOUNT!delete",{delIds:ids},function(result){	    		
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
	    
	    //添加
	    function addopendialog(){
	    	$("#dlg").dialog("open").dialog("setTitle","添加利润统计清单");
	    	url="PROFITSCOUNT!save";
	    }
	    function closeDialog(){
	    	$("#dlg").dialog("close");
	    	resetValue();
	    }
	    function resetValue(){								
	    	$("#PRID").val("");
	    	$("#PRMONTH").val("");
	    	$("#PRSALES").val("");
	    	$("#PRBUYSPEND").val("");
	    	$("#PRREFUNDTOBUYER").val("");
	    	$("#PRSUPPLIERREFUND").val("");
	    	$("#PRPROFITS").val("");
	    	$("#PRREMARKS").val("");	  	    		  
	    }
	    
	    //保存信息
	    function saveMessage(){
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
	    
	    //修改信息
	    function modifyopendialog(){
	    	var selectedRows=$("#dg").datagrid("getSelections");
	    	if(selectedRows.length!=1){
	    		$.messager.alert("系统提示","请选择一条要修改的数据");
	    		return;
	    	}
	    	var row=selectedRows[0];
	    	$("#dlg").dialog("open").dialog("setTitle","修改利润统计清单");	    	
	    	$("#PRMONTH").val(row.PRMONTH);
	    	$("#PRSALES").val(row.PRSALES);
	    	$("#PRBUYSPEND").val(row.PRBUYSPEND);
	    	$("#PRREFUNDTOBUYER").val(row.PRREFUNDTOBUYER);
	    	$("#PRSUPPLIERREFUND").val(row.PRSUPPLIERREFUND);
	    	$("#PRPROFITS").val(row.PRPROFITS);
	    	$("#PRREMARKS").val(row.PRREMARKS);
	    	url="PROFITSCOUNT!save?PRID="+row.PRID;
	    }
	    
	    //导出清单
	    function exportExcel(){
			$('#condition').submit();
		}
		
		
		function formatShow1(value,row,index){		
		  return "<font color='blue'>"+value+"</font>";		   		 
		}
		
		function formatShow2(value,row,index){		
		  return "<font color='red'>"+value+"</font>";		   		 
		}
		
		function formatShow3(value,row,index){		
		  return "<font color='red'>"+value+"</font>";		   		 
		}
		
		function formatShow4(value,row,index){		
		  return "<font color='blue'>"+value+"</font>";		   		 
		}
		
		function formatShow5(value,row,index){
		 	if(value>=0){		
		  		return "<font color='green'>"+value+"</font>";		 
		  	}else{
		  		return value;
		  	}  		 
		}

  </script>

</head>
<body style="margin:2px">
  <table class=easyui-datagrid id="dg" title="资金核算" remoteSort="false" fitColumns="true" pagination="true" rownumbers="true"
    fit="true" url="PROFITSCOUNT" toolbar="#tb">
    <thead>
      <tr>
        <th field="cb" checkbox="true"></th>
        <th field="PRID" sortable="true" width="100">清单编号</th>
        <th field="PRMONTH" sortable="true" width="140">日期</th>
        <th field="PRSALES" sortable="true" width="100" formatter="formatShow1">销售额(元)</th>
        <th field="PRBUYSPEND" sortable="true" width="150" formatter="formatShow2">采购支出(元)</th>
        <th field="PRREFUNDTOBUYER" sortable="true" width="150" formatter="formatShow3">退款给采购商(元)</th>
        <th field="PRSUPPLIERREFUND" sortable="true" width="150" formatter="formatShow4">供应商退款(元)</th>
        <th field="PRPROFITS" sortable="true" width="150" formatter="formatShow5">利润(元)</th>  
        <th field="PRREMARKS" sortable="true" width="350">备注</th>      
       </tr>
 </table>
  <div id=tb>
  <div>
  <div  style="float: left">
    <a href="javascript:addopendialog()" class=easyui-linkbutton iconCls="icon-add" plain="true">添加</a>
    <a href="javascript:modifyopendialog()" class=easyui-linkbutton iconCls="icon-edit" plain="true">修改</a>
    <a href="javascript:del()" class=easyui-linkbutton iconCls="icon-remove" plain="true">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="exportExcel()">导出清单</a>
  </div>
  <div>
  <form  id='condition' name='condition' action='PROFITSCOUNT!export' method="post"> 
      <input type="hidden" id='s_name' name="s_name" >
        <a href="javascript:void(0)" class="easyui-linkbutton"  id="btn" plain="true" ></a>
        <a href="javascript:void(0)" class="easyui-linkbutton"   plain="true" ></a>
        </form>
  </div>
  </div>
 </div> 
  <div id="dlg" class="easyui-dialog" style="width:600px;height:280px;padding:10px 20px"
    closed="true" buttons="#dlg-buttons">
     <form id=fm method="post">
       <table>
        <tr>
          <td >清单编号:
          </td>
           <td><input type="text" placeholder="自动生成"  disabled name="profitsCount.prid" id="PRID" class=easyui-validatebox >
          </td>
          <td>日期:
          </td>
           <!--td><input type="text" name="buyplan.plantime"  id="plantime" class=easyui-validatebox placeholder="例如1998-02-08">
          </td-->
          <td><input class="easyui-datebox" name="profitsCount.prmonth" editable="false" id="PRMONTH"  required="true"></input> 
          </td>
        </tr>
        <tr>
          <td>销售额(元):
          </td>
           <td><input type="text" name="profitsCount.prsales"  id="PRSALES" class=easyui-validatebox >
          </td>
          <td>采购支出(元):
          </td>
           <td><input type="text" name="profitsCount.prbuyspend"  id="PRBUYSPEND" class=easyui-validatebox >
          </td>
        </tr>
         <tr>
          <td>退款给采购商(元):
          </td>
           <td><input type="text" name="profitsCount.prrefundtobuyer"  id="PRREFUNDTOBUYER" class=easyui-validatebox >
          </td>
          <td>供应商退款(元):
          </td>
           <td><input type="text" name="profitsCount.prsupplierrefund"  id="PRSUPPLIERREFUND" class=easyui-validatebox >
          </td>
        </tr>
       <tr>
          <td>利润(元):
          </td>
           <td><input type="text" name="profitsCount.prprofits" placeholder="自动计算，无需输入" disabled id="PRPROFITS" class=easyui-validatebox >
          </td>
        </tr>
        <tr>
          <td valign="top">备注：
          </td>
           <td colspan="3"><textarea rows="4" cols="45" name="profitsCount.prremarks" id="PRREMARKS"></textarea>
           </td>
        </tr>
       </table>
     </form>
  </div>
  <div id="dlg-buttons">
		<a href="javascript:saveMessage()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
  </div>
</body>
</html>