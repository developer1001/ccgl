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
<title>Insert title here</title>
</head>
<body>  
   <img alt="库存数据图表" src="testChartAction" id="chart" > <!--  style="cursor: pointer;" -->
     
<!--     <script>  
  $("#chart").click(function(){  
//alert("ddd");  
$(this).attr("src","testChartAction?time="+new Date());     
  });  
  </script>  --> 
 </body>  
</html>