<%--
  Created by IntelliJ IDEA.
  User: doris
  Date: 2020/12/20
  Time: 2:40 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BBS-IES注册页</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function checkUser(s){
            var regu =/^[a-z|A-Z|0-9|_]+$/;
            var re = new RegExp(regu);
            if (re.test(s)) {
                return true;
            }else{
                return false;
            }
        }//检查用户名规范

        function checkPassword(s){
            var regu =/^[a-z|A-Z|0-9|!|?|@|#|$|%|&|*|+|-|/]+$/;
            var re = new RegExp(regu);
            if (re.test(s)) {
                return true;
            }else{
                return false;
            }
        }//检查密码规范

        function Check() {
            var username=document.getElementById("user").value;
            var password=document.getElementById("password").value;
            var conpassword=document.getElementById("conpassword").value;

            if (username == "") {
                document.getElementById("explain1").innerHTML="<p style='color: darkred;font-size: 12px;letter-spacing: 1px'>*用户名不能为空！</p>";
                document.getElementById("explain2").innerHTML="";
                return;
            }else if (!checkUser(username)) {
                document.getElementById("explain1").innerHTML="<p style='color: darkred;font-size: 12px;letter-spacing: 1px'>*用户名格式不正确！</p>";
                document.getElementById("explain2").innerHTML="";
                return;
            }

            if (password == "") {
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain2").innerHTML="<p style='color: darkred;font-size: 12px;letter-spacing: 1px'>*密码不能为空！</p>";
                return;
            }else if (!checkPassword(password)) {
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain2").innerHTML="<p style='color: darkred;font-size: 12px;letter-spacing: 1px'>*密码格式不正确！</p>";
                return;
            }

            if (conpassword == "") {
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain2").innerHTML="";
                document.getElementById("explain3").innerHTML="<p style='color: darkred;font-size: 12px;letter-spacing: 1px'>*确认密码不能为空！</p>";
                return;
            }else if (!checkPassword(conpassword)) {
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain3").innerHTML="<p style='color: darkred;font-size: 12px;letter-spacing: 1px'>*确认密码格式不正确！</p>";
                return;
            }else if(password!=conpassword){
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain1").innerHTML="";
                document.getElementById("explain3").innerHTML="<p style='color: darkred;font-size: 12px;letter-spacing: 1px'>*两次密码不一致！</p>";
                return;
            }

            document.getElementById("explain1").innerHTML="";
            document.getElementById("explain2").innerHTML="";
            document.getElementById("explain3").innerHTML="";
        }

        function synchronize(){
            document.getElementById('name').placeholder = "/"+document.getElementById('user').value;
        }
        //执行同步
        setInterval(synchronize,500);//同步的时间间隔，每0.5秒同步一次
    </script>
    <style>
        form{margin-top: 50px;margin-left: 100px}
        input::-webkit-input-placeholder{font-size:12px;letter-spacing: 1px;font-family: STSong}
        textarea::-webkit-input-placeholder{font-size:12px;letter-spacing: 1px;font-family: STSong}
        td{}
        .caption{width: 150px}
        .input{font-size: 16px;font-family: 'Courier New'}
        .tips{color: darkgrey;font-size: 12px;}
    </style>
</head>
<body>
<div style="background-color: #9be9f3;height: 250px">
    <img src="${pageContext.request.contextPath}/images/logo-light.png" style="height: 175px;margin-left: 100px;margin-top: 50px" >
    <div style="color: black;position: absolute;top:160px;left:320px;letter-spacing: 2px;font-family: STSong;font-size: 24px">Hi, 欢迎注册IES BBS论坛:)&ensp;
        <a href="toLogin" style="font-size: 14px">&ensp;已有账号？返回登录</a>
    </div>
</div>

