<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>分类列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

  </head>
  
  <body style="padding-top: 50px;">
<center>
<h1>分类列表</h1>
<table class="layui-table" lay-data="{width: 912, url:'/note/category/getList.action', id:'categoryTable'}" lay-filter="category">
  <thead>
    <tr>
      <th lay-data="{field:'id', width:100, sort: true, fixed: true}">编号</th>
      <th lay-data="{field:'categoryName', width:200}">分类名称</th>
      <th lay-data="{field:'desc', width:300}">分类描述</th>
      <th lay-data="{field:'createdTime', sort: true, width:180}">创建时间</th>
      <th lay-data="{fixed: 'right', width:120, align:'center', toolbar: '#category'}"></th>
    </tr>
  </thead>
</table>
</center>
 
<script type="text/html" id="category">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

  </body>
  <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
layui.use('table', function(){
  var table = layui.table;
  var $ = layui.$;
  //监听工具条
  table.on('tool(category)', function(obj){
    var data = obj.data;
    if(obj.event === 'del'){
      layer.confirm('删除该分类， 该分类下的笔记都将删除， 确认操作？', function(index){
        $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/category/del.action",
            data : 'id=' +  obj.data.id,
            dataType : 'text',
            success : function(resData) {
            }
        });
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
        layer.alert(
                '<input type="text" class="layui-input" value="' + data.categoryName + '" id="categoryName" placeholder="请输入新的分类名称"><textarea class="layui-textarea" style="margin-top: 10px;" id="desc" placeholder="请输入新的分类描述">' + data.desc + '</textarea>', {
                    title: '编辑分类信息'
                        ,shade: false
             },function(index){
            	 data.categoryName = $("#categoryName").val();
            	 data.desc = $("#desc").val();
                 $.ajax({
                     headers: { 
                         'Accept': 'application/json',
                         'Content-Type': 'application/json' 
                     },
                     type : "POST",
                     url : "${pageContext.request.contextPath}/category/update.action",
                     data : JSON.stringify(data),
                     dataType : 'json',
                     success : function(resData) {
                    	layer.close(index);
                    	table.reload('categoryTable', {
                    		  url: '/note/category/getList.action'
                    		  ,where: {} //设定异步数据接口的额外参数
                    		});
                     }
                 });
            });
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('categoryTable')
      ,data = checkStatus.data;
      layer.alert(JSON.stringify(data));
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('categoryTable')
      ,data = checkStatus.data;
      layer.msg('选中了：'+ data.length + ' 个');
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('categoryTable');
      layer.msg(checkStatus.isAll ? '全选': '未全选')
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>
</html>
