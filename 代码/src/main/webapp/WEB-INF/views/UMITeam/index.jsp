<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/7/8
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UMI快递代取</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css"/>
    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/jquery-2.1.1.min.js"></script>

</head>
<body style="background-color: #eeeeee">

<form method="post" action="/UMITeam/">
    <div class="weui-cells">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <input class="weui-input" id="name" name="name" type="text" placeholder="收货人姓名">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <input class="weui-input" id="phone" name="phoneNumber" type="number" placeholder="手机号码">
            </div>
        </div>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">快递类型</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="packageType" placeholder="请选择快递类型" type="text" name="courierCompany">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label for="name" class="weui-label">学校</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="schoolName" name="schoolName" placeholder="请选择学校" type="text">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label for="name" class="weui-label">区域</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="area" name="areaName" placeholder="请选择区域" type="text">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd">
                <label class="weui-label">详细地址</label>
            </div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="text" placeholder="如梅四北XXX" id="detailAddress" name="detailAddress">
            </div>
        </div>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <textarea class="weui-textarea" id="message" name="message" placeholder="短信内容" rows="4"></textarea>
            </div>
        </div>
    </div>

    <div class="weui-cells">
        <input id="saveButton" href="javascript:;" type="submit" class="weui-btn weui-btn_primary" value="提交"/>
    </div>
</form>


<script src="/assets/js/jquery-weui.min.js"></script>
<script src="/assets/js/fastclick.js"></script>
<script src="/app/js/mobile.utils.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
    var schoolSuccess = function (data) {
        $("#schoolName").select({
            title: "选择学校",
            items: data
        });
    };
    $("#schoolName").on("change",this,function () {
        Get("/UMITeam/areaNameList/schoolName/"+$(this).val(),areaSuccess);
    });
    $(document).ready(function () {
        Get("/User/ManageAddress/schoolNameList",schoolSuccess);
        Get("/User/PostPackage/courierList",getCourier);
    });
    var areaSuccess = function (data) {
        $("#area").select("update",{
            title: "选择区域",
            items: data
        });
    };
    const getCourier = function (data) {
        $("#packageType").select({
            title: "选择快递类型",
            items: data
        });
    };

//    var postSuccess = function () {
//        window.location.href = "/UMITeam/success";
//    };

//    $("#saveButton").click(function () {
//        var data = {
//            name:$("#name").val(),
//            phoneNumber:$("#phone").val(),
//            detailAddress:$("#detailAddress").val(),
//            message:$("#message").val(),
//            area:{
//                areaName:$("#area").val()
//            },
//            school:{
//                schoolName:$("#schoolName").val()
//            }
//        };
//        Post("/UMITeam/",data,postSuccess);
//    });

</script>

</body>
</html>
