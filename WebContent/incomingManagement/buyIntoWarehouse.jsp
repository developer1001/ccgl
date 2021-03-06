<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ page import ="com.dyj.dao.SupplierDao" %>
<%@ page import ="com.dyj.util.DbUtil" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.util.List" %>
<%@ page import ="com.dyj.model.Supplier" %>
<%@ page import ="org.apache.struts2.ServletActionContext" %>
<%@ page import ="javax.servlet.http.HttpServletRequest" %>
<%
	Connection con=null;
	DbUtil dbUtil=new DbUtil();
	try{
		con=dbUtil.getCon();
		SupplierDao supplierdao = new SupplierDao();
		List<Supplier> li2 = supplierdao.getSuppliers(con);
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		req.setAttribute("li2", li2);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try {
			dbUtil.closeCon(con);
			} catch (Exception e) {					
				e.printStackTrace();
				}
	}
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
<title>生产入库</title>
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
	    	strIds.push(selectedRows[i].INID);
	    }
	    var ids = strIds.join(",");
	    $.messager.confirm("系统提示","您确定要删掉这<font color='red'>"+selectedRows.length+"</font>条数据么?",function(r){
	    	if(r){
	    		$.post("BUYINTOWAREHOUSE!delete",{delIds:ids},function(result){	    		
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
	    	$("#dlg").dialog("open").dialog("setTitle","添加采购入库清单");
	    	url="BUYINTOWAREHOUSE!save";
	    }
	    function closeDialog(){
	    	$("#dlg").dialog("close");
	    	resetValue();
	    }
	    function resetValue(){		    	
	    	$("#INID").val("");
	    	$("#PRID").val("");
	    	$("#PRNAME").val("");
	    	$("#PRKIND").val("");
	    	$("#MATERIAL").val("");
	    	$("#SPECIFICATION").val("");
	    	$("#PRPRICE").val("");
	    	$("#PRQUANTITY").val("");
	    	$("#PRCOST").val("");	    	
	    	$("#SUPPLIER").val("");
	    	$("#PRDATE").val("");
	    	$("#CHECHER").val("");
	    	$("#WAREHOUSE").val("");
	    	$("#REMARKS").val("");	    		    	
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
	    	$("#dlg").dialog("open").dialog("setTitle","修改采购入库清单");	    	
	    	$("#PRID").val(row.PRID);
	    	$("#PRNAME").val(row.PRNAME);
	    	$("#PRKIND").val(row.PRKIND);
	    	$("#MATERIAL").val(row.MATERIAL);
	    	$("#SPECIFICATION").val(row.SPECIFICATION);	 
	    	$("#PRPRICE").val(row.PRPRICE);
	    	$("#PRQUANTITY").val(row.PRQUANTITY);
	    	$("#PRCOST").val(row.PRCOST);	    	
	    	$("#SUPPLIER").val(row.SUPPLIER);
	    	$("#PRDATE").val(row.PRDATE);
	    	$("#CHECHER").val(row.CHECHER);
	    	$("#WAREHOUSE").val(row.WAREHOUSE);
	    	$("#REMARKS").val(row.REMARKS);	 
	    	url="BUYINTOWAREHOUSE!save?INID="+row.INID;
	    }
	    
	    //导出清单
	    function exportExcel(){
			$('#condition').submit();
		}				

  </script>

</head>
<body style="margin:2px">
  <table class=easyui-datagrid id="dg" title="采购入库" remoteSort="false" fitColumns="true" pagination="true" rownumbers="true"
    fit="true" url="BUYINTOWAREHOUSE" toolbar="#tb">
    <thead>
      <tr>
        <th field="cb" checkbox="true">序号</th>
        <th field="INID" sortable="true" width="40">编号</th>
        <th field="PRID" sortable="true" width="130">产品编号</th>
        <th field="PRNAME" sortable="true" width="130">产品名</th>
        <th field="PRKIND"  width="150" >类别</th>
        <th field="MATERIAL"  width="130" >材质</th>
        <th field="SPECIFICATION"  width="130" >规格</th>
        <th field="PRPRICE" sortable="true" width="100" >进价(元)</th>
        <th field="PRQUANTITY" sortable="true" width="100" >数量(个)</th> 
        <th field="PRCOST" sortable="true" width="100" >合计(元)</th> 
        <th field="SUPPLIER"  width="200">供应商</th>
        <th field="PRDATE" sortable="true" width="130">生产日期</th>
        <th field="CHECHER"  width="140">检验员</th>
        <th field="WAREHOUSE" sortable="true" width="100">入仓号</th>
        <th field="REMARKS"  width="200">备注</th>      
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
  <form  id='condition' name='condition' action='BUYINTOWAREHOUSE!export' method="post"> 
      <input type="text" id='s_name' name="s_name" >
        <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search"  id="btn" plain="true" >产品名搜索</a>
        <a href="javascript:cleanAndReset()" class="easyui-linkbutton" iconCls="icon-reload"  plain="true" >清空搜索</a>
        <a href="javascript:void(0)" onclick="CreateFormPage('打印', $('#dg'))" class="easyui-linkbutton" iconCls="icon-print"  plain="true" >打印</a>        
        </form>
  </div>
  </div>
 </div> 
  <div id="dlg" class="easyui-dialog" style="width:600px;height:350px;padding:10px 20px"
    closed="true" buttons="#dlg-buttons">
     <form id=fm method="post">
       <table>
        <tr>
          <td >清单编号:
          </td>
           <td><input type="text" placeholder="自动生成"  disabled name="buyIntoWarehouse.inid" id="INID" class=easyui-validatebox >
          </td>
          <td>产品编号:
          </td>       
          <td><input type="text" name="buyIntoWarehouse.prid"  id="PRID"  required="true" class=easyui-validatebox></input> 
          </td>
        </tr>
        <tr>
          <td>产品名:
          </td>
           <td><input type="text" name="buyIntoWarehouse.prname"  id="PRNAME" required="true" class=easyui-validatebox >
          </td>
          <td>类别:
          </td>
           <td><input type="text" name="buyIntoWarehouse.prkind"  id="PRKIND" class=easyui-validatebox >
          </td>
        </tr>
         <tr>
          <td>材质:
          </td>
           <td><input type="text" name="buyIntoWarehouse.material"  id="MATERIAL" class=easyui-validatebox >
          </td>
          <td>规格:
          </td>
           <td><input type="text" name="buyIntoWarehouse.specification"  id="SPECIFICATION" class=easyui-validatebox >
          </td>
        </tr>
       <tr>
          <td>进价(元):
          </td>
           <td><input type="text" name="buyIntoWarehouse.prprice"   id="PRPRICE" class=easyui-numberbox >
          </td>
           <td>数量(个):
          </td>
           <td><input type="text" name="buyIntoWarehouse.prquantity"  id="PRQUANTITY" required="true" class=easyui-numberbox >
          </td>
        </tr>
        <tr>
          <td>总价(元):
          </td>
           <td><input type="text" name="buyIntoWarehouse.prcost"  placeholder="自动计算，无需输入" disabled id="PRCOST" class=easyui-numberbox>
          </td>
        </tr>
        <tr>
          <td>供应商:
          </td>         
          <!--  <td>
	        <select size="1" class="easyui-combobox" name="buyIntoWarehouse.supplier"  id="SUPPLIER" style="width:155px;">	        	
	        	<option value="河东区三原电力有限公司" >河东区三原电力有限公司</option>
	        	<option value="俊峰铸造厂">俊峰铸造厂</option>
	        	<option value="江南制造总局" selected ="selected">江南制造总局</option>
	        </select>           
          </td> -->
               <td>
	        <select size="1" class="easyui-combobox" name="buyIntoWarehouse.supplier"  id="SUPPLIER" style="width:173px;">	        		        	
	        	<c:forEach items="${li2}" var="item"> 	        		        		        	
	        	 <option value="${item.name}">${item.name}</option>   
	        	</c:forEach>   
	        </select>           
          </td>
           <td>采购日期:
          </td>
           <td><input type="text" name="buyIntoWarehouse.prdate"  id="PRDATE" required="true" editable="false" class="easyui-datebox" >
          </td>
        </tr>
        <tr>
          <td>检验员:
          </td>
           <td><input type="text" name="buyIntoWarehouse.checher"  required="true"  id="CHECHER" class=easyui-validatebox >
          </td>
           <td>入仓号:
          </td>
           <!--td><input type="text" name="produceIntoWarehouse.warehouse"  id="WAREHOUSE" required="true" class=easyui-validatebox >
          </td-->
          <td>
	        <select class="easyui-combobox" name="buyIntoWarehouse.warehouse"  id="WAREHOUSE" style="width:173px;">
			<option value="1号仓库">1号仓库</option>
			<option value="2号仓库">2号仓库</option>
			<option value="3号仓库">3号仓库</option>
			<option value="4号仓库">4号仓库</option>
			<option value="5号仓库" selected ="selected">5号仓库</option>
			<option value="6号仓库">6号仓库</option>
			<option value="7号仓库">7号仓库</option>
			<option value="8号仓库">8号仓库</option>
			<option value="9号仓库">9号仓库</option>	
			<option value="10号仓库">10号仓库</option>
			</select>
		</td>	
        </tr>
        <tr>
          <td valign="top">备注：
          </td>
           <td colspan="3"><textarea rows="4" cols="45" name="buyIntoWarehouse.remarks" id="REMARKS"></textarea>
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