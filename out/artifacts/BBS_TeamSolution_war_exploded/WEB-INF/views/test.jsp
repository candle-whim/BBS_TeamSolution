<%--
  Created by IntelliJ IDEA.
  User: yocoral
  Date: 2020/12/14
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--<ul>
    <li>模块类别</li>
    <c:forEach items="${module}" var="module">
        <li><a href="#">${module.partName}</a></li>
    </c:forEach>
</ul>-->
<li>回复:</li>
<c:forEach items="${reply}" var="reply">
    <li><a href="#">${reply.content}</a>
    <a href="#">${reply.time}</a></li>
</c:forEach>
</body>
</html>
