<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String path=request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
/*    System.out.println(basePath);
 */   %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>重新登陆</title>
<base href="<%=basePath%>">  
<meta http-equiv="refresh" content="0;url=../Ccgl/admin.jsp">
</head>
<body align="center" bgcolor="#E0EEE0">
 <div style="padding-top:100px;"><a href="/Ccgl/admin.jsp" >请重新登陆</a></div>
                                 
</body>
</html>