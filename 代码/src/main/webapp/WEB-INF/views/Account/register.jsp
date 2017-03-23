<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/21/021
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>注册</title>

    <link href="/assets/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <%--<link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">--%>

    <link href="/assets/css/animate.css" rel="stylesheet">
    <link href="/assets/css/style.css?v=2.2.0" rel="stylesheet">
    <%--引进WeUI插件--%>
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>

    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/assets/js/bootstrap.min.js?v=3.4.0"></script>
    <script src="/app/js/app.utils.js"></script>
    <script src="/assets/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="/assets/plugins/sweetalert/sweetalert.css"></script>

</head>

<body>
<div class="page input js_show">
        <div class="weui-cells__title">
            <h2>镖师/发镖人注册</h2>
        </div>
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label" for="userName">江湖人称</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" placeholder="昵称" name="userName" id="userName">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label" for="name">尊姓大名</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" placeholder="真实姓名" name="name" id="name">
                </div>
            </div>

        <div class="weui-cells">
            <div class="weui-cell weui-cell_vcode weui-cell_select weui-cell_select-before">
                <div class="weui-cell__hd">
                    <label class="weui-label">千里传音</label>
                </div>
                <div class="weui-cell__hd">
                    <select class="weui-select" name="select2">
                        <option value="1">+86</option>
                        <option value="2">+80</option>
                        <option value="3">+84</option>
                        <option value="4">+87</option>
                    </select>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="tel" placeholder="请输入手机号" name="phoneNumber" id="phoneNumber">
                </div>
            </div>
        </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="password" class="weui-label">密码</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="password" name="password" id="password" placeholder="请输入密码">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="confirmPassword" class="weui-label">确认密码</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="password" placeholder="请再次确认密码" name="confirmPassword" id="confirmPassword">
                </div>
            </div>

            <div class="weui-cell weui-cell_vcode">
                <div class="weui-cell__hd"><label class="weui-label">验证码</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" placeholder="请输入验证码" name="validateCode">
                </div>
                <div class="weui-cell__ft">
                    <img id="validateCodeImg"
                         src="${pageContext.request.contextPath}/Account/validateCode"/>&nbsp;&nbsp;
                    <a href="#" onclick="javascript:reloadValidateCode();">看不清？</a>
                </div>
            </div>
        </div>

        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" href="javascript:" id="submit">进入镖局</a>
        </div>
    </div>

<script src="/assets/js/sha256.min.js"></script>
<script>
    function reloadValidateCode() {
        $("#validateCodeImg").attr("src", "/Account/validateCode?data=" + new Date() + Math.floor(Math.random() * 24));
    }
    $("#validateCodeImg").click(function () {
        reloadValidateCode();
    });
</script>

<script type="text/javascript">
    /**
     *检查是否重名
     */
    $("#UserName").focus(function () {

    });
    $("#UserName").blur(function () {
        var searchId = $("#userName").val();
        if (!isNullOrEmpty(searchId)) {
            $.ajax({
                type: "GET",
                url: "/Account/userName/" + searchId,
                success: function () {
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (XMLHttpRequest.status == 409) {
                        swal({
                            title: "出错了！",
                            text: "此用户名已被注册，请更换用户名",
                            type: "error",
                            confirmButtonText: "知道了"
                        });
                    }
                }
            });
        }
    });
    /**
     * 注册
     */
    $("#submit").click(function () {
        var userName = $("#userName").val();
        var password = hex_sha256($("#userName").val() + $("#password").val());
        var name = $("#name").val();
        var phoneNumber = $("#phoneNumber").val();

        if (isNullOrEmpty(userName) ||
                isNullOrEmpty(password) ||
                isNullOrEmpty(name) ||
                isNullOrEmpty(phoneNumber)) {
            swal({
                title: "错误",
                text: "不可为空",
                type: "error",
                confirmButtonText: "知道了"
            });
        } else {
            var data = {
                "userName": userName,
                "passWord": password,
                "name": name,
                "phoneNumber":phoneNumber
            };
            $.ajax({
                type: "POST",
                url: "/Account/user",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function () {
                    swal({
                        title: "注册成功",
                        text: name + "注册完毕",
                        type: "success",
                        confirmButtonText: "知道了"
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (XMLHttpRequest.status == 201) {
                        swal({
                            title: "注册成功",
                            text: name + "注册完毕",
                            type: "success",
                            confirmButtonText: "知道了"
                        });
                    } else {
                        swal({
                            title: "出错了！",
                            text: "错误信息" + XMLHttpRequest.status,
                            type: "error",
                            confirmButtonText: "知道了"
                        });
                    }
                }
            });
        }
        $("#userName").val("");
        $("#password").val("");
        $("#name").val("");
        $("#phoneNumber").val("");
    })
</script>


</body>
</html>
