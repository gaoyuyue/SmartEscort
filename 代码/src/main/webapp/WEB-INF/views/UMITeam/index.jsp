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
    <title>优米快递代取</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css"/>
    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <style type="text/css">
        .QQ_S{}
    </style>
<body style="background-color: #eeeeee">

<div id="top" style="background-color:#08ddff">
    <h3 style="color: white">优米快递代取</h3>
</div>

<form method="post" action="/UMITeam/">
    <div class="weui-cells">
        <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="nameLimit">
            <div class="weui-cell__bd">
                <input class="weui-input" id="name" name="name" type="text" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" placeholder="收货人姓名(必填)">
            </div>
        </div>
        <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="phoneLimit">
            <div class="weui-cell__bd">
                <input class="weui-input" id="phone" name="phoneNumber" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " type="text" placeholder="手机号码(必填)">
            </div>
        </div>
    </div>
    <%--<a target="_blank" href="mqqwpa://im/chat?chat_type=wpa&uin=1519035296&version=1&src_type=web&web_src=escort.attackme.cn">手机QQ客服</a>--%>
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="packageTypeLimit" >
            <div class="weui-cell__hd"><label class="weui-label">快递类型</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="packageType" placeholder="请选择快递类型(必填)" type="text" name="courierCompany">
            </div>
        </div>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="schoolNameTypeLimit" >
            <div class="weui-cell__hd"><label for="name" class="weui-label">学校</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="schoolName" name="schoolName" placeholder="请选择学校(必填)" type="text">
            </div>
        </div>
        <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="areaLimit" >
            <div class="weui-cell__hd"><label for="name" class="weui-label">区域</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="area" name="areaName" placeholder="请选择区域(必填)" type="text">
            </div>
        </div>
        <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="detailAddressLimit" >
            <div class="weui-cell__hd">
                <label class="weui-label">详细地址</label>
            </div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="text" placeholder="如梅四北XXX(必填)" id="detailAddress" name="detailAddress">
            </div>
        </div>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="messageLimit" >
            <div class="weui-cell__bd">
                <textarea class="weui-textarea" id="message" name="message" placeholder="短信内容(必填)" rows="4"></textarea>
            </div>
        </div>
    </div>

    <div class="weui-cells">
        <input id="saveButton" href="javascript:;" type="submit" class="weui-btn weui-btn_primary" value="提交"/>
    </div>
</form>

<div style="width:60px;height: 75px;position:fixed;right:0;top:50px;display:block;border:0px solid;border-radius:5px; background-color: #018d75">
    <ul style="text-align: center">
        <li><div style="height: 20px;margin-top: 2px"><span style="font-weight:bold;font-size: small;color:#c2c2c2">联系客服</span></div></li>
        <li><div style="height: 10px"></div></li>
        <li><a href="mqqwpa://im/chat?chat_type=wpa&uin=1519035296&version=1&src_type=web&web_src=escort.attackme.cn"><div style="height: 35px"><i class="fa fa-qq fa-stack-2x" style="color: #c2c2c2"></i></div></a></li>
    </ul>
</div>

<script src="/assets/js/jquery-weui.min.js"></script>
<script src="/assets/js/fastclick.js"></script>
<script src="/app/js/mobile.utils.js"></script>
<script>
    $("#saveButton").click(function () {
        var name = $("#name").val();
        var phone = $("#phone").val();
        var schoolName = $("#schoolName").val();
        var packageType = $("#packageType").val();
        var area = $("#area").val();
        var message = $("#message").val();
        var detailAddress = $("#detailAddress").val();


        if(name == ""){
            $("#nameLimit").css({"borderColor": "red"});
            return false;
        }
        if(phone == ""){
            $("#phoneLimit").css({"borderColor": "red"});
            return false;
        }
        if(schoolName == ""){
            $("#schoolNameLimit").css({"borderColor": "red"});
            return false;
        }
        if(packageType == ""){
            $("#packageTypeLimit").css({"borderColor": "red"});
            return false;
        }
        if(area == ""){
            $("#areaLimit").css({"borderColor": "red"});
            return false;
        }
        if(message == ""){
            $("#messageLimit").css({"borderColor": "red"});
            return false;
        }
        if(detailAddress == ""){
            $("#detailAddressLimit").css({"borderColor": "red"});
            return false;
        }
    });

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
        check();
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
</script>

</body>
</html>
