<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/26/026
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    a{
        text-decoration:none;
        color: black;
    }

    .more {
        margin: 0 auto;
        width: 93%;
        max-width: 500px;
        height: 30px;
        line-height: 30px;
        margin-top: 0px;
        margin-bottom: 20px;
        overflow: hidden;
        position: relative;
        cursor: pointer;
        text-align: center;
    }
    #navbarSuspension{
        position:fixed;
        margin: 0 auto;
        width:100%;
        height:40px;
        z-index:99;
    }
</style>

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
                        <div class="weui-navbar__item weui-bar__item_on">
                            <a href="/User/AllDart/" style="color:orange;">全部镖单</a>
                        </div>
                        <div class="weui-navbar__item">
                            <a href="/User/WaitingGoods/">我的发布</a>
                        </div>
                        <div class="weui-navbar__item">
                            <a href="/User/ReceivedDarts/">我的接单</a>
                        </div>
                        <div class="weui-navbar__item">
                            <a href="/User/WaitingEvaluation/">待评价</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="weui-tab__panel">
        <div class="page__bd" style="height: 50%;margin-top: 100px">
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">付款金额</label>
                        <em class="weui-form-preview__value">¥2400.00</em>
                    </div>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
                </div>
            </div>
            <br>
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <label class="weui-form-preview__label">付款金额</label>
                    <em class="weui-form-preview__value">¥2400.00</em>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">辅助操作</a>
                    <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</button>
                </div>
            </div>


            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">付款金额</label>
                        <em class="weui-form-preview__value">¥2400.00</em>
                    </div>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
                </div>
            </div>
            <br>
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <label class="weui-form-preview__label">付款金额</label>
                    <em class="weui-form-preview__value">¥2400.00</em>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">辅助操作</a>
                    <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</button>
                </div>
            </div>
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">付款金额</label>
                        <em class="weui-form-preview__value">¥2400.00</em>
                    </div>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
                </div>
            </div>
            <br>
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <label class="weui-form-preview__label">付款金额</label>
                    <em class="weui-form-preview__value">¥2400.00</em>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">辅助操作</a>
                    <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</button>
                </div>
            </div>
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">付款金额</label>
                        <em class="weui-form-preview__value">¥2400.00</em>
                    </div>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
                </div>
            </div>
            <br>
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <label class="weui-form-preview__label">付款金额</label>
                    <em class="weui-form-preview__value">¥2400.00</em>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">辅助操作</a>
                    <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</button>
                </div>
            </div>


            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">付款金额</label>
                        <em class="weui-form-preview__value">¥2400.00</em>
                    </div>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
                </div>
            </div>
            <br>
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <label class="weui-form-preview__label">付款金额</label>
                    <em class="weui-form-preview__value">¥2400.00</em>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">辅助操作</a>
                    <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</button>
                </div>
            </div>
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">付款金额</label>
                        <em class="weui-form-preview__value">¥2400.00</em>
                    </div>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
                </div>
            </div>
            <br>
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <label class="weui-form-preview__label">付款金额</label>
                    <em class="weui-form-preview__value">¥2400.00</em>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">商品</label>
                        <span class="weui-form-preview__value">电动打蛋机</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">名字名字名字</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">标题标题</label>
                        <span class="weui-form-preview__value">很长很长的名字很长很长的名字很长很长的名字很长很长的名字很长很长的名字</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">辅助操作</a>
                    <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</button>
                </div>
            </div>


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
    $(function(){
        $('#navbarSuspension').posfixed({
            distance : 0,
            pos : 'top',
            type : 'while',
            hide : false
        });

        $('.gotop').posfixed({
            distance : 10,
            direction : 'bottom',
            type : 'always',
            tag : {
                obj : $('.wrap'),
                direction : 'right',
                distance : 10
            },
            hide : true
        });
    });

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
