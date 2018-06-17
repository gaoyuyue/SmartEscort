<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/11/011
  Time: 21:02
  To change this template use File | Settings | File Templates.
  通知页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<div id="frame">
    <div id="top">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">通知</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>
<%@include file="/user_footer.jsp"%>
