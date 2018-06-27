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
<title>资金核算</title>
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
	    	strIds.push(selectedRows[i].mcid);
	    }
	    var ids = strIds.join(",");
	    $.messager.confirm("系统提示","您确定要删掉这<font color='red'>"+selectedRows.length+"</font>条数据么?",function(r){
	    	if(r){
	    		$.post("MONEYCHECK!delete",{delIds:ids},function(result){	    		
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
	    	$("#dlg").dialog("open").dialog("setTitle","添加资金核算清单");
	    	url="MONEYCHECK!save";
	    }
	    function closeDialog(){
	    	$("#dlg").dialog("close");
	    	resetValue();
	    }
	    function resetValue(){								
	    	$("#mcid").val("");
	    	$("#mctime").val("");
	    	$("#mcname").val("");
	    	$("#mcproduct").val("");
	    	$("#mcshould").val("");
	    	$("#mcalready").val("");
	    	$("#mcdebt").val("");	  	    		  
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
	    	$("#dlg").dialog("open").dialog("setTitle","修改资金核算清单");	    	
	    	$("#mctime").val(row.mctime);
	    	$("#mcname").val(row.mcname);
	    	$("#mcproduct").val(row.mcproduct);
	    	$("#mcshould").val(row.mcshould);
	    	$("#mcalready").val(row.mcalready);
	    	$("#mcdebt").val(row.mcdebt);
	    	url="MONEYCHECK!save?mcid="+row.mcid;
	    }
	    
	    //导出清单
	    function exportExcel(){
			$('#condition').submit();
		}
	</script>
</head>
<body style="margin:2px">
  <table class=easyui-datagrid id="dg" title="资金核算" remoteSort="false" fitColumns="true" pagination="true" rownumbers="true"
    fit="true" url="MONEYCHECK" toolbar="#tb">
    <thead>
      <tr>
        <th field="cb" checkbox="true"></th>
        <th field="mcid" sortable="true" width="100">清单编号</th>
        <th field="mctime" sortable="true" width="240">交易时间</th>
        <th field="mcname" sortable="true" width="200">合作商</th>
        <th field="mcproduct" sortable="true" width="150">产品</th>
        <th field="mcshould" sortable="true" width="150">应付款(元)</th>
        <th field="mcalready" sortable="true" width="150">已付款(元)</th>
        <th field="mcdebt" sortable="true" width="150">欠款(元)</th>      
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
  <form  id='condition' name='condition' action='MONEYCHECK!export' method="post"> 
      <input type="text" id='s_name' name="s_name" >
        <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" id="btn" plain="true" >合作商搜索</a>
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
          <td >清单编号:
          </td>
           <td><input type="text" placeholder="自动生成"  disabled name="moneyCheck.mcid" id="mcid" class=easyui-validatebox >
          </td>
          <td>交易时间:
          </td>
           <!--td><input type="text" name="buyplan.plantime"  id="plantime" class=easyui-validatebox placeholder="例如1998-02-08">
          </td-->
          <td><input class="easyui-datebox" name="moneyCheck.mctime"  id="mctime"></input> 
          </td>
        </tr>
        <tr>
          <td>合作商:
          </td>
           <!-- <td><input type="text" name="moneyCheck.mcname"  id="mcname" class=easyui-validatebox required="true">
          </td> -->
            <td>
	        <select size="1" class="easyui-combobox" name="moneyCheck.mcname"  id="mcname" style="width:173px;">	        	        	
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
	        	<option value="中铁一局集团有限公司" selected ="selected">中铁一局集团有限公司</option>	        	
	        	<option value="中铁二局集团有限公司">中铁二局集团有限公司</option>
	        	<option value="中铁三局集团有限公司">中铁三局集团有限公司</option>
	        	<option value="中铁四局集团有限公司">中铁四局集团有限公司</option>
	        	<option value="中铁五局集团有限公司">中铁五局集团有限公司</option>
	        	<option value="中铁六局集团有限公司">中铁六局集团有限公司</option>
	        	<option value="中铁七局集团有限公司">中铁七局集团有限公司</option>
	        	<option value="中铁八局集团有限公司">中铁八局集团有限公司</option>
	        	<option value="中铁九局集团有限公司">中铁九局集团有限公司</option>
	        	<option value="中铁十局集团有限公司">中铁十局集团有限公司</option>
	        	<option value="中铁十一局集团有限公司">中铁十一局集团有限公司</option>
	        	<option value="中铁十二局集团有限公司">中铁十二局集团有限公司</option>
	        	<option value="中铁十三局集团有限公司">中铁十三局集团有限公司</option>
	        	<option value="中铁十四局集团有限公司">中铁十四局集团有限公司</option>
	        	<option value="中铁十五局集团有限公司">中铁十五局集团有限公司</option>
	        	<option value="中铁十六局集团有限公司" >中铁十六局集团有限公司</option>
	        	<option value="中铁十七局集团有限公司">中铁十七局集团有限公司</option>
	        	<option value="中铁十八局集团有限公司">中铁十八局集团有限公司</option>
	        	<option value="中铁十九局集团有限公司">中铁十九局集团有限公司</option>
	        	<option value="中铁二十局集团有限公司">中铁二十局集团有限公司</option>
	        	<option value="中铁二十一局集团有限公司">中铁二十一局集团有限公司</option>
	        	<option value="中铁二十二局集团有限公司">中铁二十二局集团有限公司</option>
	        	<option value="中铁二十三局集团有限公司">中铁二十三局集团有限公司</option>
	        	<option value="中铁二十四局集团有限公司">中铁二十四局集团有限公司</option>
	        	<option value="中铁二十五局集团有限公司">中铁二十五局集团有限公司</option>
	        </select>
           <!--input type="text" name="produceIntoWarehouse.manufacturer" value="三条石金属铸造厂" placeholder="三条石金属铸造厂" disabled id="MANUFACTURER" class=easyui-validatebox -->
          </td>
          <td>产品:
          </td>
           <td><input type="text" name="moneyCheck.mcproduct"  id="mcproduct" class=easyui-validatebox required="true">
          </td>
        </tr>
         <tr>
          <td>应付款(元):
          </td>
           <td><input type="text" name="moneyCheck.mcshould"  id="mcshould" class=easyui-validatebox >
          </td>
          <td>已付款(元):
          </td>
           <td><input type="text" name="moneyCheck.mcalready"  id="mcalready" class=easyui-validatebox >
          </td>
        </tr>
       <tr>
          <td>欠款(元):
          </td>
           <td><input type="text" name="moneyCheck.mcdebt" placeholder="自动计算，无需输入" disabled id="mcdebt" class=easyui-validatebox >
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