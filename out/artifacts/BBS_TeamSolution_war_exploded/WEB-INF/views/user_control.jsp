<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: doris
  Date: 2020/12/18
  Time: 2:04 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理界面</title>
    <script>
        function initAJAX() {
            if (window.XMLHttpRequest) {// Mozilla
                xmlHttp = new XMLHttpRequest();
            } else if (window.ActiveXObject) {// IE explore
                try {
                    xmlHttp = new ActiveXObject("Msxml2.HMLHTTP");
                } catch (e) {
                    try {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {
                        window.alert("该浏览器不支持AJAX");
                    }
                }
            }
        }
    </script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet">
</head>
<body onload="initAJAX();showUser();">

<%HttpSession admin_session = request.getSession();%>
<div style="background-color: #153d82;height: 235px">
    <img src="${pageContext.request.contextPath}/images/logo-dark.png" style="height: 150px;margin-left: 100px;margin-top: 50px" >
    <div style="color: white;position: absolute;top:180px;left:300px;letter-spacing: 2px;font-family: STSong">您好，尊敬的管理员<%=admin_session.getAttribute("admin")%>:)！&ensp;<a href="exit" style="color: lightsteelblue">退出登录</a></div>
</div><!--最上面一条-->

<table class="table table-hover" align="center" style="width: 1300px;margin-top: 40px;background-color: #e1ecff;border-radius: 8px;">
    <thead>
    <tr>
        <th>用户ID</th>
        <th>用户名</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="user">
    <script language="JavaScript">
        function showUser() {
            xmlHttp.open("GET", "${pageContext.request.contextPath}/admin/showAllUser", true);
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 4) {
                    var data = xmlHttp.responseText;
                    var obj = JSON.parse(data);
                    var listuser = '';
                    for (var i in obj) {
                        var userid = obj[i].id;
                        var username = obj[i].name;
                        listuser += `<td>`
                            + userid +
                            `</td><td>` + username +
                            `</td><td><a href="####">删除用户</a></td></tr>`;
                    }
                    document.getElementById("user").innerHTML = listuser;
                }
            }
            xmlHttp.send();
        }
    </script>

    </tbody>
</table>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/commons.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/npm.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
