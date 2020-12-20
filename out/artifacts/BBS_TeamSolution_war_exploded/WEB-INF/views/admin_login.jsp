<%--
  Created by IntelliJ IDEA.
  User: doris
  Date: 2020/12/17
  Time: 7:38 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>IES-BBS管理员登陆页</title>
    <style>
        input.inputText{width: 320px;height: 45px;margin-bottom: 15px;font-size: 18px;font-family: "Courier New";padding-left: 20px}
        input::-webkit-input-placeholder{font-family: STSong;font-size:16px;letter-spacing: 2px}
    </style>
</head>
<body style="background-color: #153d82">
<div align="center">
    <img src="${pageContext.request.contextPath}/images/logo-dark.png" style="height: 250px; margin-top: 60px; margin-bottom: 30px">
</div>

<div align="center" style="color:white;letter-spacing: 2px;font: 20px STSong;">Hi,&ensp;亲爱的管理员:)！</div>
    <form align="center" style="margin-top: 30px" action="">
        <input class="inputText" name="id" type="text" placeholder="账号:"><br>
        <input class="inputText" name="password" type="password" placeholder="密码:"><br>
        <input type="image" style="height: 75px;width: 75px;margin-top: 40px" src="${pageContext.request.contextPath}/images/enter.png" alt="登录">
    </form>
    <div align="center" style="margin-top:30px;"><a href="toUserLogin" style="color: lightsteelblue;font-size: 15px;letter-spacing: 3px">我是普通用户？</a></div>
</body>
</html>
