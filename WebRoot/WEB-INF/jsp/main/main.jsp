<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>NOTE</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">NOTE</div>
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath}/main/main.action">首页</a>
      </li>
      <li class="layui-nav-item">
        <a href="javascript:;">分类管理</a>
        <dl class="layui-nav-child">
          <dd><a href="${pageContext.request.contextPath}/category/showMyCategory.action" target="bodyContent">分类列表</a></dd>
          <dd><a href="${pageContext.request.contextPath}/category/addCategory.action" target="bodyContent">新增分类</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item">
        <a href="javascript:;">笔记管理</a>
        <dl class="layui-nav-child">
          <dd><a href="${pageContext.request.contextPath}/note/list.action" target="bodyContent">我的笔记</a></dd>
          <dd><a href="${pageContext.request.contextPath}/note/add.action" target="bodyContent">新增笔记</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item">
        <a href="javascript:;">思维导图</a>
        <dl class="layui-nav-child">
          <dd><a href="${pageContext.request.contextPath}/mind/create.action" target="bodyContent">新建思维导图</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="${pageContext.request.contextPath}/images/default_avatar.png" class="layui-nav-img">${user.name }</a>
        <dl class="layui-nav-child">
          <dd><a href="${pageContext.request.contextPath}/user/profile.action" target="bodyContent">基本资料</a></dd>
          <dd><a href="${pageContext.request.contextPath}/user/updatePassword.action" target="bodyContent">修改密码</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/logout.action">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-body" style="left: 0px;">
    <!-- 内容主体区域 -->
    <iframe name="bodyContent" src="${pageContext.request.contextPath}/main/content.action" style="border: 0; width: 100%; height: 100%;">
    </iframe>
  </div>
  
  <div class="layui-footer" style="left: 0px;">
    <!-- 底部固定区域 -->
    © NOTE 小茄子 DESIGN
  </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
});
</script>
</body>
</html>
