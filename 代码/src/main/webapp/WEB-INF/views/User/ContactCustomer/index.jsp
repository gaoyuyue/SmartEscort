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


</div>
<script>
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>
<%@include file="/user_footer.jsp"%>
