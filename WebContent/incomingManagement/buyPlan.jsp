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
	<script type="text/javascript" src="js/print.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>采购计划</title>
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
	    	strIds.push(selectedRows[i].planid);
	    }
	    var ids = strIds.join(",");
	    $.messager.confirm("系统提示","您确定要删掉这<font color='red'>"+selectedRows.length+"</font>条数据么?",function(r){
	    	if(r){
	    		$.post("buyplan!delete",{delIds:ids},function(result){	    		
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
	    	$("#dlg").dialog("open").dialog("setTitle","添加采购计划");
	    	url="buyplan!save";
	    }
	    function closeDialog(){
	    	$("#dlg").dialog("close");
	    	resetValue();
	    }
	    function resetValue(){								
	    	$("#planid").val("");
	    	$("#plantime").val("");
	    	$("#plansupplier").val("");
	    	$("#productnamae").val("");
	    	$("#buyprice").val("");
	    	$("#buyccount").val("");
	    	$("#totalmoney").val("");	  
	    	$("#planbudget").val("");	  
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
	    	$("#dlg").dialog("open").dialog("setTitle","修改采购计划");
	    	$("#planid").val(row.planid);
	    	$("#plantime").val(row.plantime);
	    	$("#plansupplier").val(row.plansupplier);
	    	$("#productname").val(row.productname);
	    	$("#buyprice").val(row.buyprice);
	    	$("#buyccount").val(row.buyccount);
	    	$("#totalmoney").val(row.totalmoney);
	    	url="buyplan!save?planid="+row.planid;
	    }
	    
	    //导出清单
	    function exportPlan(){
			$('#condition').submit();
		}
	    
	
	</script>
</head>
<body style="margin:2px">
  <table class=easyui-datagrid id="dg" title="采购计划" fitColumns="true" pagination="true" rownumbers="true"
    fit="true" url="buyplan" toolbar="#tb">
    <thead>
      <tr>
        <th field="cb" checkbox="true">序号</th>
        <th field="planid" width="100">采购计划编号</th>
        <th field="plantime" width="240">采购计划时间</th>
        <th field="plansupplier" width="200">供应商</th>
        <th field="productname" width="150">产品名</th>
        <th field="buyprice" width="150">产品价格(元)</th>
        <th field="buyccount" width="150">产品数量(个)</th>
        <th field="totalmoney" width="150">产品总价(元)</th>
        <th field="planbudget" width="150">采购预算(元)</th>
       </tr>
 </table>
  <div id=tb>
  <div>
  <div  style="float: left">
    <a href="javascript:addopendialog()" class=easyui-linkbutton iconCls="icon-add" plain="true">添加</a>
    <a href="javascript:modifyopendialog()" class=easyui-linkbutton iconCls="icon-edit" plain="true">修改</a>
    <a href="javascript:del()" class=easyui-linkbutton iconCls="icon-remove" plain="true">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="exportPlan()">导出采购计划</a>

  </div>
  <div>
  <form  id='condition' name='condition' action='buyplan!export' method="post"> 
      <input type="text" id='s_name' name="s_name" >
        <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" id="btn" plain="true" >产品搜索</a>
        <a href="javascript:cleanAndReset()" class="easyui-linkbutton" iconCls="icon-reload"  plain="true" >清空搜索</a>
       <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-print"  plain="true"  onclick="CreateFormPage('打印', $('#dg'));">打印</a> 
        </form>
  </div>
  </div>
 </div> 
  <div id="dlg" class="easyui-dialog" style="width:600px;height:280px;padding:10px 20px"
    closed="true" buttons="#dlg-buttons">
     <form id=fm method="post">
       <table>
        <tr>
          <td >采购计划编号:
          </td>
           <td><input type="text" placeholder="自动生成" name="buyplan.planid" disabled id="planid" class=easyui-validatebox >
          </td>
          <td>采购计划时间:
          </td>
           <!--td><input type="text" name="buyplan.plantime"  id="plantime" class=easyui-validatebox placeholder="例如1998-02-08">
          </td-->
          <td><input class="easyui-datebox" name="buyplan.plantime" editable="false" id="plantime"></input> 
          </td>
        </tr>
        <tr>
          <td>供应商:
          </td>
          <!--  <td><input type="text" name="buyplan.plansupplier"  id="plansupplier" class=easyui-validatebox required="true">
          </td> -->
          <td>
	        <select size="1" class="easyui-combobox" name="buyplan.plansupplier"  id="plansupplier" style="width:173px;">	        		        	
	        	<option value="江南制造总局" selected ="selected">江南制造总局</option>	        	
	        	<option value="骏驰铜铝合金有限公司">骏驰铜铝合金有限公司</option>
	        	<option value="海泰有色金属有限公司">海泰有色金属有限公司</option>
	        	<option value="菏泽永利钢铁厂">菏泽永利钢铁厂</option>
	        	<option value="东风铸造厂">东风铸造厂</option>
	        	<option value="先达有色金属有限公司">先达有色金属有限公司</option>
	        	<option value="无锡三泰钢铁有限公司">无锡三泰钢铁有限公司</option>
	        	<option value="达远合金铸造厂">达远合金铸造厂</option>
	        	<option value="斯科尔金属研究所">斯科尔金属研究所</option>
	        	<option value="威斯克稀有金属有限公司">威斯克稀有金属有限公司</option>
	        	<option value="汉江文和钢铁有限公司">汉江文和钢铁有限公司</option>
	        	<option value="唐山有色金属冶炼厂">唐山有色金属冶炼厂</option>
	        	<option value="河北三菱重型机床有限公司">河北三菱重型机床有限公司</option>
	        	<option value="无锡三泰煤炭有限公司">无锡三泰煤炭有限公司</option>
	        	<option value="合肥尔泰有色金属冶炼厂">合肥尔泰有色金属冶炼厂</option>
	        	<option value="青岛创合煤炭有限公司" >青岛创合煤炭有限公司</option>
	        	<option value="成都建辉高温瓦片有限公司">成都建辉高温瓦片有限公司</option>
	        </select>           
          </td>
          <td>产品名称:
          </td>
           <td><input type="text" name="buyplan.productname"  id="productname" class=easyui-validatebox required="true">
          </td>
        </tr>
         <tr>
          <td>产品价格(元):
          </td>
           <td><input type="text" name="buyplan.buyprice"  id="buyprice" class=easyui-validatebox >
          </td>
          <td>产品数量(个):
          </td>
           <td><input type="text" name="buyplan.buyccount"  id="buyccount" class=easyui-validatebox required="true">
          </td>
        </tr>
       <tr>
          <td>产品总价(元):
          </td>
           <td><input type="text" name="buyplan.totalmoney" placeholder="自动计算，无需输入" disabled id="totalmoney" class=easyui-validatebox >
          </td>
          <td>采购预算(元):
          </td>
           <td><input type="text" name="buyplan.planbudget"  id="planbudget" class=easyui-validatebox >
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