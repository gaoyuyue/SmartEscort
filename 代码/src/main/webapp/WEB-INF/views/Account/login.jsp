<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/20
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>登录</title>

    <link href="/assets/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">

    <link href="/assets/css/animate.css" rel="stylesheet">
    <link href="/assets/css/style.css?v=2.2.0" rel="stylesheet">

    <script src="/assets/js/jquery-2.1.1.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#submit").click(function () {
                document.getElementById("Password").value = hex_sha256($("#UserName").val() + $("#Password").val());
            });
        });
    </script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">

    <div>
        <div class="siteIcon">
            <img src="/assets/img/logo.png" alt="" data-toggle="tooltip" data-placement="top" title="AttackMe" draggable="false">
        </div>
        <h3>欢迎使用智慧镖局</h3>

        <form class="m-t-md" role="form" action="/Account/Login" method="post">
            <div class="form-group">
                <div class="col-lg-12">
                    <input type="text" class="form-control" placeholder="用户名" required="" name="UserName" id="UserName">
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-12">
                    <input type="password" class="form-control" placeholder="密码" required="" name="Password" id="Password">
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-7">
                    <input type="text" class="form-control" name="validateCode" placeholder="验证码" />
                </div>
                <div class="col-lg-5">
                    <img id="validateCodeImg"
                         src="/Account/validateCode"/>
                </div>
            </div>

            <div class="form-group" >
                <div class="col-lg-12">
                    <div class="checkbox checkbox-primary text-left">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input style="float: left" id="checkbox-signup" type="checkbox" name="RememberMe">
                        <label for="checkbox-signup">
                            记住我(7天内免登陆)
                        </label>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <button type="submit" class="btn btn-primary block full-width m-b" id="submit">登 录</button>
                <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
                </p>
            </div>

        </form>
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

</body>

</html>
