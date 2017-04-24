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

    <%--引进WeUI插件--%>
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css"/>

    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/app/js/mobile.utils.js"></script>
    <script src="/assets/js/sha256.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#submit").click(function () {
                document.getElementById("passWord").value = hex_sha256($("#userName").val() + $("#passWord").val());
            });
        });
    </script>
</head>

<body class="gray-bg">
<div class="page input js_show">
        <div class="weui-cells__title">
            <h2>用户注册</h2>
        </div>
        <form action="/Account/Register" method="post" name="form1">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label" for="userName">用户名</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" placeholder="请输入昵称" name="userName" id="userName">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label" for="name">真实姓名</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" placeholder="请输入真实姓名" name="name" id="name">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">手机号</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="tel" placeholder="请输入手机号" name="phoneNumber" id="phoneNumber">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">学/工号</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="tel" placeholder="学/工号" name="studentId" id="studentId">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="name" class="weui-label">学校</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="schoolName" id="schoolName" placeholder="请选择学校" type="text" value="">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="password" class="weui-label">密码</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="password" name="passWord" id="passWord" placeholder="请输入密码">
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label for="confirmPassword" class="weui-label">确认密码</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="password" onchange="checkpwd()" placeholder="请确认密码" id="confirmPassword">
                </div>
            </div>

            <div class="weui-cell">
                <div id="msg" style="color:red;"></div>
            </div>

        </div>
        <div class="weui-btn-area">
            <button type="submit" class="weui-btn weui-btn_primary" id="submit">进入</button>
        </div>
        </form>
    </div>

<script src="/assets/js/jquery-weui.min.js"></script>
<script src="/assets/js/fastclick.js"></script>
<script src="/assets/js/sha256.min.js"></script>

<script type="text/javascript">
    /**
     * 判断密码两次是否输入正确
     * @returns {boolean}
     */
    function checkpwd() {
        var p1 = $("#passWord").val();
        var p2 = $("#confirmPassword").val();
        if(p1 ==""){
            alert("请输入密码");
            document.form1.password.focus();
        }
        if(p1!=p2){
            $("#msg").html("两次输入密码不一致，请重新输入");
            $("#editPassWord").disabled = true;
        } else{
            $("#editPassWord").disabled = false;
        }
    }

    /**
     * 获取焦点事件
     * */
    $("#userName").focus(function () {
        $(this).val("");
    });
    $("#confirmPassword").focus(function () {
        $(this).val("");
        $("#msg").html("");
    });
    /**
     * 判断用户名是否重复
     */
    $("#userName").blur(function () {
        var userName = $("#userName").val();
        if (!isNullOrEmpty(userName)) {
            $.ajax({
                type: "GET",
                url: "/Account/userName/" + userName,
                success: function () {
                },
                error: function () {
                    alert("该用户名已被注册!");
                }
            });
        }
    });

    var success = function (data) {
        $("#schoolName").select({
            title: "选择区域",
            items: data
        });
    };
    $(document).ready(function () {
        Get("/User/ManageAddress/schoolNameList",success);
    });
</script>

</body>
</html>
