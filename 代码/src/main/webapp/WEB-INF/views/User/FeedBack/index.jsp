<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/26/026
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    body{
        background-color: #eeeeee;
    }
</style>

<div id="frame">
    <div id="top">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">意见反馈</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
        <br>
        <div style="height: 20px">
            <span style="text-align: center;color: #8B91A0">您好，请在下方输入您的反馈意见，我们会尽快回复！</span>
        </div>
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell" >
                <div class="weui-cell__bd" >
                    <textarea class="weui-textarea textarea" id="counts" placeholder="请输入您的意见" rows="4"></textarea>
                    <div class="weui-textarea-counter"><span id="remainingwords">0</span>/200</div>
                </div>
            </div>
        </div>
        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" style="background-color: orange" href="javascript:postPackage()" id="showTooltips">提交</a>
        </div>

    </div>
</div>


<script language="javascript" type="text/javascript">
    $("#counts").keyup(function(){
        if($("#counts").val().length > 200){
            $("#counts").val( $("#counts").val().substring(0,200) );
        }
        $("#remainingwords").text( 200 - $("#counts").val().length ) ;
    });
</script>
<%@include file="/user_footer.jsp"%>

