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
    .weui-loadmore_line{
        position: relative;
        top: 70%;
        -webkit-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        transform: translateY(-50%);
        font-size: 17px;
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
        <div class="page__bd" style="height: 50%;margin-top: 100px;" id="packageList">
                <div class="weui-loadmore weui-loadmore_line" style="border-color: #c1c3c4">
                    <span class="weui-loadmore__tips">暂无数据</span>
                </div>
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
        if(!isNullOrEmpty(data)){
            $("#packageList").empty();
        }
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
                        <div class="button_sp_area">
                            <div style="float:right;">
                            `+(
                                (e.packageStatus == '待领取') ? `<a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary cancelDart" style="margin: 3px;" publishDartId='`+e.id+`'>撤销订单</a>`
                            :
                            (
                                (e.packageStatus == '待签收') ?
                            `<a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary receivedDart" style="margin: 3px;" publishDartId='`+e.id+`'>确认签收</a>
                            <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_default callSender" style="margin: 3px;" publishDartId='`+e.id+`' agencyPhoneNumber = '`+ e.agency.phoneNumber+`'>联系送货人</a>`
                            :
                            `<a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary callSender" style="margin: 3px;" publishDartId='`+e.id+`' agencyPhoneNumber = '`+ e.agency.phoneNumber+`'>联系送货人</a>`
                                )
                            )+`
                            <div>
                        </div>
                    </div>
                </div>

                <div id="showDartDetail" class='weui-popup__container' style="height: 100%">
                    <div class="weui-popup__overlay"></div>
                    <div class="weui-popup__modal">
                    <div class="weui-tab__panel">
                        <div class="top_other">
                            <span class="list_other"><a class="close-popup" onclick="showNavbarSuspension()"><img src="/assets/img/goback.png" align="top"></a></span>
                            <span ><a class="title_other">订单详情</a></span>
                            <span><a class="logo_other show-warning update" href="/"><img src="/assets/img/home.png" align="top"></a></span>
                        </div>


                        <div class="weui-cells">
                            <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                                    <div class="weui-cell__bd">
                                        <p>订单编号</p>
                                    </div>
                                    <div class="weui-cell__ft" id="packageId" style = "font-size: 13px"></div>
                            </div>
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
                                    <p>价格</p>
                                </div>
                                <div class="weui-cell__ft" id="price"></div>
                            </div>
                        </div>

                        <br>

                        <div class="weui-cells">
                            <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                                <div class="weui-cell__bd">
                                    <p>短信</p>
                                </div>
                            </div>
                            <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                                <div class="weui-cell__bd" id="message">
                                </div>
                            </div>
                            <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                                <div class="weui-cell__bd" >
                                    <p>备注</p>
                                </div>
                                <div class="weui-cell__ft" id="note"></div>
                            </div>
                        </div>
                        <br>
                        <div class="weui-cells" id="agencyDetail">
                        </div>
                    </div>
                    </div>
                </div>
           `);

        });
        $(".cancelDart").click(function () {
            "use strict";
            const publishDartId = $(this).attr("publishDartId");
            $.confirm("确认撤销订单吗？", "提示", function() {
                $.ajax({
                    url:"/User/MyPublish/cancel/publishDartId/"+publishDartId,
                    type:"PUT",
                    contentType:"application/json",
                    data:JSON.stringify(publishDartId),
                    success:function () {
                        window.location.href = "/User/MyPublish/";
                    },
                    error:function (XMLHttpRequest) {

                    }
                });
            }, function() {

            });
        });
        $(".receivedDart").click(function () {
            "use strict";
            const publishDartId = $(this).attr("publishDartId");
            $.confirm("确认收到货物吗？", "提示", function() {
                $.ajax({
                    url:"/User/MyPublish/cancel/publishDartId/"+publishDartId,
                    type:"PUT",
                    contentType:"application/json",
                    data:JSON.stringify(publishDartId),
                    success:function () {
                        window.location.href = "/User/MyPublish/";
                    },
                    error:function (XMLHttpRequest) {

                    }
                });
            }, function() {

            });
        });
        $(".callSender").click(function () {
            const agencyPhoneNumber = $(this).attr("agencyPhoneNumber");
            $.actions({
                title: "送货人联系方式",
                actions: [
                    {
                        text: agencyPhoneNumber,
                        className: "color-black",
                        onClick: function() {
                            window.location.href = "tel:"+agencyPhoneNumber;
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
                $("#packageId").text("");

                $("#packageId").text(data.id);
                $("#delegationName").text(data.delegation.name);
                $("#delegationPhoneNumber").text(data.delegation.phoneNumber);
                $("#courierCompany").text(data.courierCompany.companyName);
                $("#standardDescription").text(data.standard.description);
                $("#message").text(data.message);
                $("#price").text(data.price);
                $("#note").text(data.note);
                $("#areaName").text(data.area.areaName);
                $("#areaDetail").text(data.addressDetail);

                if(data.packageStatus == '待签收' || data.packageStatus == '待送达'){
                    $("#agencyName").text(data.agency.name);
                    $("#agencyPhoneNumber").text(data.agency.phoneNumber);
                }
                $("#agencyDetail").empty();

                $("#agencyDetail").append(
                        (data.packageStatus == '待领取')
                            ?
                            `
                                    <div class="weui-panel__bd">
                                            <div class="weui-media-box weui-media-box_small-appmsg">
                                                <div class="weui-cells">
                                                     <div class="weui-cell weui-cell_access">
                                                        <div class="weui-cell__hd"><img src="/assets/img/jusanglian.png" alt="" style="width:20px;margin-right:50px;display:block"></div>
                                                        <div class="weui-cell__bd weui-cell_primary">
                                                            <p>您的订单还未被领取</p>
                                                        </div>
                                                     </div>
                                                </div>
                                            </div>
                                    </div>
                            `
                            :
                            `
                                 <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                                       <div class="weui-cell__bd">
                                            <p>送货人姓名</p>
                                       </div>
                                       <div class="weui-cell__ft" id="agencyName">`+data.agency.name+`</div>
                                 </div>
                                  <div class="weui-cell" style="border-bottom: 1px solid #d3d3d3">
                                       <div class="weui-cell__bd">
                                            <p>送货人联系方式</p>
                                       </div>
                                       <div class="weui-cell__ft" id="agencyPhoneNumber">`+data.agency.phoneNumber+`</div>
                                 </div>
                        `
                );

            };
            Get("/User/MyPublish/dartDetail/publishDartId/"+publishDartId,packageData);
        });
    };
    $(document).ready(function () {
        Get("/User/MyPublish/packageList",success);
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
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>

<%@include file="/user_footer.jsp"%>
