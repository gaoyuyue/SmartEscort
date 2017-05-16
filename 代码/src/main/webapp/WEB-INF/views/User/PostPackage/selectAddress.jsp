<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/4/26
  Time: 19:06
  To change this template use File | Settings | File Templates.
  选择收货地址页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>选择收货地址</title>

    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/app/js/mobile.utils.js"></script>

    <!-- 引入 WeUI -->
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css"/>
    <link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

</head>
<body>
<div id="frame">
    <div id="navbarSuspension">
        <div id="top">
            <span id="list">
                <a href="javascript:window.location.href='/User/PostPackage/';"><img src="/assets/img/goback.png" align="top"></a>
            </span>
            <a id="title">选择收货地址</a>
            <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
        </div>
    </div>

    <div class="weui-tab__panel">
        <div style="margin-top: 40px" id="addressList">
        </div>
    </div>

    <div class="weui-tabbar">
        <a href="/User/PostPackage/addAddress" class="weui-btn weui-btn_primary footer_weui-btn">新增收获地址</a>
    </div>
</div>

<script src="/assets/js/jquery-weui.min.js"></script>

<script>
    var success = function (data) {
        $("#addressList").empty();
        data.forEach(function (e,i) {
            $("#addressList").append(`
                <div class="weui-cells_radio">
                    <label class="weui-cell weui-check__label" for="`+e.id+`">
                      <div style="width: 90%" class="weui-cell__bd">
                         <div>
                            <span >`+e.receiverName+`</span>
                            <span > </span>
                            <span style="float: right">`+e.phoneNumber+`</span>
                        </div>
                        <div>
                            <span style="color: #953b39;font-size: small">`+(e.default ? `[默认地址]` : ``)+`</span>
                            <span>`+e.area.areaName+`</span>
                            <span>`+e.detail+`</span>
                        </div>
                      </div>
                      <div class="weui-cell__ft" style="width: 10%">
                        <input type="checkbox" class="weui-check checkOne"id="`+e.id+`">
                        <span class="weui-icon-checked"></span>
                      </div>
                    </label>
                </div>

                `+((i<data.length-1)?
                    `<div style="background-color: #DCDCDC;height: 5px;">
                     </div>` : "")
            );
        });

        Get("/User/PostPackage/selected",function (data) {
            $("#"+data).prop("checked",true);
        });

        $(".checkOne").click(function () {
            var me = this;
            var checks = $(".checkOne:checked");
            if (checks.size() == 0){
                $(me).prop("checked",true);
            }else {
                checks.each(function (index,el) {
                    if (me != el){
                        $(el).prop("checked",false);
                    }
                });
            }

            window.location.href = "/User/PostPackage/select/addressId/"+$(this).prop("id");
        });
    };
    $(document).ready(function () {
        Get("/User/ManageAddress/addressList",success);
    });
</script>

</body>
