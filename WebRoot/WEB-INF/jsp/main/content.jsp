<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>内容</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="https://fonts.googleapis.com/css?family=Rubik+Mono+One" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css">

</head>

<body>

	<p id="offscreen-text" class="offscreen-text"></p>
	<p id="text" class="text"></p>
	<svg id="svg"> </svg>
	<input type="text" class="input" id="input" />
	<script src='${pageContext.request.contextPath}/js/CSSPlugin.min.js'></script>
	<script src='${pageContext.request.contextPath}/js/EasePack.min.js'></script>
	<script src='${pageContext.request.contextPath}/js/TweenLite.min.js'></script>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>

</body>
</html>
