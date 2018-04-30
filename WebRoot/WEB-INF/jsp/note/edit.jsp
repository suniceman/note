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

<title>编辑笔记</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/design/css/trumbowyg.css">
<script src="${pageContext.request.contextPath}/assets/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/trumbowyg.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/plugins/base64/trumbowyg.base64.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/design/css/trumbowyg.css">
<style>
.note-body {
	display: inline-block;
	min-width: 800px;
	min-height: 600px;
	position: absolute;
	padding: 40px;
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

.note_label {
	font-size: 18px;
	width: 120px;
	padding-right: 30px;
}

.style_input {
	height: 38px;
	line-height: 1.3;
	line-height: 38px\9;
	border-width: 1px;
	border-style: solid;
	background-color: #fff;
	border-radius: 2px;
	border-color: #e6e6e6;
	outline: none;
}

.submit-buttom {
	border: 1px solid;
	border-radius: 3px;
	width: 120px;
	text-align: center;
	font-size: 18px;
	font-family: 微软雅黑;
	background-color: #009688;
	height: 40px;
	outline: none;
	color: white;
	cursor: pointer;
	display: inline-block;
}
</style>
<body>
	<div class="content" style="display: inline-block;">
		<div class="list">
			<ul>
				<c:choose>
					<c:when test="${not empty categories}">
						<c:forEach var="c" items="${categories}">
							<li><a style="text-decoration: none;"
								href="${pageContext.request.contextPath}/note/list.action?categoryId=${c.id}"><p
										class="title">${c.categoryName }</p></a></li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<div class="note-body">
		<form id="myNote" class="layui-form" method="post"
			action="${pageContext.request.contextPath}/note/updateNote.action">
			<div class="layui-form-item">
				<h1 style="text-align: center;">修改笔记</h1>
			</div>
			<label class="note_label">分类：</label> <select class="style_input"
				id="categoryId" name="categoryId">
				<option value="-1">请选择</option>
				<c:forEach items="${categories}" var="c">
					<option value="${c.id}"
						<c:if test="${c.id eq note.categoryId}">
                                     selected="selected"
                                </c:if>>${c.categoryName}</option>
				</c:forEach>
			</select> <br>
			<div style="padding-top: 20px;padding-bottom: 20px;">
				<label class="note_label">标题：</label><input id="title" type="text"
					value="${note.title }" style="width: 280px;" class="style_input"
					name="title" placeholder="请输入标题" />
			</div>

			<div class="layui-form-item">
				<label class="note_label">正文：</label>
				<div id="odiv" style="display:none;position:absolute;z-index:100;">
					<img src="${pageContext.request.contextPath}/assets/pic/sx.png"
						title="缩小" border="0" alt="缩小" onclick="sub(-1);" /> <img
						src="${pageContext.request.contextPath}/assets/pic/fd.png"
						title="放大" border="0" alt="放大" onclick="sub(1)" /> <img
						src="${pageContext.request.contextPath}/assets/pic/cz.png"
						title="重置" border="0" alt="重置" onclick="sub(0)" /> <img
						src="${pageContext.request.contextPath}/assets/pic/sc.png"
						title="删除" border="0" alt="删除"
						onclick="del();odiv.style.display='none';" />
				</div>
				<div onmousedown="show_element(event)" style="clear:both"
					id="customized-buttonpane" class="editor">${note.content }</div>
			</div>
			<input type="hidden" value="${note.id }" name="id"> <input
				type="hidden" id="content" name="content">
			<div class="layui-form-item">
				<input type="button" onclick="checkData()" class="submit-buttom"
					value="保存">
			</div>
		</form>
	</div>

	<script src="${pageContext.request.contextPath}/js/style.js"></script>

	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$('.list ul li p').clickdown();
			$('.list-se p[class=title]').clickup();
			$('.list>ul>li').ad();
		});
		function checkData() {
			if (document.getElementById("categoryId").value == -1) {
				alert("请选择分类");
				return false;
			}

			if (!document.getElementById("title").value) {
				alert("请输入标题");
				return false;
			}
			if (!document.getElementById("customized-buttonpane").innerHTML) {
				alert("请输入笔记正文");
				return false;
			}
			document.getElementById("content").value = document
					.getElementById("customized-buttonpane").innerHTML;
			document.getElementById("myNote").submit();
		}
	</script>
</body>
</html>
