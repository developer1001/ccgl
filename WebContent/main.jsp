<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<title>三条石金属铸造厂库存管理系统</title>
<% 
    if(session.getAttribute("currentUser")==null){
    	response.sendRedirect("index.jsp");
    	return;
    }
%>
<%
 response.setHeader("Pragma","No-cache");
 response.setHeader("Cache-Control","No-cache");
 response.setDateHeader("Expires", -1);
 response.setHeader("Cache-Control", "No-store");
%>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<style>
		@-webkit-keyframes fadetoggle {
		  0%{    
		    opacity: 1;
		  }  
		  50%{
		     opacity: 0;
		  }
		  
		  100%{ 
		  	opacity: 1;
		  }
		}
		 #headword{
		 font-size:38px;
		 color:#fff;
		 	margin: 0 auto;
		 	height:72px;
		 	width: 700px;
		  display:block;  
		  background: #87CEEB;
		  -webkit-animation-name:fadetoggle;/*动画名称*/
		  -webkit-animation-duration: 3s;/*动画时间*/
		  -webkit-animation-timing-function:ease-out;/*动画方式  
		  * 主要让元素根据时间的推进来改变属性值的变换速率，简单点说就是动画的播放方式。
		  * 
		    linear	动画从头到尾的速度是相同的。	测试
			ease	默认。动画以低速开始，然后加快，在结束前变慢。	测试
			ease-in	动画以低速开始。	测试
			ease-out	动画以低速结束。	测试
			ease-in-out	动画以低速开始和结束。	测试
			cubic-bezier(n,n,n,n)	在 cubic-bezier 函数中自己的值。可能的值是从 0 到 1 的数值。
		  * */
		  -webkit-animation-delay:0;/*动画延迟*/
		  -webkit-animation-iteration-count:infinite;/*动画次数*/
		 /*
		  * 其值通常为整数，但也可以使用带有小数的数字，其默认值为1，这意味着动画将从开始到结束只播放一次。
		  * 
		  * 如果取值为infinite，动画将会无限次的播放。
		  * 
		  */  
		  -webkit-animation-direction:alternate;/*属性主要用来设置动画播放方向 1、normal是默认值，如果设置为normal时，动画的每次循环都是向前播放；
		2、另一个值是alternate，他的作用是，动画播放在第偶数次向前播放，第奇数次向反方向播放。*/
		
		  -webkit-animation-fill-mode: both;/*
		   animation-fill-mode属性定义在动画开始之前和结束之后发生的操作。主要具有四个属性值：none、forwards、backwords和both。其四个属性值对应效果如下：
		属性值
		效果
		none  	默认值，表示动画将按预期进行和结束，在动画完成其最后一帧时，动画会反转到初始帧处
		forwards 	表示动画在结束后继续应用最后的关键帧的位置
		backwards 	会在向元素应用动画样式时迅速应用动画的初始帧
		both 	元素动画同时具有forwards和backwards效果
		
		                                   
		                                     */	
		}
	</style>
	<style type="text/css">	
		
		#btnlogout{	 
		margin-top:10px;
		margin-right:18px;            
         padding:6px auto;
         border: 0px ;
         cursor: pointer;
         font-family: "arial";
         font-size: 12px;	
	}
	a:hover{
		background-color:red;
	}
	
	article,aside,figure,footer,header,hgroup,menu,nav,section{
	display:block;
}
a{
	background-color:#DB5705;
	border-radius:8px 8px 8px 8px;
	box-shadow:0 9px 0 #DB1F05,0 9px 25px rgba(0,0,0,0.7);
	color:#FFFFFF;
	display:block;
	font-family:'微软雅黑';
	font-size:12px;
	font-weight:700;
	margin:10px right;
	padding:4px;
	position:relative;
	text-align:center;
	text-decoration:none;
	transition:all 0.1s ease 0s;
	width:60px;
}
a:active{
	box-shadow:0 3px 0 #DB1F05,0 3px 6px rgba(0,0,0,0.9);
	position:relative;top:6px;
}
#leftimg{
filter:alpha(opacity=70); 
-moz-opacity:0.7;
 -khtml-opacity:0.7; 
 opacity: 0.7;
}
	</style>
	<script type="text/javascript">
	  $(function(){
	 
		  var treeDate=[{		  
			 text:"系统菜单",
			 iconCls:"icon-box_picture",
			  children:[{
				  text:"公司资料",
				  iconCls:"icon-pdf",
				  checked:true,	
				 
				  attributes:{
					  url:"sysmenu/companyInformation.jsp",
					 
				  }
			  },{
				  text:"系统日志",
				   iconCls:"icon-application_xp_terminal", 
				  attributes:{
					  url:"sysmenu/log.jsp"
				  }
			  },
			  {
				  text:"账号管理",
				   iconCls:"icon-lock", 
				  attributes:{
					  url:"sysmenu/adminManage.jsp"
				  }
			  },
			  {
				  text:"入库管理",
				   iconCls:"icon-20130406125519344_easyicon_net_16", 
				  state:"open",
				  children:[
				     /*        {
					  text:"采购计划",
					   iconCls:"icon-book_open", 
					  attributes:{
						  url:"incomingManagement/buyPlan.jsp"
					  }
				  },  */
				  {text:"生产入库",
				   iconCls:"icon-build", 
					  attributes:{
						  url:"incomingManagement/produceIntoWarehouse.jsp"}
						  },
					{text:"采购入库",
					 iconCls:"icon-build", 
					  attributes:{
						  url:"incomingManagement/buyIntoWarehouse.jsp"}
						  },
				    {text:"销售退货入库",
				     iconCls:"icon-build", 
					  attributes:{
						  url:"incomingManagement/salesReturn.jsp"}
						  },
				  {text:"退料入库",
				   iconCls:"icon-build", 
					  attributes:{
						  url:"incomingManagement/materialReturn.jsp"}}]
			  },
			  {
				  text:"出库管理",
				   iconCls:"icon-20130406125647919_easyicon_net_16", 
				  state:"open",
				  children:[{
					  text:"销售出库",
					   iconCls:" icon-house_go", 
					  attributes:{
						  url:"outcomingManagement/saleOut.jsp"
					  }
				  },{text:"采购退货出库",
				   iconCls:" icon-house_go", 
					  attributes:{
						  url:"outcomingManagement/buyReturnOut.jsp"}
						  },
				  {text:"用料出库",
				   iconCls:" icon-house_go", 
					  attributes:{
						  url:"outcomingManagement/consumeOut.jsp"}}]
			  },
			  {
				  text:"库存管理",
				   iconCls:"icon-monitor", 
				  state:"open",
				  children:[{
					  text:"库存盘点",
					   iconCls:" icon-application_home", 
					  attributes:{
						  url:"storageManagement/checkStorage.jsp"
					  }
				  },/*{text:"库存报警",
				  iconCls:"icon-2012080404218", 
					  attributes:{
						  url:"storageManagement/storageAlarm.jsp"}
						  },*/
				   {text:"数据统计",
				  iconCls:"icon-chart_bar", 
				 
					  attributes:{
						  url:"storageManagement/countOutAndInto.jsp"}} 
						  
				  ]
			  },
			/*   {
				  text:"财务管理",
				  state:"open",
				   iconCls:"icon-laptop", 
				  children:[{
					  text:"资金核算",
					   iconCls:"icon-calculator", 
					  attributes:{
						  url:"financialManagement/moneyCheck.jsp"
					  }
				  },
				  {text:"利润统计",
				   iconCls:"icon-calculator", 
					  attributes:{
						  url:"financialManagement/profitsCount.jsp"}}]
			  }, */
			  {
				  text:"合作商",
				   iconCls:"icon-people",
				  state:"open",
				  children:[{
					  text:"供应商",
					   iconCls:"icon-user",
					  attributes:{
						  url:"partner/Supplier.jsp"
					  }
				  },
				  {text:"采购商",
				   iconCls:"icon-client",
					  attributes:{
						  url:"partner/customer.jsp"}}]
			  },
			  {
				  text:"系统维护",
				  iconCls:"icon-1012333",
				  state:"open",
				  children:[{
					  text:"数据备份",
					    iconCls:"icon-database_add",
					  
					  attributes:{
						  url:"sysMaintain/dbBakup.jsp"
						  
					  }
				  },{text:"数据还原",
				    iconCls:"icon-database_refresh",
				   
					  attributes:{
						  url:"sysMaintain/dbRestore.jsp"}
						  },
				  {text:"帮助",
				   iconCls:"icon-help",
					  attributes:{
						  url:"help/help.jsp"}}]
			  }
			  ]
		  }];
			   
		 
		  $("#tree").tree({
			 data:treeDate,
		     lines:true,
		     onClick:function(node){
		    	 if(node.attributes){
		    		 openTab(node.text,node.attributes.url);
		    	 }
		     }
		     
		  });
		  function openTab(text,url){
			  if($("#tabs").tabs("exists",text)){
				  $("#tabs").tabs("select",text);
			  }else{
				  var content="<iframe src="+url+" frameborder='0' scrolling='auto' style='width:100%;height:100%'></frame>"
			  $("#tabs").tabs("add",{
				  title:text,
				  content:content,
				  closable:true
			  });			  
			  }
		  }
	  });	  
	</script>
    
