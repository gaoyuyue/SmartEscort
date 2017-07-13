<%--
  Created by IntelliJ IDEA.
  User: stevenjack
  Date: 2017/3/25/025
  Time: 10:42
  To change this template use File | Settings | File Templates.
  个人中心页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>

<!--页面-->
<div class="page badge js_show">
    <div class="navn1" >
        <img class="img-circle navicon" id="headImageUrl" style="width: 50px;height: 50px;display: block">
    </div>
    <div class="navn2" >
        <strong><p id="userName" class="navuser"></p></strong>
    </div>
    <div class="navn3" style="height: 35px">
        <%--<p style="font-size: 13px;color: #888888;" class="navuser">信用分</p>--%>
            <div class="button_sp_area navuser">
                <a href="/User/MyIntegration/" class="weui-btn_mini weui-btn_primary" style="border-radius: 100px;background-color: orange;border: 0;color: white">
                    <div>
                        <span>信用分:</span>
                        <span></span>
                        <span id="integration"></span>
                    </div>
                </a>
            </div>
    </div>

    <div class="page__hd">
        <div class="weui-grids" style="background-color: #ffffff">
            <a href="/User/MyPublish/" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="/assets/img/daishouhuo.png" alt="">
                    <span class="weui-badge" style="position: absolute;top: 0;right: 2em;" id="publishList"></span>
                </div>
                <p class="weui-grid__label">我的发布</p>
            </a>
            <a href="/User/MyDart/" class="weui-grid">
                <div class="weui-grid__icon">
                    <span class="weui-badge" style="position: absolute;top: 0;right: 2em;" id="myDartList"></span>
                    <img src="/assets/img/daijiebiao.png" alt="">
                </div>
                <p class="weui-grid__label">我的接单</p>
            </a>
            <a href="/User/WaitingEvaluation/" class="weui-grid">
                <div class="weui-grid__icon">
                    <span class="weui-badge" style="position: absolute;top: 0;right: 2em;" id="waitingEvaluationList"></span>
                    <img src="/assets/img/daipingjia.png" alt="">
                </div>
                <p class="weui-grid__label">待评价</p>
            </a>
        </div>
    </div>
    <div class="weui-cells">
        <div class="weui-cell weui-cell_access" onclick="window.location.href='/User/AllDart/'">
            <div class="weui-cell__bd">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-square fa-stack-2x" style="color: #5090cd"></i>
                  <i class="fa fa-list fa-stack-1x fa-inverse"></i>
                </span>
                <span style="vertical-align: middle" class="font_color">&nbsp;全部订单</span>
            </div>
            <div class="weui-cell__ft">查看全部订单</div>
        </div>
    </div>
    <div class="weui-cells">
        <div class="weui-cell weui-cell_access" onclick="window.location.href='/User/ManageAddress/'">
            <div class="weui-cell__bd">
                 <span class="fa-stack fa-lg">
                    <i class="fa fa-square fa-stack-2x" style="color: #89C6E4"></i>
                    <i class="fa fa-map-marker fa-stack-1x fa-inverse"></i>
                </span>
                <span style="vertical-align: middle" class="font_color">&nbsp;抵达地点</span>
            </div>
            <div class="weui-cell__ft">详细地址管理</div>
        </div>
        <div class="weui-cell weui-cell_access" onclick="window.location.href='/User/FeedBack/'">
            <div class="weui-cell__bd">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-square fa-stack-2x" style="color: #79C3F1"></i>
                    <i class="fa fa-comment fa-stack-1x fa-inverse"></i>
                </span>
                <span style="vertical-align: middle" class="font_color">&nbsp;意见反馈</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
        <%--<div class="weui-cell weui-cell_access" onclick="window.location.href='/User/Notice/'">--%>
            <%--<div class="weui-cell__bd">--%>
                <%--<span class="fa-stack fa-lg">--%>
                    <%--<i class="fa fa-square fa-stack-2x" style="color: #158C70"></i>--%>
                    <%--<i class="fa fa-envelope fa-stack-1x fa-inverse"></i>--%>
                <%--</span>--%>
                <%--<span style="vertical-align: middle" class="font_color">&nbsp;通知</span>--%>
                <%--<span class="weui-badge" style="margin-left: 5px; margin: auto;">8</span>--%>
            <%--</div>--%>
            <%--<div class="weui-cell__ft"></div>--%>
        <%--</div>--%>
    </div>

    <div class="weui-cells">
        <div class="weui-cell weui-cell_access" onclick="window.location.href='/User/UserInfomation/'">
            <div class="weui-cell__bd">
                 <span class="fa-stack fa-lg">
                    <i class="fa fa-square fa-stack-2x" style="color: #7FBBB4"></i>
                    <i class="fa fa-cog fa-stack-1x fa-inverse"></i>
                </span>
                <span style="vertical-align: middle" class="font_color">&nbsp;设置</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
        <div class="weui-cell weui-cell_access" onclick="window.location.href='/User/ContactCustomer/'">
            <div class="weui-cell__bd">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-square fa-stack-2x" style="color: #ADAAE4"></i>
                    <i class="fa fa-mobile fa-stack-1x fa-inverse"></i>
                </span>
                <span style="vertical-align: middle" class="font_color">&nbsp;联系客服</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
        <div class="weui-cell weui-cell_access" onclick="window.location.href='/User/AboutUs/'">
            <div class="weui-cell__bd">
                 <span class="fa-stack fa-lg">
                    <i class="fa fa-square fa-stack-2x" style="color: #bb514b"></i>
                    <i class="fa fa-thumbs-o-up fa-stack-1x fa-inverse"></i>
                </span>
                <span style="vertical-align: middle" class="font_color">&nbsp;关于我们</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
    </div>
</div>
<script>
    var success = function success(data) {
      $("#integration").text("");

      $("#integration").text(data.integration);
    };
    var packageList = function packageList(data) {
        $("#publishList").empty();
        $("#myDartList").empty();
        $("#waitingEvaluationList").empty();

        $("#publishList").text(data.myPublishCount);
        $("#myDartList").text(data.myDartCount);
        $("#waitingEvaluationList").text(data.waitingEvaluationCount);
    };

    $(document).ready(function () {
        Get("/User/MyIntegration/information",success);
        Get("/User/PersonalCenter/packageList",packageList);
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
    var fillUser = function(result) {
        $("#userName").text(result.name);
        $("#headImageUrl").prop("src",result.headImageUrl);
    };
    $(document).ready(function () {
        Get("/UserManagement/UserInfo", fillUser);
    });
</script>
<%@include file="/user_footer.jsp"%>
