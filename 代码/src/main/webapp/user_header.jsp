<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/25
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <!-- 引入 WeUI -->
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css">

    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/assets/js/jquery-weui.min.js"></script>
    <script src="/app/js/mobile.utils.js"></script>

    <script type="text/javascript" class="tabbar js_show">
        $(function(){
            $('.weui-tabbar__item').on('click', function () {
                $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            });
        });
    </script>
