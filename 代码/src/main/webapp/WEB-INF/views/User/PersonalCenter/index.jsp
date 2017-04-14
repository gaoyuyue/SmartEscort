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
            <strong id="userName"></strong>
            <p style="font-size: 13px;color: #888888;">摘要信息</p>
        </div>
    </div>

    <div class="weui-cells">
        <div class="page__hd">
            <div class="weui-grids">
                <a href="/User/WaitingGoods/" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/assets/img/daishouhuo.png" alt="">
                    </div>
                    <p class="weui-grid__label">我的发布</p>
                </a>
                <a href="/User/ReceivedDarts/" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/assets/img/daijiebiao.png" alt="">
                    </div>
                    <p class="weui-grid__label">我的接单</p>
                </a>
                <a href="/User/WaitingEvaluation/" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="/assets/img/daipingjia.png" alt="">
                    </div>
                    <p class="weui-grid__label">待评价</p>
                </a>

            </div>
        </div>
        <a href="/User/AllDart/">
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
        </a>
    </div>

    <div class="weui-cells">
        <a href="/User/UserInfomation/">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <img src="/assets/img/gerenxinxi.png" style="margin-top: 3px; float: left">
                    <div style="float: left;margin-top: 3px;">
                        <span style="vertical-align: middle; margin-top: 3px;">个人信息</span>
                        <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                    </div>
                </div>
                <div class="weui-cell__ft"></div>
            </div>
        </a>
        <a href="/User/PasswordChange/">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <img src="/assets/img/mima.png" style="margin-top: 3px; float: left">
                    <div style="float: left;margin-top: 3px;">
                        <span style="vertical-align: middle; margin-top: 3px;">修改密码</span>
                        <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                    </div>
                </div>
                <div class="weui-cell__ft"></div>
            </div>
        </a>
        <a href="/User/ManageAddress/">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <img src="/assets/img/shouhuodizhi.png" style="margin-top: 3px; float: left">
                    <div style="float: left;margin-top: 3px;">
                        <span style="vertical-align: middle; margin-top: 3px;">抵达地点</span>
                        <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                    </div>
                </div>
                <div class="weui-cell__ft">详细地址管理</div>
            </div>
        </a>
    </div>

        <a href="/User/MyConcern/">
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
            </div>
        </a>
        <a href="/User/FeedBack/">
                <div class="weui-cell weui-cell_access">
                    <div class="weui-cell__bd">
                        <img src="/assets/img/yijianfankui.png" style="margin-top: 3px; float: left">
                        <div style="float: left;margin-top: 3px;">
                            <span style="vertical-align: middle; margin-top: 3px; font-size: 17px">意见反馈</span>
                            <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                        </div>
                    </div>
                    <div class="weui-cell__ft"></div>
                </div>
        </a>
        <a href="/User/Notice/">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <img src="/assets/img/tongzhi.png" style="margin-top: 3px; float: left">
                    <div style="float: left;margin-top: 3px;">
                        <span style="vertical-align: middle; margin-top: 3px;font-size: 17px">通知</span>
                        <span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>
                    </div>
                </div>
                <div class="weui-cell__ft"></div>
            </div>
        </a>
    </div>
</div>
<script type="text/javascript">
    var fillUser = function fillUser(result) {
        console.error(result);
        $("#userName").text(result.name);
    };
    $(document).ready(function () {
        AjaxGetRequest("/UserManagement/UserInfo", fillUser);
    })
</script>
<%@include file="/user_footer.jsp"%>
