<%--
  Created by IntelliJ IDEA.
  User: StevenJack
  Date: 2017/3/25/025
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<div id="frame">
    <div id="top">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">设置</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>
    <div class="page list js_show">
        <div class="page__bd">
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <strong>用户名</strong>
                    </div>
                    <div class="weui-cell__ft" id="userName"></div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <strong>姓名</strong>
                    </div>
                    <div class="weui-cell__ft" id="name"></div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <strong>手机号</strong>
                    </div>
                    <div class="weui-cell__ft" id="phoneNumber"></div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <strong>性别</strong>
                    </div>
                    <div class="weui-cell__ft" id="sex"></div>
                </div>
            </div>

            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="/User/PasswordChange/">
                    <div class="weui-cell__bd">
                        <strong>修改密码</strong>
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
                <a class="weui-cell weui-cell_access" href="javascript:;">
                    <div class="weui-cell__bd">
                        <strong>修改手机</strong>
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
            </div>


        </div>
    </div>
</div>


<script type="text/javascript">
    var success = function success(data) {
        $("#userName").text(data.userName);
        $("#name").text(data.name);
        $("#phoneNumber").text(data.phoneNumber);
    }
    AjaxGetRequest("/User/UserInfomation/current",success);

</script>
<%@include file="/user_footer.jsp"%>