</head>
   <body class="easyui-layout">
      <div region="north" style="height:80px;background-color:#87CEEB">
      <div align= "left" style="padding-top:2.5px;float:left;"><img id="leftimg" src="images/left.jpg" width="180px"  height="73px" /></div>
      <div align="center" style="width:70%; padding-top:6px;float:left;"><span id="headword"><i><b>三条石金属铸造厂库存管理信息系统</b></i></span><!--img src="images/mainhead.jpg" height="76px" /--></div>
      <div align="right" style="padding:5px 5px"><a href="/Ccgl/login!loginOut" >退出系统<!--img src="images/admin_exit.jpg"/-->
       <!--input type="button" id="btnlogout" value="退出系统" style="background: #f90"--></a></div>
      <div style="padding-top:16px;padding-right: 20px" align="right">欢迎您：
      <font color="blue">${currentUser.userName}</font></div>
    </div>
    <div region="center">
    <div class="easyui-tabs" id="tabs" fit="true" border="false">
    <div title=首页 style="overflow:hidden">
      <!--div align="left" style="padding-top: 40px;padding-left:90px;">
      	<div>
      <b>根据《中华人民共和国安全生产法》，为确保本公司安全生产的落实，为此建立安全生产责任制，特对本职务安全生产负有的责任明确如下：</b></br></br></br></br>
        1、熟悉国家安全生产相关法律、法规，公司安全生产制度和安全相关标准，熟悉并掌握仓库管理必需的业务知识，对仓库的安全负全部管理责任。</br></br>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
        2、了解库存物品的型号、特性和保管与搬运知识，按照5S（整理、整顿、清扫、清洁、素养）的管理模式，对在库物品进行分类定置存放。</br></br>
        3、合理、有序安排货物堆放位置，保持仓库内消防及人行通道畅通。</br></br>
        4、易燃、易爆、有毒、有害等危险物品必须严格按照产品说明书的要求，与一般物品分开存放，并有明显标识，张贴相应化学物品安全数据清单。</br></br>
		严格执行危险物品领用发放制度，在发放前必须向领料人阐明该物品的物理、化学特性，危害性以及预防措施。</br></br>
        5、负责仓库内部的防火工作，任何人不得携带火源、火种进入库区，定期检查防火设施如灭火器、消防栓箱等，发现问题及时更换或报告主管。</br></br>
        6、严格落实防盗措施，凡有门锁的库房，人员离开时必须加锁，钥匙必须授权管理，严禁对未授权人传授钥匙。</br></br>
        7、物品出库遵循“先入先出”的原则，严防物品过期变质。</br></br>
        8、保证仓库的良好通风，定期检查仓库内的用电设施是否完好，发现问题及时报告。</br></br>
        9、参与公司安全生产事故应急预案的培训和演练工作，并反馈演练意见。在岗位发生事故时第一时间进行处置，并向公司领导报告，在不</br></br>
		危及自身安全的情况下参加应急救援工作。</br></br>
        10、事故发生后配合接受相关部门事故调查，认真详实介绍事故经过，不得谎报瞒报。</br></br>
        11、定期安全自查和隐患整改工作，每天巡逻仓库、储罐等部位，发现隐患及时整改。</br></br>
        <span style="color:red">12、每次退出系统，请管理员规范操作：手动点击注销。</span>
		</div>
      </div-->
      <img src="images/shouye.jpg" height=100% width=100%; style="padding-top:3px;padding-left:3px">
    </div>
    </div>
    </div>
    <div region="west" style="width:180px;background-color:#E0FFFF" title="菜单栏" split="true">
      <ul id="tree" style="font-size:19px">
      </ul>
    </div>
    
    <div region="south" style="font-size:12px;height:20px;padding-top:2px;background-color:#E0FFFF" align="center">
        <span style="color:green">Copyright&nbsp; ©&nbsp; 2014 &nbsp;天津市三条石金属铸造厂 All&nbsp; Rights&nbsp; Reserved &nbsp;津ICP备09007139号</span>&nbsp;&nbsp;
    	<!-- &nbsp;&nbsp;
    	联系电话：022-2561254&nbsp;&nbsp;&nbsp;&nbsp;邮箱：santiaoshi@163.com -->
    	&nbsp;&nbsp;&nbsp;&nbsp;
    <span id=localtime></span>
    </div>
    <script type="text/javascript">
