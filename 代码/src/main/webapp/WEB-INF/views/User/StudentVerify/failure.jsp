<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/7/2
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>提交失败</title>
    <!-- 引入 WeUI -->
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
</head>
<body>

<div class="page msg_success js_show">
    <div class="weui-msg">
        <div class="weui-msg__icon-area"><i class="weui-icon-success weui-icon_msg"></i></div>
        <div class="weui-msg__text-area">
            <h2 class="weui-msg__title">提交失败</h2>
            <%--<p class="weui-msg__desc">管理员将在1-2个工作日内完成审核</p>--%>
        </div>
        <div class="weui-msg__opr-area">
            <p class="weui-btn-area">
                <a href="/User/PersonalCenter/" class="weui-btn weui-btn_warn">继续认证</a>
                <a href="/User/PersonalCenter/" class="weui-btn weui-btn_default">前往个人中心</a>
            </p>
        </div>
        <div class="weui-msg__extra-area">
            <div class="weui-footer">
                <p class="weui-footer__links">
                    <a href="javascript:void(0);" class="weui-footer__link">智慧应用软件研发工作室java组</a>
                </p>
                <p class="weui-footer__text">Copyright © 2017</p>
            </div>
        </div>
    </div>
</div>

</body>
</html>