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
        <a id="title">个人信息</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
            <div class="weui-cell__bd">
                <strong id="userName"></strong>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd">
                <label class="weui-label">姓名</label>
            </div>
            <div class="weui-cell__bd">
                <strong id="name"></strong>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd">
                <label class="weui-label">手机号</label>
            </div>
            <div class="weui-cell__bd">
                <strong id="phoneNumber"></strong>
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
