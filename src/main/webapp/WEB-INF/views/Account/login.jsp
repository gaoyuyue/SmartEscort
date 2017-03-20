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
    <link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

    <link href="/assets/css/animate.css" rel="stylesheet">
    <link href="/assets/css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">镖</h1>

        </div>
        <h3>欢迎使用智慧镖局后台管理系统</h3>

        <form class="m-t" role="form" action="index.html">
            <div class="form-group">
                <input type="email" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" required="">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


            <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
            </p>

        </form>
    </div>
</div>

<!-- Mainly scripts -->
<script src="/assets/js/jquery-2.1.1.min.js"></script>
<script src="/assets/js/bootstrap.min.js?v=3.4.0"></script>


</body>

</html>
