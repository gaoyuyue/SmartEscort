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
            <a class="weui-navbar__item weui-bar__item--on" id="priceSlect" href="#tab1">
                价格
            </a>
            <a class="weui-navbar__item" href="#tab2" id="creditSlect">
                信用
            </a>
            <a class="weui-navbar__item" id="select" type="text" href="#tab3">
                筛选
                <input type="text" id="textpicker"/>
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

        $(".weui-form-preview__item").on('click',function () {
            var packageSize = $("#packageSize").val();
            var packageType = "";
            var price = $("#price").val();
            var remakers = "";

            $.confirm({
                title: '确定要接单吗？',
                text:   '大小'+packageSize+'<br/>'+
                        '类型'+packageType+'<br/>'+
                        '价格'+price+'<br/>' +
                        '备注:'+'<br/>'+
                        '<textarea rows="5" cols="10"></textarea>',
                onOK: function () {
                    //点击确认
                },
                onCancel: function () {
                }
            });
        });
        
        $('#priceSlect').on('click',function () {
            $.actions({
                actions: [{
                    text: "从高到低排序",
                    onClick: function() {
                        //do something
                    }
                },{
                    text: "从低到高排序",
                    onClick: function() {
                        //do something
                    }
                }]
            });
        });

        $('#creditSlect').on('click',function () {
            $.actions({
                actions: [{
                    text: "从高到低排序",
                    onClick: function() {
                        //do something
                    }
                },{
                    text: "从低到高排序",
                    onClick: function() {
                        //do something
                    }
                }]
            });
        });

        $('#textpicker').picker({

            title:'',
            cols:[
                {
                    textAlign:'center',
                    values:['顺风','京东','圆通']
                },
                {
                    textAlign:'center',
                    values:['大','中','小']
                }
            ]
        });


    
    </script>
<script src="//cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/jquery-weui/1.0.1/js/jquery-weui.min.js"></script>

<%@include file="/user_footer.jsp"%>
