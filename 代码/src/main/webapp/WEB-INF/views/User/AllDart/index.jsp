<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/26/026
  Time: 19:06
  To change this template use File | Settings | File Templates.
  全部订单页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<div id="frame">

    <div id="navbarSuspension">
        <div id="top">
            <span id="list">
                <a href="/User/PersonalCenter/"><img src="/assets/img/goback.png" align="top"></a>
            </span>
            <a id="title">订单管理</a>
            <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
        </div>
        <div class="page navbar js_show">
            <div class="page__bd">
                <div class="weui-tab">
                    <div class="weui-navbar">
                        <div class="weui-navbar__item weui-bar__item_on font_color">
                            <a href="/User/AllDart/" style="color:orange;" class="font_color">全部镖单</a>
                        </div>
                        <div class="weui-navbar__item font_color">
                            <a href="/User/MyPublish/" class="font_color">我的发布</a>
                        </div>
                        <div class="weui-navbar__item font_color">
                            <a href="/User/MyDart/" class="font_color">我的接单</a>
                        </div>
                        <div class="weui-navbar__item font_color">
                            <a href="/User/WaitingEvaluation/" class="font_color">待评价</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="weui-tab__panel">
        <div class="page__bd" style="height: 50%;margin-top: 100px">


        </div>
    </div>




</div>



<script type="text/javascript" class="navbar js_show">
    $(function(){
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            $(this).css("color",$(this).css("color"));
        });
    });


    /**
     * 悬浮框实现
     */
//    $(function(){
//        $('#navbarSuspension').posfixed({
//            distance : 0,
//            pos : 'top',
//            type : 'while',
//            hide : false
//        });
//
//        $('.gotop').posfixed({
//            distance : 10,
//            direction : 'bottom',
//            type : 'always',
//            tag : {
//                obj : $('.wrap'),
//                direction : 'right',
//                distance : 10
//            },
//            hide : true
//        });
//    });

//    var speed = 100;
//    var scrollTop = null;
//    var hold = 0;
//    var float_banner;
//    var pos = null;
//    var timer = null;
//    var moveHeight = null;
//    float_banner = document.getElementById("float_banner");
//    window.onscroll=scroll_ad;
//    function scroll_ad(){
//        scrollTop = document.documentElement.scrollTop+document.body.scrollTop;
//        pos = scrollTop - float_banner.offsetTop;
//        pos = pos/10
//        moveHeight = pos>0?Math.ceil(pos):Math.floor(pos);
//        if(moveHeight!=0){
//            float_banner.style.top = float_banner.offsetTop+moveHeight+"px";
//            setTimeout(scroll_ad,speed);
//        }
//    }
</script>

<%@include file="/user_footer.jsp"%>