function showLocale(objD)
{
	var str,colorhead,colorfoot;
	var yy = objD.getYear();
	if(yy<1900) yy = yy+1900;
	var MM = objD.getMonth()+1;
	if(MM<10) MM = '0' + MM;
	var dd = objD.getDate();
	if(dd<10) dd = '0' + dd;
	var hh = objD.getHours();
	if(hh<10) hh = '0' + hh;
	var mm = objD.getMinutes();
	if(mm<10) mm = '0' + mm;
	var ss = objD.getSeconds();
	if(ss<10) ss = '0' + ss;
	var ww = objD.getDay();
	//if  ( ww==0 )  colorhead="<font color=\"red\">";
	//if  ( ww > 0 && ww < 6 )  colorhead="<font color=\"red\">";
	//if  ( ww==6 )  colorhead="<font color=\"red\">";
	if  ( ww==0 )  colorhead="<font color=\"green\">";
	if  ( ww > 0 && ww < 6 )  colorhead="<font color=\"green\">";
	if  ( ww==6 )  colorhead="<font color=\"green\">";
	if  (ww==0)  ww="星期日";
	if  (ww==1)  ww="星期一";
	if  (ww==2)  ww="星期二";
	if  (ww==3)  ww="星期三";
	if  (ww==4)  ww="星期四";
	if  (ww==5)  ww="星期五";
	if  (ww==6)  ww="星期六";
	colorfoot="</font>"
	str = colorhead +"现在时间："+ yy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + "  " + ww + colorfoot;
	return(str);
}
function tick()
{
	var today;
	today = new Date();
	document.getElementById("localtime").innerHTML = showLocale(today);
	window.setTimeout("tick()", 1000);
}
tick();
</script>
    </body>
</html>