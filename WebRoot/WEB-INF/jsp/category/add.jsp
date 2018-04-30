<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
  </head>
  <body style="padding: 10px;">
    <form class="layui-form" action="${pageContext.request.contextPath}/category/create.action" method="post">
      <div class="layui-form-item">
        <h1 style="text-align: center;">新增分类</h1>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">分类名称</label>
        <div class="layui-input-inline">
          <input type="text" name="categoryName" required lay-verify="required" placeholder="请输入分类名称" autocomplete="off" class="layui-input">
        </div>
      </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">分类描述</label>
	    <div class="layui-input-block">
	      <textarea placeholder="请输入内容" name="desc" required lay-verify="required" class="layui-textarea"></textarea>
	    </div>
	  </div>
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="formDemo">新增</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
    </form>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script>
    layui.use('form', function(){
      var form = layui.form,$ = layui.jquery;
      //监听提交
      form.on('submit(formDemo)', function(data){
      });
    });
    </script>
  </body>
</html>

