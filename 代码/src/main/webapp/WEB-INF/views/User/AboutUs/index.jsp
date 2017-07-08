<%--
  Created by IntelliJ IDEA.
  User: Yzf
  Date: 2017/7/8/008
  Time: 17:25
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
            <a id="title">关于我们</a>
            <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
        </div>
        <div class="page navbar js_show">
            <div class="page__bd">
                <div class="navn1" style="background-color: white">
                    <img class="img-circle navicon" id="headImageUrl" src="/assets/img/a5.jpg" style="width: 50px;height: 50px;display: block">
                    <p style="display: block;background-color: white;font-size: 13px">
                        <br>
                        递速达是全球第一个校园快递互助平台，用户只需要在微信服务号的发布界面发布自己的快递，即可坐在宿舍取到快递，同时，可以在领取自己的快递时，顺手领取他人的快递，达到互利共赢的模式。
                    </p>
                    <div class="weui-cells">
                        <div class="weui-cell">
                            <div class="weui-cell__bd">
                                <p>微信服务号</p>
                            </div>
                            <div class="weui-cell__ft">说明文字</div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__bd">
                                <p>开发人员</p>
                            </div>
                            <div class="weui-cell__ft"></div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd"><img src="/assets/img/a1.jpg" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui-cell__bd">
                                <p></p>
                            </div>
                            <div class="weui-cell__ft">严泽凡</div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd"><img src="/assets/img/a1.jpg" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui-cell__bd">
                                <p></p>
                            </div>
                            <div class="weui-cell__ft">高语越</div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd"><img src="/assets/img/a1.jpg" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui-cell__bd">
                                <p></p>
                            </div>
                            <div class="weui-cell__ft">胡建</div>
                        </div>
                        <div class="weui-cell">
                            <div class="weui-cell__hd"><img src="/assets/img/a1.jpg" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui-cell__bd">
                                <p></p>
                            </div>
                            <div class="weui-cell__ft">王雍皓</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="weui-msg__extra-area">
            <div class="weui-footer">
                <p class="weui-footer__links">
                    <a href="javascript:void(0);" class="weui-footer__link">智慧软件java组</a>
                </p>
                <p class="weui-footer__text">Copyright © 2017</p>
            </div>
        </div>
    </div>
</div>
<script src="/assets/js/fastclick.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>
            </div>
        </div>
    </div>
</div>
</body>
</html>