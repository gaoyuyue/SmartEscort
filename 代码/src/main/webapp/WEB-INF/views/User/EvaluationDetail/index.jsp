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
    <%--<div class="weui-cells">--%>
        <div class="weui-cell" style="border-bottom:2px solid #cbcbcb;background-color: white">
            <div class="weui-cell__bd" style="font-size: 22px">
                <p>服务评价</p>
            </div>
        </div>
    <%--</div>--%>
    <div id="childPage">
    </div>
</div>

<script>
    var publishDartId = localStorage["publishDartId"];
    var success = function success(data) {
        var userInformation = function userInformation(user) {
            if(user.userName==data.delegation.userName){
                //委托人的评价页面
                $("#childPage").append(`
    <div class="weui-cells">
        <div class="weui-cell" style="padding: 18px 15px">
            <div class="weui-cell__bd">
                <p>服务态度</p>
            </div>
            <div class="weui-cell__ft" id="Service_attitude">
                <a href="javascript:;" class="starShow" name="starName_two"></a>
                <a href="javascript:;" class="starShow" name="starName_two"></a>
                <a href="javascript:;" class="starShow" name="starName_two"></a>
                <a href="javascript:;" class="starShow" name="starName_two"></a>
                <a href="javascript:;" class="starShow" name="starName_two"></a>
            </div>
        </div>
        <div class="weui-cell" style="padding: 18px 15px">
            <div class="weui-cell__bd">
                <p>包裹完整度</p>
            </div>
            <div class="weui-cell__ft">
                <a href="javascript:;" class="starShow" name="starName_three"></a>
                <a href="javascript:;" class="starShow" name="starName_three"></a>
                <a href="javascript:;" class="starShow" name="starName_three"></a>
                <a href="javascript:;" class="starShow" name="starName_three"></a>
                <a href="javascript:;" class="starShow" name="starName_three"></a>
            </div>
        </div>
        <div class="weui-cell" style="padding: 18px 15px">
            <div class="weui-cell__bd">
                <p>包裹完整度</p>
            </div>
            <div class="weui-cell__ft">
                <a href="javascript:;" class="starShow" name="starName"></a>
                <a href="javascript:;" class="starShow" name="starName"></a>
                <a href="javascript:;" class="starShow" name="starName"></a>
                <a href="javascript:;" class="starShow" name="starName"></a>
                <a href="javascript:;" class="starShow" name="starName"></a>
            </div>
        </div>
    </div>

    <div class="demos-content-padded">
        <a href="javascript:;" class="weui-btn weui-btn_primary">提交评价</a>
    </div>
        `)
            }else {
                //代理人的评价页面
                $("#childPage").append(`
    <div class="weui-cells">
        <div class="weui-cell" style="padding: 18px 15px">
            <div class="weui-cell__bd">
                <p>服务态度</p>
            </div>
            <div class="weui-cell__ft" id="Service_attitude">
                <a href="javascript:;" class="starShow" name="starName_two"></a>
                <a href="javascript:;" class="starShow" name="starName_two"></a>
                <a href="javascript:;" class="starShow" name="starName_two"></a>
                <a href="javascript:;" class="starShow" name="starName_two"></a>
                <a href="javascript:;" class="starShow" name="starName_two"></a>
            </div>
        </div>
        <div class="weui-cell" style="padding: 18px 15px">
            <div class="weui-cell__bd">
                <p>信息准确度</p>
            </div>
            <div class="weui-cell__ft">
                <a href="javascript:;" class="starShow" name="starName_three"></a>
                <a href="javascript:;" class="starShow" name="starName_three"></a>
                <a href="javascript:;" class="starShow" name="starName_three"></a>
                <a href="javascript:;" class="starShow" name="starName_three"></a>
                <a href="javascript:;" class="starShow" name="starName_three"></a>
            </div>
        </div>
    </div>

    <div class="demos-content-padded">
        <a href="javascript:;" class="weui-btn weui-btn_primary">提交评价</a>
    </div>
    `);

            }
        };
        Get("/User/AllDart/userInformation",userInformation);
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
    $(document).ready(function () {
        var star1 = document.getElementsByName('starName_two');
        var score1 = showStar(star1);
        var star2 = document.getElementsByName('starName_three');
        var score2 = showStar(star2);
        var star3 = document.getElementsByName('starName');
        var score3 = showStar(star3);
    });

   function showStar(star) {
       var temp = 0;
       for(var i = 0, len = star.length; i < len; i++){
           star[i].index = i;
           star[i].onmouseover = function(){
               clear();
               for(var j = 0; j < this.index + 1; j++){
                   star[j].style.backgroundPosition = '0 0';
               }
           }
           star[i].onmouseout = function(){
               for(var j = 0; j < this.index + 1; j++){
                   star[j].style.backgroundPosition = '0 -20px';
               }
               current(temp);
           }
           star[i].onclick = function(){
               temp = this.index + 1;
               current(temp);
               if(temp == 5){
                   return 100;
               } else if(temp == 4){
                   return 80;
               } else if(temp == 3){
                   return 60;
               } else if(temp == 2){
                   return 40;
               } else if(temp ==1){
                   return 20;
               } else if(temp == 0){
                   return 0;
               }
           }
       }
       //清除所有
       function clear(){
           for(var i = 0, len = star.length; i < len; i++){
               star[i].style.backgroundPosition = '0 -20px';
           }
       }
       //显示当前第几颗星
       function current(temp){
           for(var i = 0; i < temp; i++){
               star[i].style.backgroundPosition = '0 0';
           }
       }
   }
</script>
<%@include file="/user_footer.jsp"%>