<form action="####" method="post" style="margin-bottom: 100px">
    <p style="color: darkred;font-size: 12px;letter-spacing: 2px">&ensp;带'*'为必填内容哦！</p>
    <table style="border-collapse:separate; border-spacing:0px 8px;margin-bottom: 30px">
        <tr>
            <td class="caption"><sup style="color: red">*</sup>用户名：</td>
            <td><input name="user" style="width: 250px;" required type="text" class="form-control input-lg input" id="user" placeholder="请输入您的用户名" onblur="Check()">
                <div id="explain1"></div>
            </td>
            <td class="tips" style="letter-spacing: 1px">&emsp;&emsp;//账号应由字母、数字及'_'组成//</td>
        </tr>

        <tr>
            <td class="caption"><sup style="color: red">*</sup>密码：</td>
            <td><input name="password" style="width: 250px;" required type="password" class="form-control input-lg input" id="password" placeholder="请输入您的密码" onblur="Check()">
                <div id="explain2"></div>
            </td>
            <td class="tips" style="letter-spacing: 1px">&emsp;&emsp;//密码应由英文字母、数字或者特殊符号（例：!、?、@、#、$、%、&、*、+、-、/）组成//</td>
        </tr>

        <tr>
            <td><sup style="color: red">*</sup>确认密码：</td>
            <td><input style="width: 250px;" required type="password" class="form-control input-lg input" id="conpassword" placeholder="请再次输入您的密码" onblur="Check()">
                <div id="explain3"></div>
            </td>
        </tr>

        <tr>
            <td class="caption">&ensp;昵称：</td>
            <td><input name="name" style="width: 250px;" type="text" class="form-control input-lg input" id="name"></td>
            <td class="tips" style="letter-spacing: 1px">&emsp;&emsp;//您的昵称将作为您在本论坛进行操作所展现的名字（若不填则默认为用户名）//</td>
        </tr>

        <tr>
            <td class="caption">&ensp;班级：</td>
            <td><input name="class" style="width: 250px;" type="text" class="form-control input-lg input" placeholder="请输入您的班级"></td>
        </tr>

        <tr>
            <td class="caption">&ensp;学号：</td>
            <td><input name="stuId" style="width: 250px;" type="text" class="form-control input-lg input" placeholder="请输入您的学号"></td>
        </tr>

        <tr>
            <td class="caption">&ensp;邮箱：</td>
            <td><input name="email" style="width: 250px;" type="text" class="form-control input-lg input" placeholder="请输入您的邮箱"></td>
        </tr>

        <tr>
            <td class="caption">&ensp;个性签名：</td>
            <td colspan="2"><textarea name="signature" style="min-width: 400px;min-height: 100px;max-width: 400px;max-height: 100px;font-size: 14px;font-family: STSong;letter-spacing: 1px" class="form-control input-lg" placeholder="有什么想说的..."></textarea></td>
        </tr>
    </table>

    <div style="margin-left: 150px">
        <input type="checkbox" name="sure" value="true">
        <a data-toggle="modal" data-target="#myModal">&ensp;<u style="letter-spacing: 2px">&ensp;阅读并确认本站用户运行规则&ensp;</u></a><br>
        <input type="button" style="margin-top: 5px;width:240px;height:40px;font-size: 16px;letter-spacing: 3px" value="创建账户！" class="btn btn-success btn-sm"></input>
    </div>
</form>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel" style="letter-spacing: 1px">
                    &ensp;//&emsp;IES-BBS用户需知
                </h4>
            </div>
            <div class="modal-body" style="letter-spacing: 1px;color: grey;margin: 30px;">
                · 本站所有解释权归BBS搬砖小队所有<br><br>
                一、帐户注册及使用说明:<br>
                1.您应当确保您提交的本人注册信息真实、有效、合法，平台无需对您提交的注册信息承担责任。<br>
                2.您应当妥善保管自己的用户名及密码信息:倘若您未能妥善保管好自己的账号，由此产生的损失，由您自己承担。<br>
                3.您应当对您使用IES-BBS账户的行为（包括您未能妥善保管账号，他人使用账号的行为）负责，本站有权制定相关规则，并单方面采取必要的措施，规范您的账户行为与发布内容。<br><br>
                二、积分条例:<br>
                1.本站实行积分规则以记录您为本站做出的贡献。<br>
                2.本站积分规则:(1)发帖一次+2&emsp;(2)回帖一次积分+1&emsp;(3)帖子被加精/置顶积分+5<br>
                3.本站有权利清空您的积分<br><br>
                三、服务终止协议:<br>
                1.本站可随时且不需事先通知，立即终止或暂停您的所有或部分帐户服务功能。此类服务终止的原因包括但不限于以下:(1)违反本服务协议&emsp;(2)上传或者发布推送垃圾信息&emsp;(3)存在任何触犯中国法律法规的行为或违反本协议的行为<br><br>
                · 不会真有人认真看服务协议吧...<br><br>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
