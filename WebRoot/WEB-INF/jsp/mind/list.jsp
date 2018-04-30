<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的笔记</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<style>

.note-body {
    display: inline-block;
    min-width: 800px;
    min-height: 600px;
    position: absolute;
    padding: 80px;
}
.my-title {
    list-style: none;
    background: #ecf0f1;
    padding-bottom: 20px;
}

.my-title li {
    display: inline-block;
    width: 200px;
    font-size: 20px;
}
.my-content {
    list-style: none;
}

.my-content li {
    display: inline-block;
    width: 200px;
    font-size: 14px;
    height: 30px;
    line-height: 30px;
}

.my-content li img {
    width: 25px;
    margin-right: 5px;
    cursor: pointer;
}

</style>
<body>
	<div class="content" style="display: inline-block;">
		<div class="list">
			<ul>
				<c:choose>
					<c:when test="${not empty categories}">
						<c:forEach var="c" items="${categories}">
							<li>
								<a style="text-decoration: none;" href="${pageContext.request.contextPath}/note/list.action?categoryId=${c.id}"><p class="title">${c.categoryName }</p></a>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
    <div class="note-body">
        <div class="layui-collapse">
                   <ul class="my-title">
                    <li>编号</li>
                    <li>标题</li>
                    <li>创建时间</li>
                    <li>操作</li>
                   </ul>
            <c:forEach items="${notes}" var="n" varStatus="i">
                <div class="layui-colla-item">
                   <ul class="my-content">
                    <li>${i.index + 1}</li>
                    <li>${n.title }
                    <div id="content${n.id }" style="display: none;">${n.content }</div>
                    
                    <li>${n.createdTime }</li>
                    <li>
                    <img onclick="view('${n.id }')" src="${pageContext.request.contextPath}/images/view.png">
                    <img onclick="edit('${n.id }')" title="编辑" src="${pageContext.request.contextPath}/images/edit.png">
                    <img onclick="exportworld('${n.id }','${n.title }')" title="导出成world" src="${pageContext.request.contextPath}/images/export.png">
                    <img onclick="del('${n.id }')" title="删除" src="${pageContext.request.contextPath}/images/del.png">
                    </li>
                   </ul>
                </div>
            </c:forEach>
        </div>
    </div>
	
	<script src="${pageContext.request.contextPath}/js/style.js"></script>
	<script src="${pageContext.request.contextPath}/js/FileSaver.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.wordexport.js"></script>

	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$('.list ul li p').clickdown();
			$('.list-se p[class=title]').clickup();
			$('.list>ul>li').ad();
		});
        function exportworld(id, title) {
        	$("#content" + id).wordExport(title);
        }
        
        function del(id){
        	if(confirm("是否确认删除？")){
        		location.href = "${pageContext.request.contextPath}/note/del.action?&id=" + id;
        	}
        }
        function view(id){
            location.href = "${pageContext.request.contextPath}/note/view.action?&id=" + id;
        }
        function edit(id){
            location.href = "${pageContext.request.contextPath}/note/edit.action?&id=" + id;
        }        
	</script>
</body>
</html>
