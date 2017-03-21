<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/21
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="weui-cells__title">取件号</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="number" class="weui-input" type="text" placeholder="请输入取件号">
        </div>
    </div>
</div>
<div class="weui-cells__title">手机尾号</div>
<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="phoneNumber" class="weui-input" type="text" placeholder="请输入手机尾号">
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

<script>
    function postPackage() {
        var data = {
        }
    }
</script>