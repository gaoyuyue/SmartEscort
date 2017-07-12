<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/26/026
  Time: 19:05
  To change this template use File | Settings | File Templates.
  意见反馈页面
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
        <div style="height: auto;margin:0;padding:0;line-height: 25px;text-align: left">
            <span style="color: #8B91A0;position:relative;left: 10px;right: 5px">您好，请在下方输入您的反馈意见，我们会认真查看您的反馈。</span>
        </div>
        <div class="weui-cells weui-cells_form" style="margin:0;padding:0;">
            <div class="weui-cell" >
                <div class="weui-cell__bd" >
                    <textarea class="weui-textarea textarea" id="counts" placeholder="请输入您的意见" rows="4"></textarea>
                    <div class="weui-textarea-counter"><span id="remainingwords">0</span>/200</div>
                </div>
            </div>
        </div>
        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_primary" style="background-color: orange" href="#" id="showTooltips">提交</a>
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
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>
<script language="javascript" type="text/javascript">
    $("#showTooltips").click(function () {
            var content = $("#counts").val();
        if(
            isNullOrEmpty(content)
        ){$.toptip('内容不能为空', 'warning');}
            else {
                $.ajax({
                    type: "Post",
                    url: "/User/FeedBack/content/" + content,
                    success: function () {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
                $("#counts").val("");
                $.toptip('提交成功！感谢您的意见', 'warning');

            }
    })
</script>
<script src="/assets/js/jquery-weui.min.js"></script>
<script src="/assets/js/fastclick.js"></script>
<%@include file="/user_footer.jsp"%>

