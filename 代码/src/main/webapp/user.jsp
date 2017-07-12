<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/21
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="user_header.jsp"%>
<div style="height: 20%" class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide"><img width="100%" src="//gqianniu.alicdn.com/bao/uploaded/i4//tfscom/i1/TB1n3rZHFXXXXX9XFXXXXXXXXXX_!!0-item_pic.jpg_320x320q60.jpg" alt=""></div>
        <div class="swiper-slide"><img width="100%" src="//gqianniu.alicdn.com/bao/uploaded/i4//tfscom/i4/TB10rkPGVXXXXXGapXXXXXXXXXX_!!0-item_pic.jpg_320x320q60.jpg" alt=""></div>
        <div class="swiper-slide"><img width="100%" src="//gqianniu.alicdn.com/bao/uploaded/i4//tfscom/i1/TB1kQI3HpXXXXbSXFXXXXXXXXXX_!!0-item_pic.jpg_320x320q60.jpg" alt=""></div>
    </div>
</div>
<script src="/assets/js/swiper.min.js"></script>
<script>
    $(document).ready(function () {
        $("#home").addClass("weui-bar__item_on");
    });

    $(".swiper-container").swiper({
        loop: true,
        autoplay: 2000
    });
</script>

<%@include file="user_footer.jsp"%>