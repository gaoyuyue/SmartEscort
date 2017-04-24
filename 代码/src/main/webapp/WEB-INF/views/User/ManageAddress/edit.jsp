<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/4/15
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑收获地址</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css"/>
    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/app/js/mobile.utils.js"></script>

</head>
<body>
<div id="top">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" align="top"></a>
        </span>
    <a id="title">编辑收获地址</a>
    <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
</div>

<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input class="weui-input" id="name" type="text" placeholder="收货人姓名">
        </div>
    </div>
</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input class="weui-input" id="phone" type="number" placeholder="手机号码">
        </div>
    </div>
</div>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__hd"><label for="area" class="weui-label">学校/区域</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="area" type="text">
        </div>
    </div>
</div>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <textarea class="weui-textarea" id="detail" placeholder="详细地址" rows="4"></textarea>
        </div>
    </div>
</div>

<a href="javascript:;" class="weui-btn weui-btn_warn" id="saveButton">保存</a>

<script src="/assets/js/jquery-weui.min.js"></script>
<script src="/assets/js/fastclick.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
</script>

<script>
    let addressId;
    var getArea = function (data) {
        $("#area").select({
            title: "选择区域",
            items: data
        });
    };
    var getAddress = function (data) {
        addressId = data.id;
        $("#name").val(data.receiverName);
        $("#phone").val(data.phoneNumber);
        $("#detail").val(data.detail);
        Get("/User/ManageAddress/areaNameList",getArea);
        $("#area").val(data.area.areaName);
    };
    $(document).ready(function () {
        Get("/User/ManageAddress/edit",getAddress);
    });

    var success = function () {
        window.location.href = "/User/ManageAddress/";
    };

    $("#saveButton").click(function () {
        const data = {
            id:addressId,
            receiverName:$("#name").val(),
            phoneNumber:$("#phone").val(),
            detail:$("#detail").val(),
            area:{
                areaName:$("#area").val()
            }
        };
        Put("/User/ManageAddress/edit",data,success);
    });
</script>

</body>
</html>
