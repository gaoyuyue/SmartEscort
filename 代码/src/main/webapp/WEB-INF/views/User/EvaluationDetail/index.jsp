<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/15/015
  Time: 15:57
  To change this template use File | Settings | File Templates.
  评价详情页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    .starShow{float:left;width:26px;height:20px;background:url(/assets/img/star.png) 0 -20px no-repeat;}
</style>
<div id="frame" style="background-color: #EFEFF4">
    <div id="top">
        <span id="list" style="color: white">
            <a href="/User/WaitingEvaluation/"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">发表评价</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>
    <div class="weui-cell" style="border-bottom:2px solid #cbcbcb;background-color: white">
        <div class="weui-cell__bd" style="font-size: 22px">
            <p>服务评价</p>
        </div>
    </div>
    <div id="childPage">
    </div>
</div>

<script>
    var publishDartId = localStorage["publishDartId"];
    var success = function success(data) {
        var userInformation = function userInformation(user) {
            if(user.userName==data.delegation.userName && data.delegationEvaluated == false){
                //委托人的评价页面
                $("#childPage").append(`
                        <div class="weui-cells">
                            <div class="weui-cell" style="padding: 18px 15px">
                                <div class="weui-cell__bd">
                                    <p>服务态度</p>
                                </div>
                                <div class="weui-cell__ft delegation_starName1" id="Service_attitude" score=0>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                </div>
                            </div>
                            <div class="weui-cell" style="padding: 18px 15px">
                                <div class="weui-cell__bd">
                                    <p>包裹完整度</p>
                                </div>
                                <div class="weui-cell__ft delegation_starName2" score=0>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                </div>
                            </div>
                            <div class="weui-cell" style="padding: 18px 15px">
                                <div class="weui-cell__bd">
                                    <p>配送速度</p>
                                </div>
                                <div class="weui-cell__ft delegation_starName3" score=0>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                    <a href="javascript:;" class="starShow"></a>
                                </div>
                            </div>
                        </div>

                        <div class="demos-content-padded">
                            <a class="weui-btn weui-btn_primary" id="postEvaluation">提交评价</a>
                        </div>
                `)

                var star1 = $(".delegation_starName1");
                var star2 = $(".delegation_starName2");
                var star3 = $(".delegation_starName3");
                showStar(star1);
                showStar(star2);
                showStar(star3);
                function showStar(showstar) {
                    var star = showstar.children('a');
                    var temp = 0;
                    for(var i = 0, len = star.length; i < len; i++){
                        star[i].index = i;
                        star[i].onmouseover = function(){
                            for(var i = 0, len = star.length; i < len; i++){
                                star[i].style.backgroundPosition = '0 -20px';
                            }
                        }
                        star[i].onclick = function(){
                            var score;
                            temp = this.index + 1;
                            for(var i = 0; i < temp; i++){
                                star[i].style.backgroundPosition = '0 0';
                            }
                            if(temp == 5){
                                score = 100;
                            } else if(temp == 4){
                                score = 80;
                            } else if(temp == 3){
                                score = 60;
                            } else if(temp == 2){
                                score = 40;
                            } else if(temp ==1){
                                score = 20;
                            } else if(temp == 0){
                                score = 0;
                            }
                            showstar.attr("score", score);
                        }
                    }
                }
                $("#postEvaluation").click(function () {
                    //                加权平均法
                    var score1 = $(".delegation_starName1").attr("score");
                    var score2 = $(".delegation_starName2").attr("score");
                    var score3 = $(".delegation_starName3").attr("score");
                    var weighted_Average = Sum(score1,score2,score3);
                    var theLastScore = JudgeScore(weighted_Average);   //最后分数
                    function JudgeScore(Weighted_Average) {
                        if(Weighted_Average >= 90 && Weighted_Average <=100){
                            return 5;
                        } else if(Weighted_Average >=80 && Weighted_Average < 90){
                            return 3;
                        } else if(Weighted_Average >= 60 && Weighted_Average < 80){
                            return 0;
                        } else if(Weighted_Average >= 40 && Weighted_Average < 60){
                            return -3;
                        } else {
                            return -5;
                        }
                    }
                    function Sum(score1,score2,score3){
                        return ((score1*0.2)+(score2*0.4)+(score3*0.4));
                    }
                    $.ajax({
                        url: "/User/EvaluationDetail/create/theLastScore/" + theLastScore + "/userName/" + data.agency.userName + "/publishDartId/" + publishDartId,
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(),
                        success: function () {
                            window.location.href = "/User/WaitingEvaluation/";
                        },
                        error: function (XMLHttpRequest) {

                        }
                    });

                });

            }else if(user.userName==data.agency.userName && data.agencyEvaluate == false){
                //代理人的评价页面
                $("#childPage").append(`
                    <div class="weui-cells">
                        <div class="weui-cell" style="padding: 18px 15px">
                            <div class="weui-cell__bd">
                                <p>服务态度</p>
                            </div>
                            <div class="weui-cell__ft agency_starName1" id="Service_attitude">
                                <a href="javascript:;" class="starShow"></a>
                                <a href="javascript:;" class="starShow"></a>
                                <a href="javascript:;" class="starShow"></a>
                                <a href="javascript:;" class="starShow"></a>
                                <a href="javascript:;" class="starShow"></a>
                            </div>
                        </div>
                        <div class="weui-cell" style="padding: 18px 15px">
                            <div class="weui-cell__bd">
                                <p>信息准确度</p>
                            </div>
                            <div class="weui-cell__ft agency_starName2">
                                <a href="javascript:;" class="starShow"></a>
                                <a href="javascript:;" class="starShow"></a>
                                <a href="javascript:;" class="starShow"></a>
                                <a href="javascript:;" class="starShow"></a>
                                <a href="javascript:;" class="starShow"></a>
                            </div>
                        </div>
                    </div>

                    <div class="demos-content-padded">
                        <a class="weui-btn weui-btn_primary" id="postEvaluation">提交评价</a>
                    </div>
                `);

                var star1 = $(".agency_starName1");
                var star2 = $(".agency_starName2");
                showStar(star1);
                showStar(star2);
                function showStar(showstar) {
                    var star = showstar.children('a');
                    var temp = 0;
                    for(var i = 0, len = star.length; i < len; i++){
                        star[i].index = i;
                        star[i].onmouseover = function(){
                            for(var i = 0, len = star.length; i < len; i++){
                                star[i].style.backgroundPosition = '0 -20px';
                            }
                        }
                        star[i].onclick = function(){
                            var score;
                            temp = this.index + 1;
                            for(var i = 0; i < temp; i++){
                                star[i].style.backgroundPosition = '0 0';
                            }
                            if(temp == 5){
                                score = 100;
                            } else if(temp == 4){
                                score = 80;
                            } else if(temp == 3){
                                score = 60;
                            } else if(temp == 2){
                                score = 40;
                            } else if(temp ==1){
                                score = 20;
                            } else if(temp == 0){
                                score = 0;
                            }
                            showstar.attr("score", score);
                        }
                    }
                }
                $("#postEvaluation").click(function () {
                    //                加权平均法
                    var score1 = $(".agency_starName1").attr("score");
                    var score2 = $(".agency_starName2").attr("score");
                    var weighted_Average = Sum(score1,score2);
                    var theLastScore = JudgeScore(weighted_Average);   //最后分数
                    function JudgeScore(Weighted_Average) {
                        if(Weighted_Average >= 90 && Weighted_Average <=100){
                            return 5;
                        } else if(Weighted_Average >=80 && Weighted_Average < 90){
                            return 3;
                        } else if(Weighted_Average >= 60 && Weighted_Average < 80){
                            return 0;
                        } else if(Weighted_Average >= 40 && Weighted_Average < 60){
                            return -3;
                        } else {
                            return -5;
                        }
                    }
                    function Sum(score1,score2){
                        return ((score1*0.4)+(score2*0.6));
                    }
                    $.ajax({
                        url: "/User/EvaluationDetail/create/theLastScore/" + theLastScore + "/userName/" + data.delegation.userName + "/publishDartId/" + publishDartId,
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(),
                        success: function () {
                            window.location.href = "/User/WaitingEvaluation/";
                        },
                        error: function (XMLHttpRequest) {

                        }
                    });

                });


            }
        };
        Get("/User/EvaluationDetail/userInformation",userInformation);
    };

    Get("/User/EvaluationDetail/dartDetail/publishDartId/"+publishDartId,success);

</script>

<script>
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>

<%--星星评分--%>
<script type="text/javascript">

</script>
<%@include file="/user_footer.jsp"%>
