<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人资料</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
  </head>
  <body style="padding: 40px;">
    <form class="layui-form" action="">
      <div class="layui-form-item">
        <h1>个人资料</h1>
      </div>
      <div class="layui-form-item">
        <label>用户名: ${loginUser.name }</label>
      </div>
      <div class="layui-form-item">
        <label >邮箱账号: ${loginUser.email }</label>
      </div>
      <div class="layui-form-item">
        <label >创建时间: ${loginUser.createdTime }</label>
      </div>
    </form>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
  </body>
</html>
