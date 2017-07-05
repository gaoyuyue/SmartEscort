<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/25
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>

    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <!-- 引入 WeUI -->
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css">
    <link rel="stylesheet" href="/assets/css/demo/demos.css">

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
</head>
<body class="weui-pull-to-refresh">
<div class="weui-pull-to-refresh__layer">
    <div class="weui-pull-to-refresh__arrow"></div>
    <div class="weui-pull-to-refresh__preloader"></div>
    <div class="down">下拉刷新</div>
    <div class="up">释放刷新</div>
    <div class="refresh">正在刷新</div>
</div>
<div class="page tabbar js_show">
    <div class="page__bd" style="height: 100%;">
        <div class="weui-tab">
            <div class="weui-tab__panel" id="main" style="background-color: #eeeeee">