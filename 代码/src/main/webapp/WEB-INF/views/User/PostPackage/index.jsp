<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/21
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    .icon {
        margin-right: 9px;
        height: 21px;
        width: 21px;
        background: url(/assets/img/address.png) 50% 50% no-repeat;
        background-size: 15px 20px;
    }
</style>

<a class="weui-cell weui-cell_access" href="/User/ManageAddress/">
    <div style="float: left">
        <div class="icon">
        </div>
    </div>
    <div>
        <%--<article class="weui-article">--%>
            <%--<section>--%>
            <div>
                <span >收货人：  </span>
                <span >高语越</span>
                <span > </span>
                <span style="float: right">13230524775</span>
            </div>
            <%--</section>--%>
            <%--<section>--%>
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
            <%--</section>--%>
        <%--</article>--%>
    </div>
    <div class="weui-cell__ft">
    </div>
</a>

<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=5>

<div class="weui-cells__title">取件人姓名</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="owner" class="weui-input" type="text" placeholder="请输入取件人姓名">
        </div>
    </div>
</div>
<div class="weui-cells__title">取件号</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="pickupNumber" class="weui-input" type="text" placeholder="请输入取件号">
        </div>
    </div>
</div>
<div class="weui-cells__title">手机尾号</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="tailNumber" class="weui-input" type="text" placeholder="请输入手机尾号">
        </div>
    </div>
</div>
<div class="weui-cells__title">备注</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="note" class="weui-input" type="text" placeholder="请输入备注信息">
        </div>
    </div>
</div>
<div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" href="javascript:postPackage()" id="showTooltips">发布</a>
</div>

<script src="/app/js/mobile.utils.js"></script>
<script>
    $(document).ready(function () {
        $("#postPackage").addClass("weui-bar__item_on");
    });
    function postPackage() {
        var data = {
            "certificate":{
                "owner":$("#owner").val(),
                "pickupNumber":$("#pickupNumber").val(),
                "tailNumber":$("#tailNumber").val()
            },
            "note":$("#note").val()
        };
        Post("/User/PostPackage/",data);
    }
</script>

<%@include file="/user_footer.jsp"%>