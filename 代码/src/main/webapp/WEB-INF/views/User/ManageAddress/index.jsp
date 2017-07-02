<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/24
  Time: 21:35
  To change this template use File | Settings | File Templates.
  地址管理页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>管理收货地址</title>

    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/app/js/mobile.utils.js"></script>

    <!-- 引入 WeUI -->
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

</head>
<body style="background-color: #eeeeee">
<div id="frame">
    <div id="navbarSuspension">
        <div id="top">
            <span id="list">
                <a href="javascript:window.location.href='/User/PersonalCenter/'"><img src="/assets/img/goback.png" align="top"></a>
            </span>
            <a id="title">管理收货地址</a>
            <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
        </div>
    </div>

    <div class="weui-tab__panel">
        <div class="address_manage" id="addressList" style="background-color: #ffffff">
        </div>
    </div>

    <div class="weui-tabbar">
        <a href="/User/ManageAddress/add" class="weui-btn weui-btn_warn footer_weui-btn">新增收获地址</a>
    </div>
</div>

<script src="/assets/js/jquery-weui.min.js"></script>

<script>
    var success = function (data) {
        $("#addressList").empty();
        data.forEach(function (e,i) {
             $("#addressList").append(`
                <div style="height: 15px;background-color: #eeeeee">
                </div>
                <div class="address_one">
                    <div class="address_name-phone">
                        <span style="margin: 5px" >`+e.receiverName+`</span>
                        <span > </span>
                        <span style="float: right">`+e.phoneNumber+`</span>
                    </div>
                    <div class="address_detail">
                        <span>
                        </span>
                        <span style="font-size: 14px;margin: 5px">`+e.area.areaName+" "+e.detail+`</span>
                    </div>

                    <div class="address_hr">
                        <hr color=" #DCDCDC" size="1px">
                    </div>

                    <div class="address_setting">
                        <input type="checkbox" class="setDefault" `+(e.default ? "checked='true'" : "")+" addressId='"+e.id+"'"+`><span>设为默认</span>

                        <a href="#" style="float: right;color: black;" class="deleteOne" addressId='`+e.id+`'>删除</a>
                        <img src="/assets/img/delete_icon.jpg" width="20" height="20" style="float: right">
                        &nbsp;
                        <a href="#" class="editAddress" style="float: right;color: black;" addressId='`+e.id+`'>编辑</a>
                        <img src="/assets/img/edit_icon.png" width="23" height="23" style="float: right">
                    </div>
                </div>
                 `+((i===data.length-1)?`<div style="background-color: #ffffff;height: 1px"></div>`:``)
             );
        });
        $(".deleteOne").click(function () {
            const addressId = $(this).attr("addressId");
            $.confirm("确认删除此收货地址吗？", "提示", function() {
                Delete("/User/ManageAddress/delete/addressId/"+addressId,function () {
                    window.location.href = "/User/ManageAddress/";
                });
            }, function() {
                $(this).remove();
                $(".weui-mask").remove();
            });
        });
        $(".setDefault").click(function () {
            const isChecked = $(this).prop("checked");
            if(!isChecked){
                $(this).prop("checked",true);
            }else {
                const addressId = $(this).attr("addressId");
                Put("/User/ManageAddress/default",addressId,function () {
                    window.location.href = "/User/ManageAddress/";
                });
            }
        });
        $(".editAddress").click(function () {
            window.location.href = "/User/ManageAddress/edit/addressId/"+$(this).attr("addressId");
        });
    };
    $(document).ready(function () {
        Get("/User/ManageAddress/addressList",success);
    });


</script>

</body>
