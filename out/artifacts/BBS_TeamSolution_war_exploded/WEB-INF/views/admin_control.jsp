<%--
  Created by IntelliJ IDEA.
  User: doris
  Date: 2020/12/19
  Time: 7:58 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员控制页</title>
    <style>
        .choose{
            border: #153482 solid 2px;border-radius:8px;background-color:#e1ecff;margin-top:50px;width: 275px;height: 275px;}
        .chooseText{color: #153482;font-size: 28px;letter-spacing: 5px;font-style: italic;font-weight: bold;}
    </style>
</head>
<body>

<%HttpSession admin_session = request.getSession();%>
<div style="background-color: #153d82;height: 235px">
    <img src="${pageContext.request.contextPath}/images/logo-dark.png" style="height: 150px;margin-left: 100px;margin-top: 50px" >
    <div style="color: white;position: absolute;top:180px;left:300px;letter-spacing: 2px;font-family: STSong">您好，尊敬的管理员<%=admin_session.getAttribute("admin")%>:)！&ensp;<a href="exit" style="color: lightsteelblue">退出登录</a></div>
</div><!--最上面一条-->

<table>
    <tr>
        <td>
            <div class="choose" style="margin-left:80px;padding: 50px;">
                <img src="${pageContext.request.contextPath}/images/user_control.png" height="175px" style="position: relative;left:50px;top: 5px">
                <div class="chooseText" style="position: relative;left: 45px;margin-top: 30px"><a href="toUserControl" style="color: #153482"><ins>&ensp;用户操作&ensp;</ins></a></div>
            </div>
        </td>
        <td>
            <div class="choose" style="margin-left: 50px;padding: 50px">
                <img src="${pageContext.request.contextPath}/images/post_control.png" height="150px" style="position: relative;left: 25px;top: 5px">
                <div class="chooseText" style="margin-top:54px;position: relative;left:40px"><a href="toPostControl" style="color: #153482"><ins>&ensp;帖子操作&ensp;</ins></a></div>
            </div>
        </td>
        <td>
            <div class="choose" style="margin-left: 50px;padding: 50px">
                <img src="${pageContext.request.contextPath}/images/module_control.png" height="175px" style="position: relative;left:15px;top:5px">
                <div class="chooseText" style="margin-top: 30px;position: relative;left: 45px"><a href="toModuleControl" style="color: #153482"><ins>&ensp;模块操作&ensp;</ins></a></div>
            </div>
        </td>
    </tr>
</table>

</body>
</html>
