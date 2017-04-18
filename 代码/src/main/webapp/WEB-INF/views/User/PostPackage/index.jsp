<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/21
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<link href="/assets/css/jquery-weui.min.css" rel="stylesheet" type="text/css">

<a class="weui-cell weui-cell_access" href="/User/ManageAddress/">
    <div style="float: left">
        <div class="address_icon">
        </div>
    </div>
    <div>
        <div>
            <span >收货人：  </span>
            <span >高语越</span>
            <span > </span>
            <span style="float: right">13230524775</span>
        </div>
        <div>
            <span>收货地址：</span>
            <span>
            </span>
            <span>河北省 </span>
            <span>唐山市 </span>
            <span>曹妃甸区 </span>
            <span>唐山湾生态城 </span>
            <span>渤海大道21号华北理工大学东区梅园 </span>
        </div>
    </div>
    <div class="weui-cell__ft">
    </div>
</a>

<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=5>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">包裹大小</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="packageSize" type="text" value="">
        </div>
    </div>
</div>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">快递类型</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="packageType" type="text" value="">
        </div>
    </div>
</div>

<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="price" class="weui-input" type="text" placeholder="请输入价格（元）">
        </div>
    </div>
</div>

<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="note" class="weui-input" type="text" placeholder="请输入备注信息">
        </div>
    </div>
</div>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <textarea class="weui-textarea" id="address" placeholder="短信内容" rows="4"></textarea>
        </div>
    </div>
</div>

<div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" href="javascript:postPackage()" id="showTooltips">发布</a>
</div>

<script src="/assets/js/jquery-weui.min.js"></script>
<script src="/assets/js/fastclick.js"></script>
<script src="/app/js/mobile.utils.js"></script>
<script>
    $(document).ready(function () {
        $("#postPackage").addClass("weui-bar__item_on");
    });

    var success = function () {
        window.location.href = "/User/PostPackage/success";
    };

    function postPackage() {
        var data = {
            "certificate":{
                "owner":$("#owner").val(),
                "pickupNumber":$("#pickupNumber").val(),
                "tailNumber":$("#tailNumber").val()
            },
            "note":$("#note").val()
        };
        Post("/User/PostPackage/",data,success);
    }

    $(function() {
        FastClick.attach(document.body);
    });

    $("#packageSize").select({
        title: "选择包裹大小",
        items: ["鞋盒", "方便面箱","自行车"]
    });

    $("#packageType").select({
        title: "选择快递类型",
        items: ["申通", "中通", "圆通", "京东"]
    });
</script>

<%@include file="/user_footer.jsp"%>