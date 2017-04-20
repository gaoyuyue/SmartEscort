<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/15/015
  Time: 14:21
  To change this template use File | Settings | File Templates.
  订单详情页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<div id="frame">


    <div id="top">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">订单详情</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>

    <div class="weui-cell weui-cell_access">
        <div style="float: left">
            <div class="address_icon">
            </div>
        </div>
        <div>
            <div>
                <span >收货人：  </span>
                <span >高语越</span>
                <span > </span>
                <span style="float: right">13230524775</span>
            </div>
            <div>
                <span>收货地址：</span>
                <span>
            </span>
                <span>河北省 </span>
                <span>唐山市 </span>
                <span>曹妃甸区 </span>
                <span>唐山湾生态城 </span>
                <span>渤海大道21号华北理工大学东区梅园 </span>
            </div>
        </div>
        <div class="weui-cell__ft">
        </div>
    </div>

    <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=5>
    <div class="weui-cell">
        <img src="/assets/img/DartImg.jpg" style="width: 100%;height: 20%">
        <div class="weui-cell__bd">
         
        </div>
    </div>
    <br>
    

    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>快递类型</p>
        </div>
        <div class="weui-cell__ft">圆通</div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>包裹大小</p>
        </div>
        <div class="weui-cell__ft">大</div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>短信</p>
        </div>
        <div class="weui-cell__ft">说明文字</div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>价格</p>
        </div>
        <div class="weui-cell__ft">24</div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>备注</p>
        </div>
        <div class="weui-cell__ft">说明文字</div>
    </div>

    <a href="javascript:;" class="weui-btn weui-btn_primary">取消订单</a>


</div>



<%@include file="/user_footer.jsp"%>