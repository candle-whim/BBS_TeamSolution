<%--
  Created by IntelliJ IDEA.
  User: doris
  Date: 2020/12/17
  Time: 7:35 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>IES-BBS登陆页</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        input.inputText{width: 370px;height: 60px;font-size: 18px;margin-top:15px;font-family: "Courier New";padding-left: 20px;border-style:solid;border-color: white;border-radius: 5px}
        input::-webkit-input-placeholder{font-family: STSong;font-size:18px;letter-spacing: 2px}
        .button{font-size: 16px;width: 155px;height: 45px;}
    </style>
</head>
<body style="background-color: #9be9f3">
    <div align="center">
        <img src="${pageContext.request.contextPath}/images/logo-light.png" style="height: 250px; margin-top: 100px; margin-bottom: -20px">
    </div>
    <form align="center" style="margin-top: 30px" action="">
        <input class="inputText" id="user" type="text" placeholder="账号:"><br>
        <input class="inputText" id="password" type="password" placeholder="密码:"><br>

        <div class="form-group" style="margin-top: 30px">
            <div class="">
                <a href="toUserRegister">
                    <button type="button" class="btn btn-info button">注&emsp;&emsp;册</button>
                </a>
                &nbsp;&emsp;&nbsp;&emsp;&nbsp;&emsp;&nbsp;
                <a href="####">
                    <button type="button" class="btn btn-success button" >登&emsp;&emsp;录</button>
                </a>
                <a href="toAdminLogin"><u><p style="text-align: center;letter-spacing: 3px;margin-top: 60px">我是管理员?</p></u></a>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
