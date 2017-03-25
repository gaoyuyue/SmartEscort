<%--
  Created by IntelliJ IDEA.
  User: stevenjack
  Date: 2017/3/25/025
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page badge js_show">
    <%--<div class="page__hd">--%>
        <%--<h1 class="page__title">Badge</h1>--%>
        <%--<p class="page__desc">徽章</p>--%>
    <%--</div>--%>

    <div class="weui-cells">
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
    <%--<div class="user">--%>
        <%--<div class="set-btn">--%>
            <%--<p>设置</p>--%>
        <%--</div>--%>
        <%--<div class="user-photo">--%>
            <%--<img src="//gw.alicdn.com/tps/i3/TB1yeWeIFXXXXX5XFXXuAZJYXXX-210-210.png_160x160.jpg">--%>
        <%--</div>--%>
        <%--<div class="user-nick">--%>
            <%--<p class="nick" id="J_myNick">啦啦啦啦啦啦55785812</p>--%>
            <%--<p class="level level0"></p>--%>
        <%--</div>--%>
    <%--</div>--%>

    <div class="page__bd">
        <div class="weui-cells__title">新消息提示跟摘要信息后，统一在列表右侧</div>
        <div class="weui-cells">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">单行列表</div>
                <div class="weui-cell__ft" style="font-size: 0">
                    <span style="vertical-align:middle; font-size: 17px;">详细信息</span>
                    <span class="weui-badge weui-badge_dot" style="margin-left: 5px;margin-right: 5px;"></span>
                </div>
            </div>
        </div>

        <div class="weui-cells__title">未读数红点跟在主题信息后，统一在列表左侧</div>
        <%--<div class="weui-cells">--%>
            <%--<div class="weui-cell">--%>
                <%--<div class="weui-cell__hd" style="position: relative;margin-right: 10px;">--%>
                    <%--<img src="images/pic_160.png" style="width: 50px;display: block">--%>
                    <%--<span class="weui-badge" style="position: absolute;top: -.4em;right: -.4em;">8</span>--%>
                <%--</div>--%>
                <%--<div class="weui-cell__bd">--%>
                    <%--<p>联系人名称</p>--%>
                    <%--<p style="font-size: 13px;color: #888888;">摘要信息</p>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <span style="vertical-align: middle">单行列表</span>
                    <span class="weui-badge" style="margin-left: 5px;">8</span>
                </div>
                <div class="weui-cell__ft"></div>
            </div>
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <span style="vertical-align: middle">单行列表</span>
                    <span class="weui-badge" style="margin-left: 5px;">8</span>
                </div>
                <div class="weui-cell__ft">详细信息</div>
            </div>
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd">
                    <span style="vertical-align: middle">单行列表</span>
                    <span class="weui-badge" style="margin-left: 5px;">New</span>
                </div>
                <div class="weui-cell__ft"></div>
            </div>
        </div>
    </div>
    <div class="page__ft j_bottom">
        <a href="javascript:home()"><img src="./images/icon_footer_link.png"></a>
    </div>
</div>
