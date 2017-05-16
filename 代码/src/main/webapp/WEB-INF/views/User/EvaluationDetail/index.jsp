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
            <p>送货人姓名:<p id="agencyName"></p></p>
            <p style="font-size: 13px;color: #888888;"></p>
        </div>
    </div>
    <br>



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
        <div class="weui-cell__ft">
            <div class="gradecon">
                <ul class="rev_pro clearfix">
                    <li>
                        <div class="revinp">
				<span class="level">
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
				</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>送货速度</p>
        </div>
        <div class="weui-cell__ft">
            <div class="gradecon">
                <ul class="rev_pro clearfix">
                    <li>
                        <div class="revinp">
				<span class="level">
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
				</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips" style="background-color: #ff850e">提交评论</a>
    </div>
</div>

//控制评论字数
<script language="javascript" type="text/javascript">
    $("#counts").keyup(function(){
        if($("#counts").val().length > 100){
            $("#counts").val( $("#counts").val().substring(0,100) );
        }
        $("#remainingwords").text( 100 - $("#counts").val().length ) ;
    });
</script>

//点星星
<script type="text/javascript">
    $(function(){
        $(document).on('mouseover','i[cjmark]',function(){
            var num = $(this).index();
            var pmark = $(this).parents('.revinp');

            var list = $(this).parent().find('i');
            for(var i=0;i<=num;i++){
                list.eq(i).attr('class','level_solid');
            }
            for(var i=num+1,len=list.length-1;i<=len;i++){
                list.eq(i).attr('class','level_hollow');
            }
        })
    })
</script>

//获取送货人信息
<script>
    var success = function () {


       $("#agencyName").text("ssss");


    };
    $(document).ready(function () {
       Get("/User/EvaluationDetail/agency",success);
    });
</script>
<%@include file="/user_footer.jsp"%>
