<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/26/026
  Time: 19:27
  To change this template use File | Settings | File Templates.
  我的接单页面
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
                        <div class="weui-navbar__item">
                            <a href="/User/AllDart/" class="font_color">全部订单</a>
                        </div>
                        <div class="weui-navbar__item font_color">
                            <a href="/User/MyPublish/" class="font_color">我的发布</a>
                        </div>
                        <div class="weui-navbar__item weui-bar__item_on font_color">
                            <a href="/User/MyDart/" style="color:orange;" class="font_color">我的接单</a>
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
                        <a class="open-popup childPage" data-target="#showDartDetail"  onclick="hideNavbarSuspension()" publishDartId = '`+e.id+`'>
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
                                    <b>`+e.price+`</b>
                                </span>
                            </div>
                        </div>
                        <div class="button_position_style">
                                <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary" id="callSender" publishDartId='`+e.id+`' delegationPhoneNumber = '`+ e.delegation.phoneNumber+`'>联系收货人</a>
                        </div>
                    </div>
                </div>

                <div id="showDartDetail" class='weui-popup__container'>
                    <div class="weui-popup__overlay"></div>
                    <div class="weui-popup__modal">
                        <div class="top_other">
                            <span class="list_other"><a class="close-popup" onclick="showNavbarSuspension()"><img src="/assets/img/goback.png" align="top"></a></span>
                            <span ><a class="title_other">订单详情</a></span>
                            <span><a class="logo_other show-warning update" href="/"><img src="/assets/img/home.png" align="top"></a></span>
                        </div>

                        <div class="weui-cell_access">
                        <label class="weui-cell weui-check__label">
                            <div style="float: left;width: 10%">
                                <div class="address_icon">
                                </div>
                            </div>
                            <div style="width: 80%" class="weui-cell__bd">
                                <div>
                                    <span >收货人：  </span>
                                    <span id="delegationName"></span>
                                    <span > </span>
                                    <span style="float: right" id="delegationPhoneNumber"></span>
                                </div>
                                <div>
                                    <span>收货地址：</span>
                                    <span>
                                    </span>
                                    <span id="areaName"></span>
                                    <span id="areaDetail"></span>
                                </div>
                            </div>
                          <div class="weui-cell__ft" style="width: 5%">
                          </div>
                        </label>
                    </div>
                        <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=5>
                        <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                            <div class="weui-cell__bd">
                                <p>快递类型</p>
                            </div>
                            <div class="weui-cell__ft" id="courierCompany"></div>
                        </div>
                        <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                            <div class="weui-cell__bd">
                                <p>包裹大小</p>
                            </div>
                            <div class="weui-cell__ft" id="standardDescription"></div>
                        </div>
                        <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                            <div class="weui-cell__bd">
                                <p>短信</p>
                            </div>
                            <div class="weui-cell__ft" id="message"></div>
                        </div>
                        <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                            <div class="weui-cell__bd">
                                <p>价格</p>
                            </div>
                            <div class="weui-cell__ft" id="price"></div>
                        </div>
                        <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                            <div class="weui-cell__bd">
                                <p>备注</p>
                            </div>
                            <div class="weui-cell__ft" id="note"></div>
                        </div>



                    </div>
                </div>
           `);

        });
        $("#callSender").click(function () {
            const delegationPhoneNumber = $(this).attr("delegationPhoneNumber");
            $.actions({
                title: "收货联系方式",
                actions: [
                    {
                        text: delegationPhoneNumber,
                        className: "color-black",
                        onClick: function() {
                            window.location.href = "tel:delegationPhoneNumber";
                        }
                    }
                ]
            });
        });
        $(".childPage").click(function () {
            const publishDartId = $(this).attr("publishDartId");
            var packageData = function packageData(data) {
                $("#delegationName").text("");
                $("#delegationPhoneNumber").text("");
                $("#courierCompany").text("");
                $("#standardDescription").text("");
                $("#message").text("");
                $("#price").text("");
                $("#note").text("");
                $("#agencyName").text("");
                $("#agencyPhoneNumber").text("");
                $("#areaName").text("");
                $("#areaDetail").text("");

                $("#delegationName").text(data.delegation.name);
                $("#delegationPhoneNumber").text(data.delegation.phoneNumber);
                $("#courierCompany").text(data.courierCompany.companyName);
                $("#standardDescription").text(data.standard.description);
                $("#message").text(data.message);
                $("#price").text(data.price);
                $("#note").text(data.note);
                $("#areaName").text(data.area.areaName);
                $("#areaDetail").text(data.address.detail);
            };
            Get("/User/MyDart/dartDetail/publishDartId/"+publishDartId,packageData);
        });
    };
    $(document).ready(function () {
        Get("/User/MyDart/packageList",success);
    });
</script>



<script src="/assets/js/fastclick.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
    <%--嵌套页面--%>
    $(document).on("open", ".weui-popup-modal", function() {
        console.log("open popup");
    }).on("close", ".weui-popup-modal", function() {
        console.log("close popup");
    });
    function hideNavbarSuspension() {
        $("#navbarSuspension").css('display','none');
    }
    function showNavbarSuspension() {
        $("#navbarSuspension").css('display','block');
    }
</script>



<%@include file="/user_footer.jsp"%>
