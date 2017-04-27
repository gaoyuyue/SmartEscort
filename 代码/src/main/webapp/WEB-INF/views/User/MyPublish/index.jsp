<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/26/026
  Time: 19:26
  To change this template use File | Settings | File Templates.
  我的发布页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    .dart_border_padding{
        padding: 0px 21px;
    }
    .status_style{
        color: orange;
        font-family: SimSun-ExtB;
        font-size: 15px
    }
</style>
<div id="frame">
    <div id="navbarSuspension">
        <div id="top">
            <span id="list">
                <a href="/User/PersonalCenter/"><img src="/assets/img/goback.png" align="top"></a>
            </span>
            <a id="title">订单管理</a>
            <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
        </div>
        <div class="page navbar js_show">
            <div class="page__bd">
                <div class="weui-tab">
                    <div class="weui-navbar">
                        <div class="weui-navbar__item font_color">
                            <a href="/User/AllDart/" class="font_color">全部订单</a>
                        </div>
                        <div class="weui-navbar__item weui-bar__item_on font_color">
                            <a href="/User/MyPublish/" style="color:orange;" class="font_color">我的发布</a>
                        </div>
                        <div class="weui-navbar__item font_color">
                            <a href="/User/MyDart/" class="font_color">我的接单</a>
                        </div>
                        <div class="weui-navbar__item font_color">
                            <a href="/User/WaitingEvaluation/" class="font_color">待评价</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="weui-tab__panel">
        <div class="page__bd" style="height: 50%;margin-top: 100px" id="packageList">

            <%--<div class="weui-cells">--%>
                <%--<div class="weui-form-preview">--%>
                    <%--<a href="/User/DartDetail/">--%>
                        <%--<div class="weui-form-preview__bd" style="background-color: #f5f5f5;border-bottom: 1px solid #e3e3e3;" >--%>
                            <%--<div class="weui-form-preview__item">--%>
                                <%--<label class="weui-form-preview__label">包裹大小</label>--%>
                                <%--<span class="weui-form-preview__value">大</span>--%>
                            <%--</div>--%>
                            <%--<div class="weui-form-preview__item">--%>
                                <%--<label class="weui-form-preview__label">快递类型</label>--%>
                                <%--<span class="weui-form-preview__value">圆通</span>--%>
                            <%--</div>--%>
                            <%--<div class="weui-form-preview__item">--%>
                                <%--<label class="weui-form-preview__label">地址区域</label>--%>
                                <%--<span class="weui-form-preview__value">梅园</span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                    <%--<div class="weui-form-preview__hd dart_border_padding">--%>
                        <%--<div class="weui-form-preview__item">--%>
                            <%--<label class="weui-form-preview__label status_style">待领取</label>--%>
                            <%--<span class="weui-form-preview__value" style="font-size: 15px">--%>
                                <%--付款金额 :--%>
                                <%--<b>24</b>--%>
                            <%--</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="button_position_style">--%>
                        <%--<button type="button">取消订单</button>--%>
                        <%--<button type="button" disabled="true">联系送货人</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>







        </div>
    </div>


</div>



<script type="text/javascript" class="navbar js_show">
    $(function(){
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            $(this).css("color",$(this).css("color"));
        });
    });
</script>

<script>
    var success = function (data) {
        $("#packageList").empty();
        data.forEach(function (e) {
           $("#packageList").append(`
                <div class="weui-cells">
                <div class="weui-form-preview">
                    <a href="/User/DartDetail/">
                        <div class="weui-form-preview__bd" style="background-color: #f5f5f5;border-bottom: 1px solid #e3e3e3;" >
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">包裹大小</label>
                                <span class="weui-form-preview__value">`+e.standard.description+`</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">快递类型</label>
                                <span class="weui-form-preview__value">`+e.courierCompany.companyName+`</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">地址区域</label>
                                <span class="weui-form-preview__value">`+e.area.areaName+`</span>
                            </div>
                        </div>
                    </a>
                    <div class="weui-form-preview__hd dart_border_padding">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label status_style">`+e.packageStatus+`</label>
                            <span class="weui-form-preview__value" style="font-size: 15px">
                                付款金额 :
                                <b>`+e.standard.price+`</b>
                            </span>
                        </div>
                    </div>
                    <div class="button_position_style">`+
                        ((e.packageStatus == '待领取') ? `<button type="button" id="deleteDart" publishDartId='`+e.id+`'>取消订单</button>` : `
                        <button type="button" id="callSender" publishDartId='`+e.id+`' agencyPhoneNumber = '`+ e.agency.phoneNumber+`'>联系送货人</button>`)
                    +`</div>
                </div>
            </div>
           `);
        });
        $("#deleteDart").click(function () {
            const publishDartId = $(this).attr("publishDartId");
            $.confirm("确认取消订单吗？", "提示", function() {
                Delete("/User/MyPublish/delete/publishDartId/"+publishDartId,function () {
                    window.location.href = "/User/MyPublish/";
                });
            }, function() {
                $(this).remove();
                $(".weui-mask").remove();
            });
        });
        $("#callSender").click(function () {
            const agencyPhoneNumber = $(this).attr("agencyPhoneNumber");
            $.actions({
                title: "送货人联系方式",
                actions: [
                    {
                        text: agencyPhoneNumber,
                        className: "color-primary",
                        onClick: function() {
                            window.location.href = "tel:18231550929";
                        }
                    }
                ]
            });
        });
    };
    $(document).ready(function () {
        Get("/User/MyPublish/packageList",success);
    });


</script>


<%@include file="/user_footer.jsp"%>
