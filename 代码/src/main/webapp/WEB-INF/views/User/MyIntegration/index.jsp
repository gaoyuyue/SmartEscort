<%--
  Created by IntelliJ IDEA.
  User: Yzf
  Date: 2017/7/9/009
  Time: 12:29
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
            <a id="title">我的信用分</a>
            <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
        </div>

        <div class="page navbar js_show">
            <div class="page__bd">
                <div class="back_position">
                    <div style="position: relative;text-align: center">
                        <img class="img_position" src="/assets/img/circle.jpg">

                    </div>
                    <div class="button_sp_area navuser">
                        <a class="weui-btn weui-btn_mini weui-btn_primary open-popup button_style" data-target="#IntegrationRules" style="border-radius: 250px;background-color: white;color: black;border: 1px solid orange">
                            <span>信用分规则</span>
                        </a>
                    </div>

                    <div class="weui-cells">
                        <div class="weui-cells__title"><strong style="font-size: 16px;color: black">信用分变更记录</strong></div>
                        <div class="weui-cell weui-cell_access">
                            <div class="weui-cell__bd">订单完成</div>
                            <div style="font-size: 10px">
                                <span style="vertical-align:middle; font-size: 17px;">信用分+1</span>
                            </div>
                        </div>
                        <div class="weui-cell weui-cell_access">
                            <div class="weui-cell__bd">订单完成</div>
                            <div style="font-size: 10px">
                                <span style="vertical-align:middle; font-size: 17px;">信用分-1</span>
                            </div>
                        </div>
                        <div class="weui-cell weui-cell_access">
                            <div class="weui-cell__bd">订单完成</div>
                            <div style="font-size: 10px">
                                <span style="vertical-align:middle; font-size: 17px;">信用分+1</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="text_position" id="integration"></div>


        <div id="IntegrationRules" class='weui-popup__container'>
            <div class="weui-popup__overlay"></div>
            <div class="weui-popup__modal">
                <div class="top_other">
                    <span class="list_other"><a class="close-popup refresh_page"><img src="/assets/img/goback.png" align="top"></a></span>
                    <span ><a class="title_other">我的信用分</a></span>
                    <span><a class="logo_other show-warning update" href="/"><img src="/assets/img/home.png" align="top"></a></span>
                </div>
                <article class="weui-article">
                    <h1 style="color: black">信用分规则</h1>
                    <section>
                        <h2 class="title">章标题</h2>
                        <section>
                            <h3>1.1 节标题</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                consequat.
                            </p>
                        </section>
                        <section>
                            <h3>1.2 节标题</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                            </p>
                        </section>
                    </section>
                </article>
            </div>
        </div>

    </div>
</div>

<script>
    var success = function success(data) {
        $("#integration").text("");

        $("#integration").text(data.integration);
    };
    $(document).ready(function () {
        Get("/User/MyIntegration/information",success);
    });
</script>
<script src="/assets/js/fastclick.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
    <%--嵌套页面--%>
    $(document).on("open", ".weui-popup-modal", function() {
        console.log("open popup");
    }).on("close", ".weui-popup-modal", function() {
        console.log("close popup");
    });
</script>
            </div>
        </div>
    </div>
</div>
</body>
</html>
