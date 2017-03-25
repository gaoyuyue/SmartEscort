<%--
  Created by IntelliJ IDEA.
  User: stevenjack
  Date: 2017/3/25/025
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    .weui-grid-new{
        position:relative;
        float:left;
        padding:20px 10px;
        width:4%;
        box-sizing:border-box
    }
</style>

<div class="page badge js_show">
        <div class="weui-cell">
            <div class="weui-cell__hd" style="position: relative;margin-right: 10px;">
                <img src="//gw.alicdn.com/tps/i3/TB1yeWeIFXXXXX5XFXXuAZJYXXX-210-210.png_160x160.jpg" style="width: 50px;display: block">
                <span class="weui-badge" style="position: absolute;top: -.4em;right: -.4em;">8</span>
            </div>
            <div class="weui-cell__bd">
                <p>联系人名称</p>
                <p style="font-size: 13px;color: #888888;">摘要信息</p>
            </div>
        </div>

    <div class="weui-cells">
        <div class="page__hd">



            <div class="weui-grids">
                <a class="weui-grid-new">
                    <div class="weui-grid__icon">
                    <p>发镖人</p>
                    </div>
                </a>
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/assets/img/daishouhuo.png" alt="">
                    </div>
                    <p class="weui-grid__label">待收货</p>
                </a>
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/assets/img/daipingjia.png" alt="">
                    </div>
                    <p class="weui-grid__label">待评价</p>
                </a>
            </div>
        </div>
        <div class="page__hd">

            <div class="weui-grids">
                <a class="weui-grid-new">
                    <div class="weui-grid__icon">
                        <p>镖师</p>
                    </div>
                </a>
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/assets/img/daijiebiao.png" alt="">
                    </div>
                    <p class="weui-grid__label">已接镖</p>
                </a>
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/assets/img/daipingjia.png" alt="">
                    </div>
                    <p class="weui-grid__label">待评价</p>
                </a>
            </div>
        </div>
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <img src="/assets/img/dingdan.png">
                <span style="vertical-align: middle">全部订单</span>
                <span class="weui-badge" style="margin-left: 5px;">8</span>
            </div>
            <div class="weui-cell__ft">查看全部订单</div>
        </div>
    </div>

    <div class="weui-cells">
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <span style="vertical-align: middle">个人信息</span>
                <span class="weui-badge" style="margin-left: 5px;">8</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
     </div>

    <div class="weui-cells">
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <span style="vertical-align: middle">修改密码</span>
                <span class="weui-badge" style="margin-left: 5px;">8</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
    </div>

    <div class="weui-cells">
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <span style="vertical-align: middle">收货地址</span>
                <span class="weui-badge" style="margin-left: 5px;">8</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
    </div>

    <div class="weui-cells">
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <span style="vertical-align: middle">我的关注</span>
                <span class="weui-badge" style="margin-left: 5px;">8</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
    </div>

</div>

<%@include file="/user_footer.jsp"%>
