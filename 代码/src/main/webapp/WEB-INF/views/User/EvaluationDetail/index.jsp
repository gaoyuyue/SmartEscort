<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/15/015
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    ul {
        padding-left: 0;
        overflow: hidden;
    }
    ul li {
        float: left;
        list-style: none;
        width: 27px;
        height: 27px;
        background: url(img/star.gif)
    }
    ul li a {
        display: block;
        width: 100%;
        padding-top: 27px;
        overflow: hidden;
    }
    ul li.light {
        background-position: 0 -29px;
    }
</style>
<div id="frame">
    <div id="top">
        <span id="list">
            <a href="/User/WaitingEvaluation/"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">发表评价</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>

    <div class="weui-cell">
        <div class="weui-cell__hd" style="position: relative;margin-right: 10px;">
            <img src="/assets/img/a7.jpg" style="width: 50px;display: block">
        </div>
        <div class="weui-cell__bd">
            <p>联系人名称:<b>高语越</b></p>
            <p style="font-size: 13px;color: #888888;">hahahahahah</p>
        </div>
    </div>
    <br>

    <div class="weui-tab">
        <div class="weui-navbar">
            <a class="weui-navbar__item weui-bar__item--on border_Evaluation_color font_color" href="#good">
                <img src="/assets/img/good.png" alt="" style="width:15px;margin-right:10px;">
                好评
            </a>
            <a class="weui-navbar__item font_color" href="#order">
                <img src="/assets/img/order.png" alt="" style="width:15px;margin-right:10px;">
                中评
            </a>
            <a class="weui-navbar__item font_color" href="#poor">
                <img src="/assets/img/poor.png" alt="" style="width:15px;margin-right:10px;">
                差评
            </a>
        </div>
        <%--<div class="weui-tab__bd">--%>
            <%--<div id="good" class="weui-tab__bd-item">--%>
                <%--<h1>dsfsdfsdfds</h1>--%>
            <%--</div>--%>
            <%--<div id="order" class="weui-tab__bd-item">--%>
                <%--<h1>页面二</h1>--%>
            <%--</div>--%>
            <%--<div id="poor" class="weui-tab__bd-item weui-tab__bd-item--active">--%>
                <%--<h1>页面三</h1>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell" >
            <div class="weui-cell__bd" >
                <textarea class="weui-textarea textarea" id="counts" placeholder="请输入您的意见" rows="3"></textarea>
                <div class="weui-textarea-counter"><span id="remainingwords">0</span>/100</div>
            </div>
        </div>
    </div>


    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>服务态度</p>
        </div>
        <div class="weui-cell__ft"></div>
    </div>

    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>送货速度</p>
        </div>
        <div class="weui-cell__ft">
            <ul>
                <li class="light"><a href="javascript:;">1</a></li>
                <li><a href="javascript:;">2</a></li>
                <li><a href="javascript:;">3</a></li>
                <li><a href="javascript:;">4</a></li>
                <li><a href="javascript:;">5</a></li>
            </ul>

        </div>
    </div>





</div>
<script>
    $(function(){
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            $(this).addClass('border_Evaluation_color').siblings('.border_Evaluation_color').removeClass('border_Evaluation_color');
            $(this).css("color",$(this).css("color"));
        });
    });
</script>
<script language="javascript" type="text/javascript">
    $("#counts").keyup(function(){
        if($("#counts").val().length > 100){
            $("#counts").val( $("#counts").val().substring(0,100) );
        }
        $("#remainingwords").text( 100 - $("#counts").val().length ) ;
    });
</script>

<script>
    var num=finalnum = tempnum= 0;
    var lis = document.getElementsByTagName("li");
    //num:传入点亮星星的个数
    //finalnum:最终点亮星星的个数
    //tempnum:一个中间值
    function fnShow(num) {
        finalnum= num || tempnum;//如果传入的num为0，则finalnum取tempnum的值
        for (var i = 0; i < lis.length; i++) {
            lis[i].className = i < finalnum? "light" : "";//点亮星星就是加class为light的样式
        }
    }
    for (var i = 1; i <= lis.length; i++) {
        lis[i - 1].index = i;
        lis[i - 1].onmouseover = function() { //鼠标经过点亮星星。
            fnShow(this.index);//传入的值为正，就是finalnum
        }
        lis[i - 1].onmouseout = function() { //鼠标离开时星星变暗
            fnShow(0);//传入值为0，finalnum为tempnum,初始为0
        }
        lis[i - 1].onclick = function() { //鼠标点击,同时会调用onmouseout,改变tempnum值点亮星星
            tempnum= this.index;
        }
    }
</script>
<%@include file="/user_footer.jsp"%>
