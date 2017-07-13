<%--
  Created by IntelliJ IDEA.
  User: Yzf
  Date: 2017/7/12/012
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<div id="frame">
    <div id="navbarSuspension">
        <div id="top">
            <span id="list">
                <a href="/User/PersonalCenter/"><img src="/assets/img/goback.png" align="top"></a>
            </span>
            <a id="title">联系客服</a>
            <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
        </div>
        <div style="margin: 15px;text-indent: 2em">
            <strong>亲，如果您有疑问或需要帮助，请联系我们的客服噢！</strong>
            <br>
            <br>
            <div style="margin: 20px">
                <a style="color: orange" class="weui-btn weui-btn_plain-default" href="mqqwpa://im/chat?chat_type=wpa&uin=1519035296&version=1&src_type=web&web_src=escort.attackme.cn">QQ:1519035296</a>
                <a class="weui-btn weui-btn_plain-default" href="mqqwpa://im/chat?chat_type=wpa&uin=1519035296&version=1&src_type=web&web_src=escort.attackme.cn">QQ:1519035296</a>
            </div>
            <div style="margin: 20px">
                <a style="color: orange" class="weui-btn weui-btn_plain-default" href="tel:15678879836">TEL:15678879836</a>
                <a style="color: orange" class="weui-btn weui-btn_plain-default" href="tel:15678879836">TEL:15678879836</a>
            </div>
            <br>
            <br>

        </div>

</div>
<script>
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>
<%@include file="/user_footer.jsp"%>
