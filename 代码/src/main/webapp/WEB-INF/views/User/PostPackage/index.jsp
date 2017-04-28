<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/21
  Time: 16:02
  To change this template use File | Settings | File Templates.
  发布任务页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<link href="/assets/css/jquery-weui.min.css" rel="stylesheet" type="text/css">

<div id="addressTable" style="width: 100%">

</div>

<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=5>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">包裹大小</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="packageSize" placeholder="请选择包裹大小" type="text" value="">
        </div>
    </div>
</div>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">快递类型</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="packageType" placeholder="请选择快递类型" type="text" value="">
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
            <textarea class="weui-textarea" id="message" placeholder="短信内容" rows="4"></textarea>
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
        Get("/User/PostPackage/addressAndCache",getData);
        Get("/User/PostPackage/standardList",getStandard);
        Get("/User/PostPackage/courierList",getCourier);
    });

    var success = function () {
        window.location.href = "/User/PostPackage/success";
    };

    function postPackage() {
        var data = {
            address:{
                id:$("#cacheLink").attr("addressId")
            },
//            standard:{
//                description:$("#packageSize").val()
//            },
            courierCompany:{
                companyName:$("#packageType").val()
            },
            note:$("#note").val(),
            message:$("#message").val()
        };
        Post("/User/PostPackage/",data,success);
    }

    $(function() {
        FastClick.attach(document.body);
    });

    const getStandard = function (data) {
        $("#packageSize").select({
            title: "选择包裹大小",
            items: data
        });
    };

    const getCourier = function (data) {
        $("#packageType").select({
            title: "选择快递类型",
            items: data
        });
    };

    const getData = function (data) {
        if (data.hasCache){
            $("#packageSize").val(data.packageSize);
            $("#packageType").val(data.packageType);
            $("#price").val(data.price);
            $("#note").val(data.note);
            $("#message").val(data.message);
        }
        if (data.address == null){
            $("#addressTable").append(
                `<a class="weui-cell weui-cell_access" href="/User/PostPackage/addAddress" id="cacheLink">
                    <div style="float: left">
                        <div class="address_icon">
                        </div>
                    </div>
                    <div>
                        <span >+  </span>
                        <span >添加收货地址</span>
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
                `
            );
        }else {
            $("#addressTable").append(
                `<a class="weui-cell_access" href="/User/PostPackage/selectAddress" id="cacheLink" addressId="`+data.address.id+`">
                    <label class="weui-cell weui-check__label">
                        <div style="float: left;width: 10%">
                            <div class="address_icon">
                            </div>
                        </div>
                      <div style="width: 80%" class="weui-cell__bd">
                         <div>
                            <span >收货人：  </span>
                            <span >`+data.address.receiverName+`</span>
                            <span > </span>
                            <span style="float: right">`+data.address.phoneNumber+`</span>
                        </div>
                        <div>
                            <span>收货地址：</span>
                            <span>`+data.address.area.areaName+`</span>
                            <span>`+data.address.detail+`</span>
                        </div>
                      </div>
                      <div class="weui-cell__ft" style="width: 5%">
                      </div>
                    </label>
                </a>`
            );
        }
        $("#cacheLink").click(function () {
            var data = {
                packageSize:$("#packageSize").val(),
                packageType:$("#packageType").val(),
                price:$("#price").val(),
                note:$("#note").val(),
                message:$("#message").val()
            };
            Post("/User/PostPackage/cache",data,function () {
            });
        });
    };

</script>

<%--<div>--%>
    <%--<div>--%>
        <%--<span >收货人：  </span>--%>
        <%--<span >`+data.address.receiverName+`</span>--%>
        <%--<span > </span>--%>
        <%--<span style="float: right">`+data.address.phoneNumber+`</span>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--<span>收货地址：</span>--%>
        <%--<span>`+data.address.area.areaName+`</span>--%>
        <%--<span>`+data.address.detail+`</span>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<div class="weui-cell__ft" style="margin-right: 5px">--%>
<%--</div>--%>

<%@include file="/user_footer.jsp"%>