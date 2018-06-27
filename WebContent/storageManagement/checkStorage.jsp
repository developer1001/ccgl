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
<%@ page import ="com.dyj.model.Customer" %>
<%@ page import ="com.dyj.dao.CustomerDao" %>
<%
	Connection con=null;
	DbUtil dbUtil=new DbUtil();
	try{
		con=dbUtil.getCon();
		SupplierDao supplierdao = new SupplierDao();
		List<Supplier> li2 = supplierdao.getSuppliers(con);
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		req.setAttribute("li2", li2);
		CustomerDao customerdao = new CustomerDao();
		List<Customer> li = customerdao.getCustomers(con);
		HttpServletRequest requ = (HttpServletRequest)ServletActionContext.getRequest();
		requ.setAttribute("li", li);
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
	<script type="text/javascript" src="jquery/jquery.jqprint-0.3.js"></script>	
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/print.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>库存盘点</title>
<script type="text/javascript">
	var url;
		
		//按名字搜索
	    function search(){
	    	$('#dg').datagrid('load',{
	    		s_name:$('#s_name').val(),
	    		s_alarm:$('#s_alarm').val(),
	    		s_alarmto:$('#s_alarmto').val(),
	    	});
	    }
	    
	    //清空搜索栏并且重新列出
	    function cleanAndReset(){	 
	   $('#s_name').val("");
	   s_alarm:$('#s_alarm').val("");
	   s_alarmto:$('#s_alarmto').val("");
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
	    		$.post("CHECKSTORAGE!delete",{delIds:ids},function(result){	    		
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
	    	$("#dlg").dialog("open").dialog("setTitle","添加库存盘点清单");
	    	url="CHECKSTORAGE!save";
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
	    	$("#OVERFLOW").val("");
	    	$("#PRLOSE").val("");	
	    	$("#INSTORAGE").val("");
	    	$("#OUTSTORAGE").val("");
	    	$("#PRQUANTITY").val("");	    	    	
	    	$("#SUPPLIER").val("");	    	
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
	    	$("#dlg").dialog("open").dialog("setTitle","修改库存盘点清单");	    	
	    	$("#PRID").val(row.PRID);
	    	$("#PRNAME").val(row.PRNAME);
	    	$("#PRKIND").val(row.PRKIND);
	    	$("#MATERIAL").val(row.MATERIAL);
	    	$("#SPECIFICATION").val(row.SPECIFICATION);	 
	    	$("#OVERFLOW").val(row.OVERFLOW);
	    	$("#PRLOSE").val(row.PRLOSE);
	    	$("#INSTORAGE").val(row.INSTORAGE);
	    	$("#OUTSTORAGE").val(row.OUTSTORAGE);
	    	$("#PRQUANTITY").val(row.PRQUANTITY);	    		    	
	    	$("#SUPPLIER").val(row.SUPPLIER);	    	
	    	$("#WAREHOUSE").val(row.WAREHOUSE);
	    	$("#REMARKS").val(row.REMARKS);	 
	    	url="CHECKSTORAGE!save?INID="+row.INID;
	    }
	    
	    //导出清单
	    function exportExcel(){
			$('#condition').submit();
		}
	    
	/*      function print(){
	    	$("#dg")jqprint({
	    	     debug: false, //如果是true则可以显示iframe查看效果（iframe默认高和宽都很小，可以再源码中调大），默认是false
	    	     importCSS: true, //true表示引进原来的页面的css，默认是true。（如果是true，先会找$("link[media=print]")，若没有会去找$("link")中的css文件）
	    	     printContainer: true, //表示如果原来选择的对象必须被纳入打印（注意：设置为false可能会打破你的CSS规则）。
	    	     operaSupport: true//表示如果插件也必须支持歌opera浏览器，在这种情况下，它提供了建立一个临时的打印选项卡。默认是true
	    	});
	    }  */
	    	 
	/*     function showHide(){	  	  
			var a = document.getElementById('s_alarmto').value;
			var b = document.getElementById('s_alarm').value;
			if(a!=null && b!= null ){
	 		   if(a < b ){
	 			  //alert("a="+a+"同时b="+b);
				//document.getElementById("btn11").disabled=true;
				$("#btn11").attr("disabled","true");
				}
				if(a>b){
					$("#btn11").attr("disabled","false");
				//document.getElementById("btn11").disabled=false;
				
				}
			}
		} */
  </script>
  
  <style type="text/css">
  #PRID,#PRNAME,#INSTORAGE,#OUTSTORAGE{
  background-color:#EBEBE4;	
  }
  </style>
  
</head>
<body style="margin:2px">
  <table  class=easyui-datagrid id="dg" title="库存盘点" remoteSort="false" fitColumns="true" pagination="true" rownumbers="true"
    fit="true" url="CHECKSTORAGE" toolbar="#tb" >
    <thead>
      <tr>
        <!-- <th field="cb" checkbox="true"></th>  -->
        <th field="INID" sortable="true" width="60">序号</th>
        <th field="PRID" sortable="true" width="130">产品编号</th>
        <th field="PRNAME" sortable="true" width="150">产品名</th>
        <th field="PRKIND"  width="150" >类别</th>
        <th field="MATERIAL"  width="150" >材质</th>
        <th field="SPECIFICATION"  width="150" >规格</th>
        <th field="OVERFLOW" sortable="true" width="100" >报溢(个)</th>
        <th field="PRLOSE" sortable="true" width="100" >报损(个)</th> 
        <th field="INSTORAGE" sortable="true" width="100" >入库(个)</th> 
        <th field="OUTSTORAGE" sortable="true" width="100">出库(个)</th>
        <th field="PRQUANTITY" sortable="true" width="130">库存(个)</th>
        <th field="SUPPLIER" sortable="true" width="170">合作商</th>
        <th field="WAREHOUSE" sortable="true" width="100">仓库号</th>
        <th field="REMARKS"  width="200">备注</th>      
       </tr>
 </table>
  <div id=tb>
  <div>
  <div  style="float: left">
    <!--a href="javascript:addopendialog()" class=easyui-linkbutton iconCls="icon-add" plain="true">添加</a-->
    <a href="javascript:modifyopendialog()" class=easyui-linkbutton iconCls="icon-edit" plain="true">修改</a>
    <!--a href="javascript:del()" class=easyui-linkbutton iconCls="icon-remove" plain="true">删除</a-->
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="exportExcel()">导出清单</a>
  </div>
  <div>
  <form  id='condition' name='condition' action='CHECKSTORAGE!export' method="post"> &nbsp;&nbsp;&nbsp;
       <font color="red">库存报警</font>(大于等于)<input type="text" id="s_alarm" name="s_alarm" class=easyui-numberbox>&nbsp;--
  (小于等于)<input type="text" id="s_alarmto" name="s_alarmto" class=easyui-numberbox>
       产品名：<input type="text" id='s_name' name="s_name" >
        <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search"  id="btn" plain="true" >查询</a>
        <a href="javascript:cleanAndReset()" class="easyui-linkbutton" iconCls="icon-reload"  plain="true" >重置查询</a>
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
           <td><input type="text" placeholder="自动生成"  disabled name="checkStorage.inid" id="INID" class=easyui-validatebox >
          </td>
          <td>产品编号:
          </td>       
          <td><input type="text" name="checkStorage.prid"  id="PRID" readonly  class=easyui-validatebox></input> 
          </td>
        </tr>
        <tr>
          <td>产品名:
          </td>
           <td><input type="text" name="checkStorage.prname" readonly  id="PRNAME"  class=easyui-validatebox >
          </td>
          <td>类别:
          </td>
           <td><input type="text" name="checkStorage.prkind"  id="PRKIND" class=easyui-validatebox >
          </td>
        </tr>
         <tr>
          <td>材质:
          </td>
           <td><input type="text" name="checkStorage.material"  id="MATERIAL" class=easyui-validatebox >
          </td>
          <td>规格:
          </td>
           <td><input type="text" name="checkStorage.specification"  id="SPECIFICATION" class=easyui-validatebox >
          </td>
        </tr>
       <tr>
          <td>报溢(个):
          </td>
           <td><input type="text" name="checkStorage.overflow" required="true"  id="OVERFLOW" class=easyui-validatebox >
          </td>
           <td>报损(个):
          </td>
           <td><input type="text" name="checkStorage.prlose" required="true" id="PRLOSE"  class=easyui-validatebox >
          </td>
        </tr>
         <tr>
          <td>入库(个):
          </td>
           <td><input type="text" name="checkStorage.instorage" readonly  id="INSTORAGE" class=easyui-validatebox >
          </td>
           <td>出库(个):
          </td>
           <td><input type="text" name="checkStorage.outstorage" readonly  id="OUTSTORAGE"  class=easyui-validatebox >
          </td>
        </tr>
        <tr>
         <td>库存(个):
          </td>
           <td><input type="text" name="checkStorage.prquantity" placeholder="自动计算，无需输入" disabled id="PRQUANTITY"  class=easyui-validatebox >
          </td>
          <td>合作商:
          </td>         
           <td>
	        <select size="1" class="easyui-combobox" name="checkStorage.supplier"  id="SUPPLIER" style="width:173px;">
	        	<!-- <option value="三条石金属铸造厂">三条石金属铸造厂</option>	        	
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
	        	<option value="中铁二十五局集团有限公司">中铁二十五局集团有限公司</option> -->
	        	 <c:forEach items="${li}" var="item"> 	        		        		        	
	        	 <option value="${item.customercompany}">${item.customercompany}</option>   
	        	</c:forEach> 
	        	<c:forEach items="${li2}" var="item"> 	        		        		        	
	        	 <option value="${item.name}">${item.name}</option>   
	        	</c:forEach> 
	        </select>
           <!--input type="text" name="produceIntoWarehouse.manufacturer" value="三条石金属铸造厂" placeholder="三条石金属铸造厂" disabled id="MANUFACTURER" class=easyui-validatebox -->
          </td>          
        </tr>
        <tr>        
           <td>仓库号:
          </td>
           <!--td><input type="text" name="produceIntoWarehouse.warehouse"  id="WAREHOUSE" required="true" class=easyui-validatebox >
          </td-->
          <td>
	        <select class="easyui-combobox" name="checkStorage.warehouse"  id="WAREHOUSE" style="width:173px;">
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
           <td colspan="3"><textarea rows="4" cols="45" name="checkStorage.remarks" id="REMARKS"></textarea>
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