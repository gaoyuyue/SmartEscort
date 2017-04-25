<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/26/026
  Time: 19:28
  To change this template use File | Settings | File Templates.
  待评价页面
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
                        <div class="weui-navbar__item">
                            <a href="/User/MyPublish/" class="font_color">我的发布</a>
                        </div>
                        <div class="weui-navbar__item">
                            <a href="/User/MyDart/" class="font_color">我的接单</a>
                        </div>
                        <div class="weui-navbar__item weui-bar__item_on">
                            <a href="/User/WaitingEvaluation/" style="color:orange;" class="font_color">待评价</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="weui-tab__panel">
        <div class="page__bd" style="height: 50%;margin-top: 100px">

            <div class="weui-cells">
                <div class="weui-form-preview">
                    <a href="/User/DartDetail/">
                        <div class="weui-form-preview__bd" style="background-color: #f5f5f5;border-bottom: 1px solid #e3e3e3;" >
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">包裹大小</label>
                                <span class="weui-form-preview__value">大</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">快递类型</label>
                                <span class="weui-form-preview__value">圆通</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">地址区域</label>
                                <span class="weui-form-preview__value">梅园</span>
                            </div>
                        </div>
                    </a>
                    <div class="weui-form-preview__hd dart_border_padding">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label status_style" style="">已签收</label>
                            <span class="weui-form-preview__value" style="font-size: 15px">
                                付款金额 :
                                <b>24</b>
                            </span>
                        </div>
                    </div>
                    <div class="button_position_style">
                        <button type="button">删除订单</button>
                        <button type="button"><a href="/User/EvaluationDetail/" style="color: black">评价</a></button>
                    </div>
                </div>
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




<%@include file="/user_footer.jsp"%>
