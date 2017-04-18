<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/31
  Time: 16:47
  To change this template use File | Settings | File Templates.
  领取任务页
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>

<div class="weui-panel weui-panel_access">
    <div class="weui-tab">
        <div class="weui-navbar">
            <a class="weui-navbar__item weui-bar__item--on" href="#tab1">
                价格
            </a>
            <a class="weui-navbar__item" href="#tab2">
                信用
            </a>
            <a class="weui-navbar__item" href="#tab3">
                筛选
            </a>
        </div>
    </div>
    <div class="weui-form-preview">
        <div class="weui-panel__bd">
            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg confirmation">
                <div style="clear: both">
                    <div class="weui-media-box__hd">
                        <img class="weui-media-box__thumb" src="/assets/img/SF.jpg">
                    </div>
                    <div class="weui-form-preview__item">
                        <span class="weui-form-preview__value" >高语越</span>
                        <%--<span class="weui-form-preview__value">男</span>--%>
                        <img src="/assets/img/boy.png" width="51" height="51">

                    </div>
                </div>
                <div style="clear: both">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">发布日期</label>
                        <span class="weui-form-preview__value">2016-4-18</span>
                    </div>

                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">区域</label>
                        <span class="weui-form-preview__value">梅一南楼102</span>
                    </div>
                    <div class="weui-form-preview__item" id="packageSize">
                        <label class="weui-form-preview__label">大小</label>
                        <span class="weui-form-preview__value" >大（有自行车辣么大）</span>
                    </div>

                    <div class="weui-form-preview__item" id="price">
                        <label class="weui-form-preview__label">价格</label>
                        <span class="weui-form-preview__value" >24元</span>
                    </div>
                </div>
            </a>
        </div>

    </div>
</div>

<script>
    $(document).ready(function () {
        $("#getPackage").addClass("weui-bar__item_on");
    });
    $(function () {
        $(".weui-form-preview__item").on('click',function () {

            var packageSize = $("#packageSize").val();
            var packageType = "";
            var price = $("#price").val();
            var remakers = "";

            $.confirm({
                title: '确定要接单吗？',
                text:   "<textarea></textarea>",


                onOK: function () {
                    //点击确认
                },
                onCancel: function () {
                }
            });
        });

    });
</script>
<%@include file="/user_footer.jsp"%>
