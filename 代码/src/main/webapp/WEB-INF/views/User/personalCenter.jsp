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
    a{
        text-decoration:none;
        color: black;
    }
</style>

<!--页面-->
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
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/assets/img/daishouhuo.png" alt="">
                    </div>
                    <p class="weui-grid__label">待收货</p>
                </a>
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/assets/img/daijiebiao.png" alt="">
                    </div>
                    <p class="weui-grid__label">已接镖</p>
                    <a href="javascript:;" class="weui-grid">
                        <div class="weui-grid__icon">
                            <img src="/assets/img/daipingjia.png" alt="">
                        </div>
                        <p class="weui-grid__label">待评价</p>
                    </a>
                </a>
            </div>
        </div>
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <img src="/assets/img/dingdan.png" style="margin-top: 3px; float: left">
                <div style="float: left;margin-top: 3px;">
                    <span style="vertical-align: middle; margin-top: 3px;">全部镖单</span>
                    <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                </div>
            </div>
            <div class="weui-cell__ft">查看全部订单</div>
        </div>
    </div>

    <div class="weui-cells">
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <img src="/assets/img/gerenxinxi.png" style="margin-top: 3px; float: left">
                <div style="float: left;margin-top: 3px;">
                    <a href="/User/UserInfomation"><span style="vertical-align: middle; margin-top: 3px;">个人信息</span></a>
                    <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                </div>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <img src="/assets/img/mima.png" style="margin-top: 3px; float: left">
                <div style="float: left;margin-top: 3px;">
                    <a href="/User/PasswordChange"><span style="vertical-align: middle; margin-top: 3px;">修改密码</span></a>
                    <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                </div>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <img src="/assets/img/shouhuodizhi.png" style="margin-top: 3px; float: left">
                <div style="float: left;margin-top: 3px;">
                    <a href="/User/ManageAddress"><span style="vertical-align: middle; margin-top: 3px;">抵达地点</span></a>
                    <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                </div>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
    </div>

    <div class="weui-cells">
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <img src="/assets/img/xingqu.png" style="margin-top: 3px; float: left">
                <div style="float: left;margin-top: 3px;">
                    <span style="vertical-align: middle; margin-top: 3px;">我的关注</span>
                    <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                </div>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
        <div class="weui-cell weui-cell_access">
            <div class="weui-cell__bd">
                <img src="/assets/img/yijianfankui.png" style="margin-top: 3px; float: left">
                <div style="float: left;margin-top: 3px;">
                    <span style="vertical-align: middle; margin-top: 3px;">意见反馈</span>
                    <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                </div>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
    </div>
</div>
<%@include file="/user_footer.jsp"%>
