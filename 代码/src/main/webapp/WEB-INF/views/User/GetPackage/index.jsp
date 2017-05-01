<%--#e15400  color--%>
<!doctype html>
<html>
<head>
    <%--<%@include file="/user_header.jsp"%>--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title></title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/assets/css/demo/gmu.css" />
    <script type="text/javascript" src="/assets/js/demo/zepto.js"></script>
    <script type="text/javascript" src="/assets/js/demo/gmu.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">
        <link href="/assets/css/jquery-weui.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/assets/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/mobile.css">
        <!-- 引入 WeUI -->
        <link rel="stylesheet" href="/assets/css/weui.min.css"/>
        <link rel="stylesheet" href="/assets/css/jquery-weui.min.css">
        <script src="/assets/js/jquery-weui.min.js"></script>
        <script src="/app/js/mobile.utils.js"></script>
</head>
<body>
<div id="top" style="background-color: #eeeeee">
    <div class="form-group">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" ></a></span>
        <input type="text" class="form-control" style="display: inline;width: 60%" value="search">
        <span class="input-group-addon fa fa-search"  style="display: inline;"></span>
        <span >
             <a href="javascript:void(0);" id="btn_filter" ><img src="/assets/img/shaixuan.png" ></a>
        </span>
    </div>
</div>
        <div class="container" >
            <ul>
                <li></li>
            </ul>
            <ul>
                <li></li>
            </ul>
        </div>


    <div id="filterpanel" style="background-color: #eeeeee">
            <strong >区域</strong>
        <hr>
            <ul id="area">

            </ul>
        <hr>
            <strong>快递类型</strong>
        <hr>
            <ul id="CourierCompany" >

            </ul>
        <hr>
            <div class="btn btn-warning btn-block" id="submitDiv">
                <a href="javascript:void(0);" id="filterSubmit" >确认</a>
            </div>
    </div>
</body>
    <script>

        $(document).ready(function () {
            $("#getPackage").addClass("weui-bar__item_on");
        });

//Right To Left
        var filterpanel = $("#filterpanel");
        filterpanel.css({
            'height': window.innerHeight
        }).iScroll()
            .panel({
                contentWrap: $("#page"),
                scrollMode: 'fix',
                display: 'overlay',
                swipeClose: true
            }).on('open', function () {
            filterpanel.iScroll('refresh');
        });

        var isBrandLoad = false;
        $("#btn_filter").on("click", function (e) {
            e.preventDefault();
            if(isBrandLoad){
                filterpanel.panel("toggle");
            }else{
                isBrandLoad = true;
                $.get('products/brands_json', function (response) {
                    if(response.data){
                        showLi([{"id":"","name":"全部"}],"brand-ul",10);
                        showLi(response.data,"brand-ul",10);
                        filterpanel.panel("toggle");
                        bindPanelLiClick();
                        filterpanel.iScroll('refresh');
                    }
                })
            }
        });

    </script>

<%@include file="/user_footer.jsp"%>