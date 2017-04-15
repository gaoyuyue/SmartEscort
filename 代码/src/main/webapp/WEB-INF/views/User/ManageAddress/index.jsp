<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/24
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>

    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/app/js/app.utils.js" type="text/javascript"></script>
    <script src="/app/js/posfixed.js" type="text/javascript"></script>

    <script type="text/javascript">
        function disp_alert()
        {
            alert("是否确认删除")
        }
    </script>

    <!-- 引入 WeUI -->
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

</head>
<body>
    <div id="top">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">管理收货地址</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>
    <!--我-->
    <div class="adress">
            <div>
                <span style="margin: 5px" >张三</span>
                <span > </span>
                <span style="float: right">13230524775</span>
            </div>
            <div>
                <span>
            </span>
                <span style="font-size: 14px;margin: 5px">河北省唐山市曹妃甸区唐山湾生态城渤海大道21号华北理工大学东区梅园</span>
            </div>
            <hr color=" #DCDCDC" size="1px">
            <div>

                <input type="checkbox">设为默认

                <span onclick="disp_alert()" style="float: right">删除</span>
                <img src="/assets/img/delete_icon.jpg" width="20" height="20" style="float: right">

                <a href="#" style="float: right;color: black;">编辑</a>
                <img src="/assets/img/edit_icon.png" width="23" height="23" style="float: right">


            </div>

    </div>

    <div style="background-color: #DCDCDC;height: 8px;">
    </div>
    <div class="adress">
        <div>
            <span >李四</span>
            <span > </span>
            <span style="float: right">13230524775</span>
        </div>
        <div>
                <span>
            </span>
            <span style="font-size: 14px;">河北省唐山市曹妃甸区唐山湾生态城渤海大道21号华北理工大学西区</span>
        </div>
        <hr color=" #DCDCDC" size="1px">
        <div>

            <input type="checkbox">设为默认
            <span onclick="disp_alert()" style="float: right">删除</span>
            <a href="#" style="float: right;color: black;">编辑</a>

        </div>

    </div>

    <div class="weui-tabbar">
        <a href="/User/ManageAddress/add" class="weui-btn weui-btn_primary footer_weui-btn">新增收获地址</a>
    </div>
</body>
