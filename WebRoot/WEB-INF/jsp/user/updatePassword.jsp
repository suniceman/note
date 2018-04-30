<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
  </head>
  <body style="padding: 20px;">
    <form class="layui-form" action="">
      <div class="layui-form-item">
        <h1 style="text-align: center;">修改密码</h1>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">原密码</label>
        <div class="layui-input-inline">
          <input type="password" name="oldpassword" required lay-verify="required" placeholder="请输入原密码" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
          <input type="password" name="password" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">确认新密码</label>
        <div class="layui-input-inline">
          <input type="password" name="repassword" required lay-verify="required" placeholder="请输入确认新密码" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="formDemo">立即更改</button>
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
    	  if (data.field.password !== data.field.repassword) {
    		  layer.msg('两次密码输入不相同，请重新输入');
    	  }else {
              $.ajax({
                  type : "post",
                  url : "${pageContext.request.contextPath}/user/changePassword.action",
                  data : "oldpassword=" + data.field.oldpassword + "&password=" + data.field.password,
                  dataType : "text",
                  success : function(resData) {
                      if (resData === 'success') {
                          layer.msg('修改密码成功，请重新登录！', {
                              icon: 1
                            }, function(){
                            	window.open("${pageContext.request.contextPath}/user/login.action","_top");
                            });
                      } else {
                          layer.msg('原密码，不正确，请重新输入');
                      }
                  }
              });
    	  }
    	return false;
      });
    });
    </script>
  </body>
</html>
