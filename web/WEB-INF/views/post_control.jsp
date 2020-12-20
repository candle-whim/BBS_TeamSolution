<%--
  Created by IntelliJ IDEA.
  User: doris
  Date: 2020/12/19
  Time: 8:16 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发帖管理界面</title>
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
    <style>
        input::-webkit-input-placeholder{font-size:10px;letter-spacing: 1px;font-family: STSong}
        textarea::-webkit-input-placeholder{font-size:10px;letter-spacing: 1px;font-family: STSong}
    </style>
</head>
<body onload="initAJAX();showPost();">

<%HttpSession admin_session = request.getSession();%>
<div style="background-color: #153d82;height: 235px">
    <img src="${pageContext.request.contextPath}/images/logo-dark.png" style="height: 150px;margin-left: 100px;margin-top: 50px" >
    <div style="color: white;position: absolute;top:180px;left:300px;letter-spacing: 2px;font-family: STSong">您好，尊敬的管理员<%=admin_session.getAttribute("admin")%>:)！&ensp;<a href="exit" style="color: lightsteelblue">退出登录</a></div>
</div><!--最上面一条-->

<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" style="margin-top: 20px;position: fixed;right: 100px;letter-spacing: 2px">发布新贴</button>

<table class="table table-hover" align="center" style="width: 1300px;margin-top: 70px;background-color: #e1ecff;border-radius: 8px;">
    <thead>
    <tr>
        <th>帖子ID</th>
        <th>标题</th>
        <th>发布者</th>
        <th>所属模块</th>
        <th>内容摘要</th>
        <th>回帖数</th>
        <th>浏览量</th>
        <th colspan="3">操作</th>
    </tr>
    </thead>
    <tbody id="post">
    <script language="JavaScript">
        function showPost() {
            xmlHttp.open("GET", "${pageContext.request.contextPath}/admin/showAllPost", true);
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 4) {
                    var data = xmlHttp.responseText;
                    var obj = JSON.parse(data);
                    var listpost = '';
                    for (var i in obj) {
                        var postid = obj[i].id;
                        var postname = obj[i].title;
                        var poster = obj[i].userId;
                        var postmodule = obj[i].partId;
                        var postcontent = obj[i].content;
                        if(postcontent.length > 20) {
                            postcontent = postcontent.substring(0,17)+"...";
                        }
                        var postreplynum = obj[i].replyCount;
                        var postclicknum = obj[i].clickCount;
                        listpost += `<td>`
                            + postid +
                            `</td><td>` + postname + `</td><td>` + poster + `</td><td>` + postmodule + `</td><td>`
                            + postcontent + `</td><td>` + postreplynum + `</td><td>` + postclicknum +
                            `</td><td><a href="deletePostById?id=`+obj[i].id+`">删除此贴</a>&emsp;<a herf="####">加精此贴</a>&emsp;<a herf="####">置顶此贴</a></td></tr>`;
                    }
                    document.getElementById("post").innerHTML = listpost;
                }
            }
            xmlHttp.send();
        }
    </script>
</table>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel" style="letter-spacing: 1px">&emsp;发布新帖</h4>
            </div>
            <div class="modal-body">
                <form action="addModule" method="get" style="letter-spacing: 1px;color: grey;margin-left: 20px;margin-right: 20px" >
                    <br>
                    <input type="text" name="title" class="form-control input-lg input" style="width: 60%" placeholder="请输入帖子标题">
                    <datalist id="moduleList">
                        <script>

                        </script>
                    </datalist>
                    <br>
                    <input type="textarea" name="context" style="width: 100%;min-height: 200px;max-height: 200px;font-size: 14px;font-family: STSong;letter-spacing: 1px" class="form-control input-lg" placeholder="请输入帖子内容:">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/commons.js"></script>
    <script src="${pageContext.request.contextPath}/js/npm.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
