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
    <title>板块管理界面</title>
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
    <style>
        .modal.fade {
            top:200px;
        }
    </style>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet">
</head>
<body onload="initAJAX();showModule();">

    <%HttpSession admin_session = request.getSession();%>
    <div style="background-color: #153d82;height: 235px">
        <img src="${pageContext.request.contextPath}/images/logo-dark.png" style="height: 150px;margin-left: 100px;margin-top: 50px" >
        <div style="color: white;position: absolute;top:180px;left:300px;letter-spacing: 2px;font-family: STSong">您好，尊敬的管理员<%=admin_session.getAttribute("admin")%>:)！&ensp;<a href="exit" style="color: lightsteelblue">退出登录</a></div>
    </div><!--最上面一条-->

    <table class="table table-hover" align="center" style="width: 1300px;margin-top: 40px;background-color: #e1ecff;border-radius: 8px;">
        <thead>
        <tr>
            <th>模块ID</th>
            <th>模块名</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="module">
        <script language="JavaScript">
            function showModule() {
                xmlHttp.open("GET", "${pageContext.request.contextPath}/admin/showAllModule", true);
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState == 4) {
                        var data = xmlHttp.responseText;
                        var obj = JSON.parse(data);
                        var listmodule = '';
                        for (var i in obj) {
                            var moduleid = obj[i].id;
                            var modulename = obj[i].partName;

                            listmodule += `<td>`
                            + moduleid +
                            `</td><td>` + modulename +`</td><td><a href="deleteModuleById?id=`+obj[i].id+`">删除此模块</a></td></tr>`;
                         }
                        listmodule += `<tr>
          <td colspan="3" align="center" valign="middle"><a data-toggle="modal" data-target="#myModal" style="font-family: STSong;font-weight:bold;font-size: 14px;letter-spacing: 3px"><img src="${pageContext.request.contextPath}/images/add.png" width="20px"></img>&ensp;新增模块</a></td>
        </tr>`
                        document.getElementById("module").innerHTML = listmodule;
                    }
            }
            xmlHttp.send();
        }
        </script>
        </tbody>
    </table>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel" style="letter-spacing: 1px">&emsp;创建新模块</h4>
                </div>
                <div class="modal-body">
                    <form action="addModule" method="get" style="letter-spacing: 1px;color: grey;margin-left: 20px;margin-right: 20px" >
                        请输入需要新增的模块名:<br><br>
                        <input type="Text" name="partName" class="form-control input-lg input">
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary">提交更改</button>
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
