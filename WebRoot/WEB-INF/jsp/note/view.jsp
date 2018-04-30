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
        <div>
            <h2 style="text-align: center;">${note.title }</h2>
            <h5 style="text-align: center;">创建时间：${note.createdTime }</h5>
            <div style="padding: 20px;">${note.content }</div>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/js/style.js"></script>
</body>
</html>
